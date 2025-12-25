import { AppNavDestination } from "ui";
import OrderConfirmViewModel from "../viewmodel/OrderConfirmViewModel";

/**
 * @file 订单确认页面视图
 * @author Joker.X
 */
@ComponentV2
export struct OrderConfirmPage {
  /**
   * 订单确认页面 ViewModel
   */
  @Local
  private vm: OrderConfirmViewModel = new OrderConfirmViewModel();

  /**
   * 构建订单确认页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "订单确认",
      viewModel: this.vm
    }) {
      this.OrderConfirmContent();
    }
  }

  /**
   * 订单确认页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private OrderConfirmContent() {
    Text("订单确认页面内容视图")
  }
}
