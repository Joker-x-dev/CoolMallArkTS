import { notificationManager } from '@kit.NotificationKit';
import { ContextUtil } from "../context/ContextUtil";
import { wantAgent, WantAgent } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { ImageUtil } from '../image/ImageUtil';

/**
 * 通知工具类（按功能场景拆分命名空间）
 */
export namespace NotificationUtil {
  /**
   * 通知权限管理
   */
  export namespace Permission {
    /**
     * 查询当前应用通知使能状态
     * @returns {boolean} 返回true，表示允许发布通知；返回false，表示禁止发布通知
     */
    export function isEnabled(): boolean {
      return notificationManager.isNotificationEnabledSync();
    }

    /**
     * 申请通知授权（拉起授权弹窗）
     * 应用需要获取用户授权才能发送通知。在通知发布前调用该接口，可以拉起通知授权弹窗，让用户选择是否允许发送通知。使用Promise异步回调。
     * 使用该接口拉起通知授权弹窗后，如果用户拒绝授权，将无法使用该接口再次拉起弹窗。可以调用 openNotificationSettings 二次申请授权，拉起通知管理弹窗。
     * @param context
     * @returns {Promise<void>} void
     */
    export async function requestEnable(): Promise<void> {
      return await notificationManager.requestEnableNotification(ContextUtil.getUIAbilityCtx());
    }

    /**
     * 拉起应用的通知设置界面，该页面以半模态形式呈现，可用于设置通知开关、通知提醒方式等。使用Promise异步回调。
     * @param context
     * @returns {Promise<void>} void
     */
    export async function openSettings(): Promise<void> {
      return await notificationManager.openNotificationSettings(ContextUtil.getUIAbilityCtx());
    }

    /**
     * 申请通知权限,统一处理权限申请流程
     * @param callback 权限申请结果回调
     */
    export async function requestPermission(callback: (granted: boolean) => void): Promise<void> {
      if (isEnabled()) {
        callback(true);
      } else {
        requestEnable().then(() => callback(true)).catch(() => callback(false));
      }
    }
  }

  /**
   * 通知发送（支持多种类型）
   */
  export namespace Sender {
    /**
     * 发布普通文本通知
     * @param {NotificationBasicOptions} options 通知消息配置项
     * @returns {Promise<number>} number 返回通知ID
     */
    export async function sendText(options: NotificationBasicOptions): Promise<number> {
      const notificationId: number = Date.now(); // 通知ID基于时间戳生成，确保唯一性
      const basicContent: notificationManager.NotificationBasicContent = {
        title: options.mainTitle,
        text: options.mainContent
      }
      if (options.supplementaryContent || PresetNotificationConfig.supplementaryContent) {
        basicContent.additionalText = options.supplementaryContent ?? PresetNotificationConfig.supplementaryContent;
      }
      if (options.lockscreenDisplayImage || PresetNotificationConfig.lockscreenDisplayImage) {
        basicContent.lockscreenPicture = options.lockscreenDisplayImage ?? PresetNotificationConfig.lockscreenDisplayImage;
      }
      let notificationContent: notificationManager.NotificationContent = {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: basicContent
      }
      const notificationRequest = makeRequest(notificationId, options, notificationContent);
      await notificationManager.publish(notificationRequest);
      return notificationId
    }

    /**
     * 发布长文本通知
     * @param {NotificationLongTextOptions} options 通知消息配置项
     * @returns {Promise<number>} number 返回通知ID
     */
    export async function sendLongText(options: NotificationLongTextOptions): Promise<number> {
      const notificationId: number = Date.now(); // 通知ID基于时间戳生成，确保唯一性
      const longTextContent: notificationManager.NotificationLongTextContent = {
        title: options.mainTitle,
        text: options.mainContent,
        briefText: options.summaryText,
        longText: options.detailedLongContent,
        expandedTitle: options.expandedDisplayTitle
      }
      if (options.supplementaryContent || PresetNotificationConfig.supplementaryContent) {
        longTextContent.additionalText = options.supplementaryContent ?? PresetNotificationConfig.supplementaryContent;
      }
      if (options.lockscreenDisplayImage || PresetNotificationConfig.lockscreenDisplayImage) {
        longTextContent.lockscreenPicture = options.lockscreenDisplayImage ?? PresetNotificationConfig.lockscreenDisplayImage;
      }
      let notificationContent: notificationManager.NotificationContent = {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
        longText: longTextContent
      }
      const notificationRequest = makeRequest(notificationId, options, notificationContent);
      await notificationManager.publish(notificationRequest);
      return notificationId;
    }

