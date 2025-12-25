import { AppNavDestination } from "ui";
import GoodsCommentViewModel from "../viewmodel/GoodsCommentViewModel";

/**
 * @file 商品评论页面视图
 * @author Joker.X
 */
@ComponentV2
export struct GoodsCommentPage {
  /**
   * 商品评论页面 ViewModel
   */
  @Local
  private vm: GoodsCommentViewModel = new GoodsCommentViewModel();

  /**
   * 构建商品评论页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "商品评论",
      viewModel: this.vm
    }) {
      this.GoodsCommentContent();
    }
  }

  /**
   * 商品评论页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private GoodsCommentContent() {
    Text("商品评论页面内容视图")
  }
}
