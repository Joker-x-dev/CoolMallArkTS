/**
 * @file 优惠券条件
 * @author Joker.X
 */
export class Condition {
  /**
   * 满多少金额
   */
  fullAmount: number = 0.0;

  constructor(init?: Partial<Condition>) {
    if (!init) {
      return;
    }
    this.fullAmount = init.fullAmount ?? this.fullAmount;
  }
}
