import { Condition } from "./Condition";

/**
 * @file 优惠券信息
 * @author Joker.X
 */
export class Coupon {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 标题
   */
  title: string = "";
  /**
   * 描述
   */
  description: string = "";
  /**
   * 类型 0-满减
   */
  type: number = 0;
  /**
   * 金额
   */
  amount: number = 0.0;
  /**
   * 数量
   */
  num: number = 0;
  /**
   * 已领取
   */
  receivedNum: number = 0;
  /**
   * 开始时间
   */
  startTime?: string | null = null;
  /**
   * 结束时间
   */
  endTime?: string | null = null;
  /**
   * 状态 0-禁用 1-启用
   */
  status: number = 0;
  /**
   * 条件
   */
  condition?: Condition | null = null;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;
  /**
   * 使用状态 0-未使用 1-已使用 2-已过期（我的优惠券接口）
   */
  useStatus?: number | null = null;

  constructor(init?: Partial<Coupon>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.title = init.title ?? this.title;
    this.description = init.description ?? this.description;
    this.type = init.type ?? this.type;
    this.amount = init.amount ?? this.amount;
    this.num = init.num ?? this.num;
    this.receivedNum = init.receivedNum ?? this.receivedNum;
    this.startTime = init.startTime ?? this.startTime;
    this.endTime = init.endTime ?? this.endTime;
    this.status = init.status ?? this.status;
    this.condition = init.condition ? new Condition(init.condition) : this.condition;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
    this.useStatus = init.useStatus ?? this.useStatus;
  }
}