    /**
     * 发布带有图片的通知
     * @param {NotificationPictureOptions} options 通知消息配置项
     * @returns {Promise<number>} number 返回通知ID
     */
    export async function sendPicture(options: NotificationPictureOptions): Promise<number> {
      const notificationId: number = Date.now(); // 通知ID基于时间戳生成，确保唯一性
      const pictureContent: notificationManager.NotificationPictureContent = {
        title: options.mainTitle,
        text: options.mainContent,
        briefText: options.summaryText,
        expandedTitle: options.expandedDisplayTitle,
        picture: options.attachedImage
      }
      if (options.supplementaryContent || PresetNotificationConfig.supplementaryContent) {
        pictureContent.additionalText = options.supplementaryContent ?? PresetNotificationConfig.supplementaryContent;
      }
      if (options.lockscreenDisplayImage || PresetNotificationConfig.lockscreenDisplayImage) {
        pictureContent.lockscreenPicture = options.lockscreenDisplayImage ?? PresetNotificationConfig.lockscreenDisplayImage;
      }
      let notificationContent: notificationManager.NotificationContent = {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: pictureContent
      }
      const notificationRequest = makeRequest(notificationId, options, notificationContent);
      await notificationManager.publish(notificationRequest);
      return notificationId;
    }

    /**
     * 发布多文本通知
     * @param {NotificationMultiLineOptions} options 通知消息配置项
     * @returns {Promise<number>} number 返回通知ID
     */
    export async function sendMultiLine(options: NotificationMultiLineOptions): Promise<number> {
      const notificationId: number = Date.now(); // 通知ID基于时间戳生成，确保唯一性
      const multiLineContent: notificationManager.NotificationMultiLineContent = {
        title: options.mainTitle,
        text: options.mainContent,
        briefText: options.summaryText,
        longTitle: options.expandedDisplayTitle,
        lines: options.multiLineContentList
      }
      if (options.supplementaryContent || PresetNotificationConfig.supplementaryContent) {
      multiLineContent.additionalText = options.supplementaryContent ?? PresetNotificationConfig.supplementaryContent;
    }
    if (options.lockscreenDisplayImage || PresetNotificationConfig.lockscreenDisplayImage) {
      multiLineContent.lockscreenPicture = options.lockscreenDisplayImage ?? PresetNotificationConfig.lockscreenDisplayImage;
    }
    let notificationContent: notificationManager.NotificationContent = {
      notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
      multiLine: multiLineContent
    }
    const notificationRequest = makeRequest(notificationId, options, notificationContent);
    await notificationManager.publish(notificationRequest);
    return notificationId;
  }

    /**
     * 发布模板的通知
     * @param {NotificationTemplateOptions} options 通知消息配置项
     * @returns {Promise<number>} number 返回通知ID
     */
    export async function sendTemplate(options: NotificationTemplateOptions): Promise<number> {
      const notificationId: number = Date.now(); // 通知ID基于时间戳生成，确保唯一性
      const basicContent: notificationManager.NotificationBasicContent = {
        title: options.mainTitle,
        text: options.mainContent,
      }
      if (options.supplementaryContent || PresetNotificationConfig.supplementaryContent) {
        basicContent.additionalText = options.supplementaryContent ?? PresetNotificationConfig.supplementaryContent;
      }
      if (options.lockscreenDisplayImage || PresetNotificationConfig.lockscreenDisplayImage) {
        basicContent.lockscreenPicture = options.lockscreenDisplayImage ?? PresetNotificationConfig.lockscreenDisplayImage;
      }
      let notificationContent: notificationManager.NotificationContent = {
        notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
        normal: basicContent
      }
      let template: notificationManager.NotificationTemplate = {
        name: 'downloadTemplate',
        data: { title: options.mainTitle, fileName: options.downloadFileName, progressValue: options.downloadProgress }
      }
      const notificationRequest = makeRequest(notificationId, options, notificationContent, template);
      await notificationManager.publish(notificationRequest);
      return notificationId;
    }

