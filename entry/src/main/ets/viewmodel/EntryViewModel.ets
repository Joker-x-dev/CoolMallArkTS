import common from "@ohos.app.ability.common";
import { getBreakpointState, getWindowSafeAreaState } from "state";
import { WindowAdapter } from "../adapter/WindowAdapter";

/**
 * @file 应用入口 ViewModel，负责沉浸式窗口、安全区与断点监听初始化
 * @author Joker.X
 */

export default class EntryViewModel {
  /**
   * 窗口能力适配器
   */
  private readonly windowAdapter: WindowAdapter = new WindowAdapter(
    getWindowSafeAreaState(),
    getBreakpointState()
  );

  /**
   * 入口页面初始化
   * 由 EntryPage.aboutToAppear 调用，统一触发窗口相关初始化
   * @param {Context} context - 组件上下文
   * @returns {void} 无返回值
   */
  aboutToAppear(context: common.Context): void {
    this.windowAdapter.init(context);
  }

  /**
   * 入口页面销毁
   * 由 EntryPage.aboutToDisappear 调用，释放窗口监听
   * @returns {void} 无返回值
   */
  aboutToDisappear(): void {
    this.windowAdapter.dispose();
  }
}
