import { AppNavDestination } from "ui";
import OrderRefundViewModel from "../viewmodel/OrderRefundViewModel";

/**
 * @file 订单退款页面视图
 * @author Joker.X
 */
@ComponentV2
export struct OrderRefundPage {
  /**
   * 订单退款页面 ViewModel
   */
  @Local
  private vm: OrderRefundViewModel = new OrderRefundViewModel();

  /**
   * 构建订单退款页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "订单退款",
      viewModel: this.vm
    }) {
      this.OrderRefundContent();
    }
  }

  /**
   * 订单退款页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private OrderRefundContent() {
    Text("订单退款页面内容视图")
  }
}
