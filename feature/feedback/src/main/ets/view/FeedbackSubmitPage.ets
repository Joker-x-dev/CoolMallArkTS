import { AppNavDestination } from "ui";
import FeedbackSubmitViewModel from "../viewmodel/FeedbackSubmitViewModel";

/**
 * @file 提交反馈页面视图
 * @author Joker.X
 */
@ComponentV2
export struct FeedbackSubmitPage {
  /**
   * 提交反馈页面 ViewModel
   */
  @Local
  private vm: FeedbackSubmitViewModel = new FeedbackSubmitViewModel();

  /**
   * 构建提交反馈页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "提交反馈",
      viewModel: this.vm
    }) {
      this.FeedbackSubmitContent();
    }
  }

  /**
   * 提交反馈页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private FeedbackSubmitContent() {
    Text("提交反馈页面内容视图")
  }
}
