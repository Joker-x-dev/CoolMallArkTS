import { AppNavDestination } from "ui";
import OrderDetailViewModel from "../viewmodel/OrderDetailViewModel";

/**
 * @file 订单详情页面视图
 * @author Joker.X
 */
@ComponentV2
export struct OrderDetailPage {
  /**
   * 订单详情页面 ViewModel
   */
  @Local
  private vm: OrderDetailViewModel = new OrderDetailViewModel();

  /**
   * 构建订单详情页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "订单详情",
      viewModel: this.vm
    }) {
      this.OrderDetailContent();
    }
  }

  /**
   * 订单详情页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private OrderDetailContent() {
    Text("订单详情页面内容视图")
  }
}