    /**
     * 构建通知请求对象
     * @param {number} notificationId 通知唯一ID
     * @param {NotificationOptions} options 自定义通知配置项
     * @param {notificationManager.NotificationContent} content 通知内容体
     * @param {notificationManager.NotificationTemplate} template 可选，通知模板（优先级高于options中的template）
     * @returns {notificationManager.NotificationRequest} 鸿蒙通知请求对象
     */
    function makeRequest(
      notificationId: number,
      options: NotificationOptions,
      content: notificationManager.NotificationContent,
      template?: notificationManager.NotificationTemplate
    ): notificationManager.NotificationRequest {
      // 初始化基础请求对象（必选字段：content）
      const request: notificationManager.NotificationRequest = { content };

      // ========== 基础标识/模板相关 ==========
      request.id = notificationId; // 通知唯一ID

      if (template) {
        request.template = template;
      }
      if (options.notificationTemplate || PresetNotificationConfig.notificationTemplate) {
        request.template = template ?? options.notificationTemplate ?? PresetNotificationConfig.notificationTemplate;
      }

      // ========== 通道 ==========
      if (options.channelType || PresetNotificationConfig.channelType) {
        request.notificationSlotType = options.channelType ?? PresetNotificationConfig.channelType; // 通知通道类型
      }

      // ========== 通知清除/角标相关 ==========
      request.tapDismissed = options.autoDismissOnTap ?? PresetNotificationConfig.autoDismissOnTap ?? false; // 点击是否自动清除（默认false）
      if (options.autoRemoveTime || PresetNotificationConfig.autoRemoveTime) {
        request.autoDeletedTime = options.autoRemoveTime ?? PresetNotificationConfig.autoRemoveTime; // 自动清除时间戳
      }
      if (options.notificationBadgeCount || PresetNotificationConfig.notificationBadgeCount) {
        request.badgeNumber = options.notificationBadgeCount ?? PresetNotificationConfig.notificationBadgeCount; // 角标显示数量
      }
      if (options.notificationBadgeStyle || PresetNotificationConfig.notificationBadgeStyle) {
        request.badgeIconStyle = options.notificationBadgeStyle ?? PresetNotificationConfig.notificationBadgeStyle; // 角标样式
      }

      // ========== 通知提醒/展示相关 ==========
      request.isAlertOnce = options.isOneTimeAlert ?? PresetNotificationConfig.isOneTimeAlert ?? false; // 是否仅单次提醒（默认false）
      request.isStopwatch = options.showElapsedTime ?? PresetNotificationConfig.showElapsedTime ?? false; // 是否显示已用时间（默认false）
      request.isCountDown = options.showCountdownTime ?? PresetNotificationConfig.showCountdownTime ?? false; // 是否显示倒计时（默认false）
      request.isFloatingIcon = options.showStatusBarIcon ?? PresetNotificationConfig.showStatusBarIcon ?? true; // 是否显示状态栏图标（默认true）

      // ========== 通知内容/资源相关 ==========
      if (options.label || PresetNotificationConfig.label) {
        request.label = options.label ?? PresetNotificationConfig.label; // 通知标签
      }
      if (options.actionButtons || PresetNotificationConfig.actionButtons) {
        request.actionButtons = options.actionButtons ?? PresetNotificationConfig.actionButtons; // 通知操作按钮（最多3个）
      }
      if (options.smallIcon || PresetNotificationConfig.smallIcon) {
        request.smallIcon = options.smallIcon ?? PresetNotificationConfig.smallIcon; // 通知小图标（≤100KB）
      }
      if (options.largeIcon || PresetNotificationConfig.largeIcon) {
        request.largeIcon = options.largeIcon ?? PresetNotificationConfig.largeIcon; // 通知大图标（≤100KB）
      }
      if (options.notificationGroupName || PresetNotificationConfig.notificationGroupName) {
        request.groupName = options.notificationGroupName ?? PresetNotificationConfig.notificationGroupName; // 通知组名称
      }
      if (options.uniqueNotificationId || PresetNotificationConfig.uniqueNotificationId) {
        request.appMessageId = options.uniqueNotificationId ?? PresetNotificationConfig.uniqueNotificationId; // 通知去重唯一标识
      }
      if (options.customNotificationSound || PresetNotificationConfig.customNotificationSound) {
        request.sound = options.customNotificationSound ?? PresetNotificationConfig.customNotificationSound; // 自定义通知铃声
      }
      if (options.extensionInfo || PresetNotificationConfig.extensionInfo) {
        request.extraInfo = options.extensionInfo ?? PresetNotificationConfig.extensionInfo; // 扩展参数
      }

      // ========== 通知交互/行为相关 ==========
      if (options.wantAgent ?? PresetNotificationConfig.wantAgent) {
        request.wantAgent = options.wantAgent ?? PresetNotificationConfig.wantAgent; // 点击通知触发的行为意图
      }
      if (options.removeRedirectWantAgent ?? PresetNotificationConfig.removeRedirectWantAgent) {
        request.removalWantAgent = options.removeRedirectWantAgent ?? PresetNotificationConfig.removeRedirectWantAgent; // 移除通知的重定向意图
      }

      // ========== 分布式通知相关 ==========
      if (options.distributedNotificationOption ?? PresetNotificationConfig.distributedNotificationOption) {
        request.distributedOption = options.distributedNotificationOption ?? PresetNotificationConfig.distributedNotificationOption; // 分布式通知配置
      }

      return request;
    }
  }

