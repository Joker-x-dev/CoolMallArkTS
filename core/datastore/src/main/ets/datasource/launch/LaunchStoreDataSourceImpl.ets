import common from "@ohos.app.ability.common";
import preferences from "@ohos.data.preferences";
import { ContextUtil, PreferencesUtil } from "util";
import { LaunchStoreDataSource } from "./LaunchStoreDataSource";

/**
 * @file 启动流程本地存储数据源实现
 * @author Joker.X
 */
export class LaunchStoreDataSourceImpl implements LaunchStoreDataSource {
  /**
   * Preferences 工具实例
   */
  private prefs: PreferencesUtil;
  /**
   * Preferences 文件名
   */
  private static readonly PREFS_NAME: string = "launch_store";
  /**
   * 引导页展示状态缓存键
   */
  private static readonly KEY_GUIDE_SHOWN: string = "guide_shown";

  /**
   * 构造函数
   * @param {common.Context} [context] UIAbility 上下文
   */
  constructor(context?: common.Context) {
    const resolvedContext: common.Context = context ?? ContextUtil.getUIAbilityCtx();
    this.prefs = new PreferencesUtil(resolvedContext, LaunchStoreDataSourceImpl.PREFS_NAME);
  }

  /**
   * 保存引导页已展示状态
   * @param {boolean} shown - 是否已展示
   * @returns {Promise<void>} Promise<void>
   */
  async setGuideShown(shown: boolean): Promise<void> {
    await this.prefs.set(LaunchStoreDataSourceImpl.KEY_GUIDE_SHOWN, shown);
  }

  /**
   * 读取引导页已展示状态
   * @returns {Promise<boolean>} 是否已展示
   */
  async getGuideShown(): Promise<boolean> {
    const value: preferences.ValueType = await this.prefs.get(LaunchStoreDataSourceImpl.KEY_GUIDE_SHOWN, false);
    return typeof value === "boolean" ? value : false;
  }
}
