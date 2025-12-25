import { AppNavDestination } from "ui";
import GoodsDetailViewModel from "../viewmodel/GoodsDetailViewModel";

/**
 * @file 商品详情页面视图
 * @author Joker.X
 */
@ComponentV2
export struct GoodsDetailPage {
  /**
   * 商品详情页面 ViewModel
   */
  @Local
  private vm: GoodsDetailViewModel = new GoodsDetailViewModel();

  /**
   * 构建商品详情页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "商品详情",
      viewModel: this.vm
    }) {
      this.GoodsDetailContent();
    }
  }

  /**
   * 商品详情页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private GoodsDetailContent() {
    Text("商品详情页面内容视图")
  }
}
