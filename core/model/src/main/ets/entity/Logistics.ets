import { LogisticsItem } from "./LogisticsItem";

/**
 * @file 物流信息实体类
 * @author Joker.X
 */
export class Logistics {
  /**
   * 物流单号
   */
  number?: string | null = null;
  /**
   * 物流公司类型
   */
  type?: string | null = null;
  /**
   * 物流轨迹列表
   */
  list?: LogisticsItem[] | null = null;
  /**
   * 配送状态
   */
  deliverystatus?: string | null = null;
  /**
   * 是否签收
   */
  issign?: string | null = null;
  /**
   * 快递公司名称
   */
  expName?: string | null = null;
  /**
   * 快递公司官网
   */
  expSite?: string | null = null;
  /**
   * 快递公司电话
   */
  expPhone?: string | null = null;
  /**
   * 快递公司logo
   */
  logo?: string | null = null;
  /**
   * 快递员姓名
   */
  courier?: string | null = null;
  /**
   * 快递员电话
   */
  courierPhone?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;
  /**
   * 耗时
   */
  takeTime?: string | null = null;

  constructor(init?: Partial<Logistics>) {
    if (!init) {
      return;
    }
    this.number = init.number ?? this.number;
    this.type = init.type ?? this.type;
    this.list = init.list ? init.list.map((i) => new LogisticsItem(i)) : this.list;
    this.deliverystatus = init.deliverystatus ?? this.deliverystatus;
    this.issign = init.issign ?? this.issign;
    this.expName = init.expName ?? this.expName;
    this.expSite = init.expSite ?? this.expSite;
    this.expPhone = init.expPhone ?? this.expPhone;
    this.logo = init.logo ?? this.logo;
    this.courier = init.courier ?? this.courier;
    this.courierPhone = init.courierPhone ?? this.courierPhone;
    this.updateTime = init.updateTime ?? this.updateTime;
    this.takeTime = init.takeTime ?? this.takeTime;
  }
}
