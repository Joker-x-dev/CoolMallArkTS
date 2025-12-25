import { AppNavDestination } from "ui";
import OrderLogisticsViewModel from "../viewmodel/OrderLogisticsViewModel";

/**
 * @file 订单物流页面视图
 * @author Joker.X
 */
@ComponentV2
export struct OrderLogisticsPage {
  /**
   * 订单物流页面 ViewModel
   */
  @Local
  private vm: OrderLogisticsViewModel = new OrderLogisticsViewModel();

  /**
   * 构建订单物流页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "订单物流",
      viewModel: this.vm
    }) {
      this.OrderLogisticsContent();
    }
  }

  /**
   * 订单物流页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private OrderLogisticsContent() {
    Text("订单物流页面内容视图")
  }
}
