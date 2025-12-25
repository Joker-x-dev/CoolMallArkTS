import { DictItem } from "../entity/DictItem";

/**
 * @file 字典数据响应
 * @author Joker.X
 */
export class DictDataResponse {
  /**
   * 订单取消原因字典
   */
  orderCancelReason?: DictItem[] | null = null;
  /**
   * 订单退款原因字典
   */
  orderRefundReason?: DictItem[] | null = null;
  /**
   * 反馈类型字典
   */
  feedbackType?: DictItem[] | null = null;

  constructor(init?: Partial<DictDataResponse>) {
    if (!init) {
      return;
    }
    this.orderCancelReason = init.orderCancelReason
      ? init.orderCancelReason.map((d) => new DictItem(d))
      : this.orderCancelReason;
    this.orderRefundReason = init.orderRefundReason
      ? init.orderRefundReason.map((d) => new DictItem(d))
      : this.orderRefundReason;
    this.feedbackType = init.feedbackType
      ? init.feedbackType.map((d) => new DictItem(d))
      : this.feedbackType;
  }
}