  /**
   * 通知生命周期管理
   */
  export namespace Manager {
    /**
     * 取消已发布的通知
     * 根据通知ID和标签取消已发布的通知，若标签为空，则取消与指定通知ID匹配的已发布通知。
     * @param {number} id 通知ID
     * @param {string} label 通知标签，默认为空
     * @returns {Promise<void>} void
     */
    export async function cancel(id: number, label?: string): Promise<void> {
      return notificationManager.cancel(id, label);
    }

    /**
     * 取消当前应用指定组下的通知
     * @param {string} groupName 通知组名称，此名称需要在发布通知时通过NotificationRequest对象指定。
     * @returns {Promise<void>} void
     */
    export async function cancelGroup(groupName: string): Promise<void> {
      return notificationManager.cancelGroup(groupName);
    }

    /**
     * 取消当前应用所有已发布的通知
     * @returns {Promise<void>} void
     */
    export async function cancelAll(): Promise<void> {
      return notificationManager.cancelAll();
    }

    /**
     * 设定角标个数
     * 在应用的桌面图标上呈现。
     * @param {number} badgeNumber 角标个数。当角标设定个数取值小于或等于0时，清除角标。取值大于99时，通知角标将显示99+。
     * @returns {Promise<void>} void
     */
    export async function setBadgeNumber(badgeNumber: number): Promise<void> {
      return notificationManager.setBadgeNumber(badgeNumber);
    }

    /**
     * 清空桌面角标
     * 在应用的桌面图标上呈现。
     * @returns {Promise<void>} void
     */
    export async function clearBadgeNumber(): Promise<void> {
      return setBadgeNumber(0);
    }

    /**
     * 获取当前应用未删除的通知数
     * @returns {Promise<number>} number
     */
    export async function getActiveCount(): Promise<number> {
      return notificationManager.getActiveNotificationCount();
    }

