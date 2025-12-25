/**
 * @file 退款请求实体类
 * @author Joker.X
 */
export class RefundOrderRequest {
  /**
   * 订单ID
   */
  orderId: number = 0;
  /**
   * 退款原因
   */
  reason: string = "";

  /**
   * @param {Partial<RefundOrderRequest>} init - 初始化数据
   */
  constructor(init?: Partial<RefundOrderRequest>) {
    if (!init) return;
    this.orderId = init.orderId ?? this.orderId;
    this.reason = init.reason ?? this.reason;
  }
}
