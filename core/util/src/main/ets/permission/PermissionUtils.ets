import { abilityAccessCtrl, PermissionRequestResult, Permissions, Want } from "@kit.AbilityKit";
import { bundleManager } from '@kit.AbilityKit';
import { Unknown } from "model";
import { ContextUtil } from "../context/ContextUtil";
import common from "@ohos.app.ability.common";

/**
 * 权限工具类
 * 提供常用权限的快捷申请方法
 * 需要调用 ContextUtil.init() 之后初始化
 */
export class PermissionUtils {
  private atManager: abilityAccessCtrl.AtManager;
  private context: common.UIAbilityContext;

  constructor() {
    this.atManager = abilityAccessCtrl.createAtManager();
    this.context = ContextUtil.getUIAbilityCtx();
  }

  /**
   * 检查单个权限是否已授权
   * @param {Permissions} permission 目标权限
   * @returns {Promise<boolean>} 是否已授权
   */
  private async checkPermissionGrant(permission: Permissions): Promise<boolean> {
    try {
      const bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION); // 获取包含应用信息的 BundleInfo，比如应用名称、应用包名、应用组件
      const appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;

      if (!appInfo.accessTokenId) {
        return false;
      }

      const grantStatus: abilityAccessCtrl.GrantStatus = await this.atManager.checkAccessToken(appInfo.accessTokenId, permission);
      return grantStatus === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED;
    } catch (error) {
      throw this.wrapError(error, "检查授权失败");
    }
  }

  /**
   * 申请权限，拒绝后并二次向用户申请授权
   * @param {Array<Permissions>} permissions 目标权限
   * @returns {Promise<boolean>} 是否已授权
   */
  private async requestPermissionsEasy(permissions: Array<Permissions>): Promise<boolean> {
    try {
      // 第一次请求权限
      let request: PermissionRequestResult = await this.atManager.requestPermissionsFromUser(this.context, permissions);
      let isGranted = request.authResults.every(status => status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);
      if (isGranted) return true;

      // 二次请求权限
      for (const permission of permissions) {
        if (!(await this.checkPermissionGrant(permission))) {
          const result = await this.atManager.requestPermissionOnSetting(this.context, [permission]);
          if (!result.every(status => status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED)) {
            return false;
          }
        }
      }
      return true;
    } catch (error) {
      throw this.wrapError(error, "申请权限失败");
    }
  }

  /**
   * 检查权限是否被永久拒绝
   * @param {Array<Permissions>} permissions 目标权限
   * @returns {Promise<boolean>} 是否已拒绝
   */
  private async checkPermissionPermanentlyDenied(permissions: Array<Permissions>): Promise<boolean> {
    // 通过检查是否可以再次请求权限来判断是否被永久拒绝
    try {
      for (const permission of permissions) {
        // 如果已经授权，跳过
        if (await this.checkPermissionGrant(permission)) {
          continue;
        }

        // 尝试请求权限，是否还能弹出授权窗口
        const result = await this.atManager.requestPermissionsFromUser(this.context, [permission]);
        const isGranted = result.authResults.every(status => status === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);

        if (!isGranted) {
          return true;
        }
      }
      return false;
    } catch (error) {
      throw this.wrapError(error, "检查权限是否被拒绝失败");
    }
  }

  /**
   * 跳转到应用权限设置页面
   * @returns {Promise<void>} void
   */
  private async openPermissionSettings(): Promise<void> {
    const want: Want = {
      bundleName: 'com.huawei.hmos.settings', // 设置应用的bundleName
      abilityName: 'com.huawei.hmos.settings.MainAbility', // 设置应用的abilityName
      uri: 'application_info_entry', // 目标页面地址
      parameters: { 'pushParams': ContextUtil.getUIAbilityCtx().abilityInfo.bundleName } // 当前应用的完整包名
    }
    return ContextUtil.getUIAbilityCtx().startAbility(want)
  }

  /**
   * 统一封装业务异常，附加上下文提示
   * @param {unknown} error 捕获的异常
   * @param {string} message 补充说明
   * @returns {Error} 包装后的异常
   */
  private wrapError(error: Unknown, message: string): Error {
    if (error instanceof Error) {
      error.message = `${message}：${error.message}`;
      return error;
    }
    return new Error(message);
  }

  /**
   * 处理权限申请结果的公共方法
   * 统一处理权限申请成功/失败的逻辑和用户提示
   *
   * @param {string} permissionName 权限名称（用于错误提示）
   * @param {(granted: boolean) => void} callback 权限申请结果回调
   * @param {Array<Permissions>} permissions 申请的权限
   */
  private async handlePermissionResult(permissionName: string, callback: (granted: boolean) => void, permissions: Array<Permissions>): Promise<void> {
    // 先检查是否已经获得所有权限
    let allGranted = true;
    for (const permission of permissions) {
      if (!(await this.checkPermissionGrant(permission))) {
        allGranted = false;
        break;
      }
    }

    if (allGranted) {
      callback(true);
      return;
    }

    // 申请权限
    const grantResult = await this.requestPermissionsEasy(permissions);

    if (grantResult) {
      callback(true);
    } else {
      // 检查是否被永久拒绝
      const isPermanentlyDenied = await this.checkPermissionPermanentlyDenied(permissions);
      if (isPermanentlyDenied) {
        //ToastUtil.showToast(`${permissionName}被永久拒绝，请手动授予`);
        // 跳转到权限设置页面
        this.openPermissionSettings();
      } else {
        //ToastUtil.showToast(`${permissionName}获取失败`);
      }
      callback(false);
    }
  }

  /**
   * 申请存储权限（读写用户存储）
   * 用法示例：PermissionUtils.requestStoragePermission() { granted => ... }
   * @param callback 权限申请结果回调
   */
  public async requestStoragePermission(callback: (granted: boolean) => void): Promise<void> {
    const permissions: Permissions[] = [
      "ohos.permission.READ_MEDIA",
      "ohos.permission.WRITE_MEDIA"
    ];
    await this.handlePermissionResult('存储权限', callback, permissions);
  }

  /**
   * 申请相机权限
   * 用法示例：PermissionUtils.requestCameraPermission() { granted => ... }
   * @param callback 权限申请结果回调
   */
  public async requestCameraPermission(callback: (granted: boolean) => void): Promise<void> {
    const permissions: Permissions[] = ["ohos.permission.CAMERA"];
    await this.handlePermissionResult('相机权限', callback, permissions);
  }

  /**
   * 申请录音权限
   * 用法示例：PermissionUtils.requestAudioPermission() { granted => ... }
   * @param callback 权限申请结果回调
   */
  public async requestAudioPermission(callback: (granted: boolean) => void): Promise<void> {
    const permissions: Permissions[] = ["ohos.permission.MICROPHONE"];
    await this.handlePermissionResult('录音权限', callback, permissions);
  }
}