    /**
     * 获取当前应用未删除的通知列表
     * @returns {Promise<Array<NotificationRequest>>} 返回当前应用的通知列表。
     */
    export async function getActiveList(): Promise<Array<notificationManager.NotificationRequest>> {
      return notificationManager.getActiveNotifications();
    }
  }

  /**
   * 通知渠道管理
   */
  export namespace Channel {
    /**
     * 创建指定类型的通知渠道
     * @param {notificationManager.SlotType} type 要创建的通知渠道的类型
     * @returns {Promise<void>} void
     */
    export async function add(type: notificationManager.SlotType): Promise<void> {
      return notificationManager.addSlot(type);
    }

    /**
     * 获取指定类型的通知渠道
     * @param {notificationManager.SlotType} type 通知渠道类型，例如社交通信、服务提醒、内容咨询等类型。
     * @returns {Promise<notificationManager.NotificationSlot>} 返回通知渠道对象。
     */
    export async function get(type: notificationManager.SlotType): Promise<notificationManager.NotificationSlot> {
      return notificationManager.getSlot(type);
    }

    /**
     * 获取当前应用的所有通知渠道
     * @returns {Promise<notificationManager.NotificationSlot>} 返回通知渠道对象。
     */
    export async function getAll(): Promise<Array<notificationManager.NotificationSlot>> {
      return notificationManager.getSlots();
    }

    /**
     * 删除当前应用指定类型的通知渠道
     * @param {notificationManager.SlotType} type 通知渠道类型，例如社交通信、服务提醒、内容咨询等类型。
     * @returns {Promise<void>} void
     */
    export async function remove(type: notificationManager.SlotType): Promise<void> {
      return notificationManager.removeSlot(type);
    }

    /**
     * 删除当前应用所有的通知渠道
     * @returns {Promise<void>} void
     */
    export async function removeAll(): Promise<void> {
      return notificationManager.removeAllSlots();
    }
  }

  /**
   * 辅助工具方法
   */
  export namespace Tools {
    /**
     * 生成压缩的通知图片（≤2MB）
     * @param {Resource | image.PixelMap} src：未压缩的Resource图片或PixelMap对象
     * @returns {Promise<image.PixelMap>} 返回压缩后的PixelMap对象
     */
    export async function createCompressedImage(src: Resource | image.PixelMap): Promise<image.PixelMap> {
      const maxSize = 2 * 1024 * 1024;
      return ImageUtil.createCompressedPixelMap(src, maxSize);
    }

    /**
     * 生成压缩的通知图标（≤192KB）
     * @param {Resource | image.PixelMap} src：未压缩的Resource图片或PixelMap对象
     * @returns {Promise<image.PixelMap>} 返回压缩后的PixelMap对象
     */
    export async function createCompressedIcon(src: Resource | image.PixelMap): Promise<PixelMap> {
      const maxSize = 192 * 1024;
      return ImageUtil.createCompressedPixelMap(src, maxSize);
    }

    /**
     * 获取可拉起本应用的Want
     * @returns {Promise<WantAgent>} 返回WantAgent对象
     */
    export async function getSelfWantAgent(): Promise<WantAgent> {
      const context = ContextUtil.getUIAbilityCtx();
      const wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: context.abilityInfo.bundleName,
            moduleName: context.abilityInfo.moduleName,
            abilityName: context.abilityInfo.name,
            action: 'action_notice',
            entities: [],
            uri: '',
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY | wantAgent.OperationType.SEND_COMMON_EVENT,
        requestCode: 0,
        actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      };
      return wantAgent.getWantAgent(wantAgentInfo);
    }

    /**
     * 查询是否支持对应的通知模板
     * @param {string} templateName 模板名称。当前仅支持'downloadTemplate'。
     * @returns {Promise<boolean>} 返回true表示支持该模板；返回false表示不支持该模板。
     */
    export async function isSupportTemplate(templateName: string = 'downloadTemplate'): Promise<boolean> {
      return notificationManager.isSupportTemplate(templateName);
    }
  }

  /**
   * 预设通知配置
   * @param {Partial<NotificationBasicOptions>} configs 预设值的配置项
   */
  export function PresetConfig (configs: (config: Partial<NotificationBasicOptions>) => void) {
    configs(PresetNotificationConfig)
  }
}

