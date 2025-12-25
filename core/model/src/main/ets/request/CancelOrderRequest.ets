/**
 * @file 取消订单请求模型
 * @author Joker.X
 */
export class CancelOrderRequest {
  /**
   * 订单ID
   */
  orderId: number = 0;
  /**
   * 取消原因
   */
  remark: string = "";

  /**
   * @param {Partial<CancelOrderRequest>} init - 初始化数据
   */
  constructor(init?: Partial<CancelOrderRequest>) {
    if (!init) return;
    this.orderId = init.orderId ?? this.orderId;
    this.remark = init.remark ?? this.remark;
  }
}
