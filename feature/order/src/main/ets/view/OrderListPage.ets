import { AppNavDestination } from "ui";
import OrderListViewModel from "../viewmodel/OrderListViewModel";

/**
 * @file 订单列表页面视图
 * @author Joker.X
 */
@ComponentV2
export struct OrderListPage {
  /**
   * 订单列表页面 ViewModel
   */
  @Local
  private vm: OrderListViewModel = new OrderListViewModel();

  /**
   * 构建订单列表页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "订单列表",
      viewModel: this.vm
    }) {
      this.OrderListContent();
    }
  }

  /**
   * 订单列表页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private OrderListContent() {
    Text("订单列表页面内容视图")
  }
}