export interface NotificationOptions {
  /** 通知通道类型 */
  channelType?: notificationManager.SlotType;

  /** 点击通知后是否自动清除 */
  autoDismissOnTap?: boolean;

  /** 通知自动清除的时间戳 */
  autoRemoveTime?: number;

  /** WantAgent（封装应用行为意图，点击通知时触发） */
  wantAgent?: WantAgent;

  /** 通知扩展参数 */
  extensionInfo?: Record<string, Object>;

  /** 是否仅触发一次通知提醒 */
  isOneTimeAlert?: boolean;

  /** 是否显示通知的已用时间 */
  showElapsedTime?: boolean;

  /** 是否显示通知的倒计时时间 */
  showCountdownTime?: boolean;

  /** 是否显示状态栏图标 */
  showStatusBarIcon?: boolean;

  /** 通知标签（用于分类/标识通知） */
  label?: string;

  /** 通知操作按钮（最多支持3个） */
  actionButtons?: Array<notificationManager.NotificationActionButton>;

  /** 通知小图标（可选，像素总字节数≤100KB，显示效果依赖设备/通知中心UI） */
  smallIcon?: image.PixelMap;

  /** 通知大图标（可选，像素总字节数≤100KB，显示效果依赖设备/通知中心UI） */
  largeIcon?: image.PixelMap;

  /** 通知组名称（用于分组展示同类通知） */
  notificationGroupName?: string;

  /** 通知模板（通知模板类型） */
  notificationTemplate?: notificationManager.NotificationTemplate;

  /** 分布式通知配置项（跨设备同步通知的选项） */
  distributedNotificationOption?: notificationManager.DistributedOptions;

  /** 移除通知时的重定向WantAgent（仅支持发布公共事件/跳转系统Service，不支持UIAbility） */
  removeRedirectWantAgent?: WantAgent;

  /** 应用图标角标显示的通知数量（未读通知数） */
  notificationBadgeCount?: number;

  /** 应用图标角标显示的样式（预留能力，暂未支持） */
  notificationBadgeStyle?: number;

  /** 通知唯一标识（用于通知去重，24小时内同一ID仅展示1条，重启/超期失效） */
  uniqueNotificationId?: string;

  /** 自定义通知铃声（需通过Push云侧获取自定义铃声权限后生效） */
  customNotificationSound?: string;
}

/**
 * 普通文本通知配置项（基础通知类型）
 */
export interface NotificationBasicOptions extends NotificationOptions {
  /** 通知主标题（不可为空字符串） */
  mainTitle: string;
  /** 通知核心内容（不可为空字符串） */
  mainContent: string;
  /** 通知补充内容（对核心内容的额外说明，可选） */
  supplementaryContent?: string;
  /** 通知在锁屏界面显示的图片（可选） */
  lockscreenDisplayImage?: image.PixelMap;
}

/**
 * 长文本通知配置项（适用于内容较长的文本通知）
 */
export interface NotificationLongTextOptions extends NotificationBasicOptions {
  /** 通知摘要文本（对长文本内容的总结，不可为空字符串） */
  summaryText: string;
  /** 通知完整长文本（展开后显示的全部内容，不可为空字符串） */
  detailedLongContent: string;
  /** 通知展开时显示的标题（不可为空字符串） */
  expandedDisplayTitle: string;
}

/**
 * 多行文本通知配置项（适用于多条文本列表式通知）
 */
export interface NotificationMultiLineOptions extends NotificationBasicOptions {
  /** 通知摘要文本（对多行内容的总结，不可为空字符串） */
  summaryText: string;
  /** 通知展开时显示的标题（不可为空字符串） */
  expandedDisplayTitle: string;
  /** 通知的多行文本内容列表（每行对应一条文本） */
  multiLineContentList: Array<string>;
}

