import { AppNavDestination } from "ui";
import OrderPayViewModel from "../viewmodel/OrderPayViewModel";

/**
 * @file 订单支付页面视图
 * @author Joker.X
 */
@ComponentV2
export struct OrderPayPage {
  /**
   * 订单支付页面 ViewModel
   */
  @Local
  private vm: OrderPayViewModel = new OrderPayViewModel();

  /**
   * 构建订单支付页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "订单支付",
      viewModel: this.vm
    }) {
      this.OrderPayContent();
    }
  }

  /**
   * 订单支付页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private OrderPayContent() {
    Text("订单支付页面内容视图")
  }
}
