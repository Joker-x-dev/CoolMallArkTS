import { AppNavDestination } from "ui";
import OrderCommentViewModel from "../viewmodel/OrderCommentViewModel";

/**
 * @file 订单评论页面视图
 * @author Joker.X
 */
@ComponentV2
export struct OrderCommentPage {
  /**
   * 订单评论页面 ViewModel
   */
  @Local
  private vm: OrderCommentViewModel = new OrderCommentViewModel();

  /**
   * 构建订单评论页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "订单评论",
      viewModel: this.vm
    }) {
      this.OrderCommentContent();
    }
  }

  /**
   * 订单评论页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private OrderCommentContent() {
    Text("订单评论页面内容视图")
  }
}