/**
 * 带图片的通知配置项（含主图的富媒体通知）
 */
export interface NotificationPictureOptions extends NotificationBasicOptions {
  /** 通知摘要文本（对图片+文本内容的总结，不可为空字符串） */
  summaryText: string;
  /** 通知展开时显示的标题（不可为空字符串） */
  expandedDisplayTitle: string;
  /** 通知附加图片（核心富媒体内容，像素总字节数≤2MB） */
  attachedImage: image.PixelMap;
}

/**
 * 下载进度模板通知配置项（适用于文件下载类通知）
 */
export interface NotificationTemplateOptions extends NotificationBasicOptions {
  /** 下载文件名称（必填，标识下载的文件） */
  downloadFileName: string;
  /** 下载进度值（取值范围0-100，代表0%-100%的下载进度） */
  downloadProgress: number;
}

/**
 * 预设通知配置（默认配置）
 * 实现 NotificationBasicOptions 接口，包含基础通知的默认配置项
 */
const PresetNotificationConfig: Partial<NotificationBasicOptions> = {
  // ========== 基础通知通道/时间相关 ==========
  /** 通知通道类型（默认：服务类信息通知） */
  channelType: notificationManager.SlotType.SERVICE_INFORMATION,

  // ========== 通知清除/角标相关 ==========
  /** 点击通知后是否自动清除（默认：不自动清除） */
  autoDismissOnTap: false,
  /** 通知自动清除时间戳（毫秒级，可选；需大于0才会显示角标） */
  autoRemoveTime: undefined,
  /** 应用图标角标显示的未读通知数（默认：1；需autoRemoveTime>0才显示） */
  notificationBadgeCount: 1,
  /** 通知角标样式类型（可选，鸿蒙系统定义的角标展示样式，值为数字枚举，预留能力，暂未支持） */
  notificationBadgeStyle: undefined,

  // ========== 通知交互/行为相关 ==========
  /** 点击通知触发的行为意图（可选） */
  wantAgent: undefined,
  /** 移除通知时的重定向行为意图（可选；仅支持公共事件/系统Service） */
  removeRedirectWantAgent: undefined,
  /** 通知操作按钮（最多3个，可选） */
  actionButtons: undefined,

  // ========== 通知提醒/展示相关 ==========
  /** 是否仅触发一次通知提醒（默认：多次提醒） */
  isOneTimeAlert: false,
  /** 是否显示通知已用时间（秒表样式，默认：不显示） */
  showElapsedTime: false,
  /** 是否显示通知倒计时时间（默认：不显示） */
  showCountdownTime: false,
  /** 是否显示状态栏图标（默认：显示） */
  showStatusBarIcon: true,

  // ========== 通知内容/资源相关 ==========
  /** 通知标签（用于分类，可选） */
  label: undefined,
  /** 通知扩展参数（可选） */
  extensionInfo: undefined,
  /** 通知小图标（可选，≤100KB，显示效果依赖设备） */
  smallIcon: undefined,
  /** 通知大图标（可选，≤100KB，显示效果依赖设备） */
  largeIcon: undefined,
  /** 通知组名称（用于分组展示，可选） */
  notificationGroupName: undefined,
  /** 通知模板类型（可选，鸿蒙内置模板） */
  notificationTemplate: undefined,
  /** 分布式通知配置（跨设备同步，可选） */
  distributedNotificationOption: undefined,
  /** 通知唯一标识（用于去重，可选；24小时内同一ID仅展示1条） */
  uniqueNotificationId: undefined,
  /** 自定义通知铃声（可选；需Push云侧权限生效） */
  customNotificationSound: undefined,

  // ========== 基础文本通知补充项 ==========
  /** 通知补充内容（对主内容的额外说明，可选） */
  supplementaryContent: undefined,
  /** 锁屏界面显示的图片（可选） */
  lockscreenDisplayImage: undefined
};