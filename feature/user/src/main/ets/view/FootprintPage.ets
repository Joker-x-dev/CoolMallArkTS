import { AppNavDestination } from "ui";
import FootprintViewModel from "../viewmodel/FootprintViewModel";

/**
 * @file 足迹页面视图
 * @author Joker.X
 */
@ComponentV2
export struct FootprintPage {
  /**
   * 足迹页面 ViewModel
   */
  @Local
  private vm: FootprintViewModel = new FootprintViewModel();

  /**
   * 构建足迹页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "足迹",
      viewModel: this.vm
    }) {
      this.FootprintContent();
    }
  }

  /**
   * 足迹页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private FootprintContent() {
    Text("足迹页面内容视图")
  }
}
