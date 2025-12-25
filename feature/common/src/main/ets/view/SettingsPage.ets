import { AppNavDestination } from "ui";
import SettingsViewModel from "../viewmodel/SettingsViewModel";

/**
 * @file 设置页面视图
 * @author Joker.X
 */
@ComponentV2
export struct SettingsPage {
  /**
   * 设置页面 ViewModel
   */
  @Local
  private vm: SettingsViewModel = new SettingsViewModel();

  /**
   * 构建设置页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "设置",
      viewModel: this.vm
    }) {
      this.SettingsContent();
    }
  }

  /**
   * 设置页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private SettingsContent() {
    Text("设置页面内容视图")
  }
}
