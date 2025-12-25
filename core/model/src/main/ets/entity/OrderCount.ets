/**
 * @file 用户订单统计
 * @author Joker.X
 */
export class OrderCount {
  /**
   * 待付款订单数量
   */
  pendingPayment: number = 0;
  /**
   * 待发货订单数量
   */
  pendingShipment: number = 0;
  /**
   * 待收货订单数量
   */
  pendingReceive: number = 0;
  /**
   * 待评价订单数量
   */
  pendingReview: number = 0;
  /**
   * 退款中订单数量
   */
  refunding: number = 0;
  /**
   * 已退款订单数量
   */
  refunded: number = 0;

  constructor(init?: Partial<OrderCount>) {
    if (!init) {
      return;
    }
    this.pendingPayment = init.pendingPayment ?? this.pendingPayment;
    this.pendingShipment = init.pendingShipment ?? this.pendingShipment;
    this.pendingReceive = init.pendingReceive ?? this.pendingReceive;
    this.pendingReview = init.pendingReview ?? this.pendingReview;
    this.refunding = init.refunding ?? this.refunding;
    this.refunded = init.refunded ?? this.refunded;
  }
}
