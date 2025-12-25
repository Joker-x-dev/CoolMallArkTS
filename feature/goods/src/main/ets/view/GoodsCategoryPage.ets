import { AppNavDestination } from "ui";
import GoodsCategoryViewModel from "../viewmodel/GoodsCategoryViewModel";

/**
 * @file 商品分类页面视图
 * @author Joker.X
 */
@ComponentV2
export struct GoodsCategoryPage {
  /**
   * 商品分类页面 ViewModel
   */
  @Local
  private vm: GoodsCategoryViewModel = new GoodsCategoryViewModel();

  /**
   * 构建商品分类页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "商品分类",
      viewModel: this.vm
    }) {
      this.GoodsCategoryContent();
    }
  }

  /**
   * 商品分类页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private GoodsCategoryContent() {
    Text("商品分类页面内容视图")
  }
}
