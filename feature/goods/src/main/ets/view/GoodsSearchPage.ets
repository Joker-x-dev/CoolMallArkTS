import { AppNavDestination } from "ui";
import GoodsSearchViewModel from "../viewmodel/GoodsSearchViewModel";

/**
 * @file 商品搜索页面视图
 * @author Joker.X
 */
@ComponentV2
export struct GoodsSearchPage {
  /**
   * 商品搜索页面 ViewModel
   */
  @Local
  private vm: GoodsSearchViewModel = new GoodsSearchViewModel();

  /**
   * 构建商品搜索页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "商品搜索",
      viewModel: this.vm
    }) {
      this.GoodsSearchContent();
    }
  }

  /**
   * 商品搜索页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private GoodsSearchContent() {
    Text("商品搜索页面内容视图")
  }
}
