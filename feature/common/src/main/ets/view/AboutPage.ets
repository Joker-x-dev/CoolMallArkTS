import { AppNavDestination } from "ui";
import AboutViewModel from "../viewmodel/AboutViewModel";

/**
 * @file 关于我们页面视图
 * @author Joker.X
 */
@ComponentV2
export struct AboutPage {
  /**
   * 关于我们页面 ViewModel
   */
  @Local
  private vm: AboutViewModel = new AboutViewModel();

  /**
   * 构建关于我们页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "关于我们",
      viewModel: this.vm
    }) {
      this.AboutContent();
    }
  }

  /**
   * 关于我们页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private AboutContent() {
    Text("关于我们页面内容视图")
  }
}
