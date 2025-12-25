import { AppNavDestination } from "ui";
import AddressDetailViewModel from "../viewmodel/AddressDetailViewModel";

/**
 * @file 地址详情页面视图
 * @author Joker.X
 */
@ComponentV2
export struct AddressDetailPage {
  /**
   * 地址详情页面 ViewModel
   */
  @Local
  private vm: AddressDetailViewModel = new AddressDetailViewModel();

  /**
   * 构建地址详情页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "地址详情",
      viewModel: this.vm
    }) {
      this.AddressDetailContent();
    }
  }

  /**
   * 地址详情页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private AddressDetailContent() {
    Text("地址详情页面内容视图")
  }
}
