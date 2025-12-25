/**
 * @file 领取优惠券请求参数
 * @author Joker.X
 */
export class ReceiveCouponRequest {
  /**
   * 优惠券ID
   */
  couponId: number = 0;

  /**
   * @param {Partial<ReceiveCouponRequest>} init - 初始化数据
   */
  constructor(init?: Partial<ReceiveCouponRequest>) {
    if (!init) return;
    this.couponId = init.couponId ?? this.couponId;
  }
}
