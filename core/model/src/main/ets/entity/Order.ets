import { Address } from "./Address";
import { Logistics } from "./Logistics";
import { OrderGoods } from "./OrderGoods";

/**
 * @file 订单信息
 * @author Joker.X
 */
export class Order {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 用户ID
   */
  userId: number = 0;
  /**
   * 标题
   */
  title?: string | null = null;
  /**
   * 支付方式 0-待支付 1-微信 2-支付宝
   */
  payType: number = 0;
  /**
   * 支付时间
   */
  payTime?: string | null = null;
  /**
   * 订单号
   */
  orderNum: string = "";
  /**
   * 状态 0-待付款 1-待发货 2-待收货 3-待评价 4-交易完成 5-退款中 6-已退款 7-已关闭
   */
  status: number = 0;
  /**
   * 价格
   */
  price: number = 0;
  /**
   * 优惠金额
   */
  discountPrice: number = 0;
  /**
   * 实际支付金额
   */
  realPrice: number = 0;
  /**
   * 优惠来源
   */
  discountSource?: DiscountSource | null = null;
  /**
   * 地址
   */
  address?: Address | null = null;
  /**
   * 物流信息
   */
  logistics?: Logistics | null = null;
  /**
   * 退款
   */
  refund?: Refund | null = null;
  /**
   * 退款状态
   */
  refundStatus?: number | null = null;
  /**
   * 退款申请时间
   */
  refundApplyTime?: string | null = null;
  /**
   * 备注
   */
  remark?: string | null = null;
  /**
   * 关闭备注
   */
  closeRemark?: string | null = null;
  /**
   * 已开票: 0-未开票 1-已开票
   */
  invoice: number = 0;
  /**
   * 微信类型 0-小程序 1-公众号 2-App
   */
  wxType: number = 0;
  /**
   * 订单商品列表
   */
  goodsList?: OrderGoods[] | null = null;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<Order>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.userId = init.userId ?? this.userId;
    this.title = init.title ?? this.title;
    this.payType = init.payType ?? this.payType;
    this.payTime = init.payTime ?? this.payTime;
    this.orderNum = init.orderNum ?? this.orderNum;
    this.status = init.status ?? this.status;
    this.price = init.price ?? this.price;
    this.discountPrice = init.discountPrice ?? this.discountPrice;
    this.realPrice = init.realPrice ?? this.realPrice;
    this.discountSource = init.discountSource ? new DiscountSource(init.discountSource) : this.discountSource;
    this.address = init.address ? new Address(init.address) : this.address;
    this.logistics = init.logistics ? new Logistics(init.logistics) : this.logistics;
    this.refund = init.refund ? new Refund(init.refund) : this.refund;
    this.refundStatus = init.refundStatus ?? this.refundStatus;
    this.refundApplyTime = init.refundApplyTime ?? this.refundApplyTime;
    this.remark = init.remark ?? this.remark;
    this.closeRemark = init.closeRemark ?? this.closeRemark;
    this.invoice = init.invoice ?? this.invoice;
    this.wxType = init.wxType ?? this.wxType;
    this.goodsList = init.goodsList ? init.goodsList.map((g) => new OrderGoods(g)) : this.goodsList;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}

/**
 * 优惠来源
 */
export class DiscountSource {
  /**
   * 类型 0-优惠券
   */
  type?: number | null = null;
  /**
   * 对象ID
   */
  objectId?: number | null = null;
  /**
   * 优惠信息
   */
  info?: DiscountInfo | null = null;

  constructor(init?: Partial<DiscountSource>) {
    if (!init) {
      return;
    }
    this.type = init.type ?? this.type;
    this.objectId = init.objectId ?? this.objectId;
    this.info = init.info ? new DiscountInfo(init.info) : this.info;
  }
}

/**
 * 优惠信息详情
 */
export class DiscountInfo {
  /**
   * ID
   */
  id?: number | null = null;
  /**
   * 数量
   */
  num?: number | null = null;
  /**
   * 类型
   */
  type?: number | null = null;
  /**
   * 标题
   */
  title?: string | null = null;
  /**
   * 描述
   */
  description?: string | null = null;
  /**
   * 金额
   */
  amount?: number | null = null;
  /**
   * 最低消费
   */
  minAmount?: number | null = null;
  /**
   * 开始时间
   */
  startTime?: string | null = null;
  /**
   * 结束时间
   */
  endTime?: string | null = null;

  constructor(init?: Partial<DiscountInfo>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.num = init.num ?? this.num;
    this.type = init.type ?? this.type;
    this.title = init.title ?? this.title;
    this.description = init.description ?? this.description;
    this.amount = init.amount ?? this.amount;
    this.minAmount = init.minAmount ?? this.minAmount;
    this.startTime = init.startTime ?? this.startTime;
    this.endTime = init.endTime ?? this.endTime;
  }
}

/**
 * 退款信息（与 Kotlin Refund 对齐）
 */
export class Refund {
  /**
   * 退款金额
   */
  amount?: number | null = null;
  /**
   * 退款原因
   */
  reason?: string | null = null;

  constructor(init?: Partial<Refund>) {
    if (!init) {
      return;
    }
    this.amount = init.amount ?? this.amount;
    this.reason = init.reason ?? this.reason;
  }
}
