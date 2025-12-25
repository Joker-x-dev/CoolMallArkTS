import { Address } from "./Address";
import { Coupon } from "./Coupon";

/**
 * @file 确认订单页面数据
 * @author Joker.X
 */
export class ConfirmOrder {
  /**
   * 默认收货地址
   */
  defaultAddress?: Address | null = null;
  /**
   * 用户拥有的优惠券
   */
  userCoupon?: Coupon[] | null = null;

  constructor(init?: Partial<ConfirmOrder>) {
    if (!init) {
      return;
    }
    this.defaultAddress = init.defaultAddress ? new Address(init.defaultAddress) : this.defaultAddress;
    this.userCoupon = init.userCoupon ? init.userCoupon.map((c) => new Coupon(c)) : this.userCoupon;
  }
}
