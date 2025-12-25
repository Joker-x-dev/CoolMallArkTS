import { AppNavDestination } from "ui";
import CouponViewModel from "../viewmodel/CouponViewModel";

/**
 * @file 优惠券页面视图
 * @author Joker.X
 */
@ComponentV2
export struct CouponPage {
  /**
   * 优惠券页面 ViewModel
   */
  @Local
  private vm: CouponViewModel = new CouponViewModel();

  /**
   * 构建优惠券页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "优惠券",
      viewModel: this.vm
    }) {
      this.CouponContent();
    }
  }

  /**
   * 优惠券页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private CouponContent() {
    Text("优惠券页面内容视图")
  }
}
