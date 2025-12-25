import { AppNavDestination } from "ui";
import WebViewModel from "../viewmodel/WebViewModel";

/**
 * @file 网页页面视图
 * @author Joker.X
 */
@ComponentV2
export struct WebPage {
  /**
   * 网页页面 ViewModel
   */
  @Local
  private vm: WebViewModel = new WebViewModel();

  /**
   * 构建网页页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "网页",
      viewModel: this.vm
    }) {
      this.WebContent();
    }
  }

  /**
   * 网页页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private WebContent() {
    Text("网页页面内容视图")
  }
}
