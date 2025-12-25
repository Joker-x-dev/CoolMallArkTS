import { AppNavDestination } from "ui";
import AddressListViewModel from "../viewmodel/AddressListViewModel";

/**
 * @file 地址列表页面视图
 * @author Joker.X
 */
@ComponentV2
export struct AddressListPage {
  /**
   * 地址列表页面 ViewModel
   */
  @Local
  private vm: AddressListViewModel = new AddressListViewModel();

  /**
   * 构建地址列表页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "地址列表",
      viewModel: this.vm
    }) {
      this.AddressListContent();
    }
  }

  /**
   * 地址列表页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private AddressListContent() {
    Text("地址列表页面内容视图")
  }
}
