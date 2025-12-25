import { AppNavDestination } from "ui";
import GuideViewModel from "../viewmodel/GuideViewModel";

/**
 * @file 引导页视图
 * @author Joker.X
 */
@ComponentV2
export struct GuidePage {
  /**
   * 引导页 ViewModel
   */
  @Local
  private vm: GuideViewModel = new GuideViewModel();

  /**
   * 构建引导页
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "引导页",
      viewModel: this.vm
    }) {
      this.GuideContent();
    }
  }

  /**
   * 引导页内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private GuideContent() {
    Text("引导页内容视图")
  }
}
