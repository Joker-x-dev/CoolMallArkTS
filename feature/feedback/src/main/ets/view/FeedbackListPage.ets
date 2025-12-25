import { AppNavDestination } from "ui";
import FeedbackListViewModel from "../viewmodel/FeedbackListViewModel";

/**
 * @file 反馈列表页面视图
 * @author Joker.X
 */
@ComponentV2
export struct FeedbackListPage {
  /**
   * 反馈列表页面 ViewModel
   */
  @Local
  private vm: FeedbackListViewModel = new FeedbackListViewModel();

  /**
   * 构建反馈列表页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "反馈列表",
      viewModel: this.vm
    }) {
      this.FeedbackListContent();
    }
  }

  /**
   * 反馈列表页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private FeedbackListContent() {
    Text("反馈列表页面内容视图")
  }
}
