import { Goods } from "./Goods";
import { GoodsSpec } from "./GoodsSpec";

/**
 * @file 订单商品
 * @author Joker.X
 */
export class OrderGoods {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 订单ID
   */
  orderId: number = 0;
  /**
   * 商品ID
   */
  goodsId: number = 0;
  /**
   * 价格
   */
  price: number = 0;
  /**
   * 优惠金额
   */
  discountPrice: number = 0;
  /**
   * 数量
   */
  count: number = 0;
  /**
   * 其他信息
   */
  remark?: string | null = null;
  /**
   * 商品信息
   */
  goodsInfo?: Goods | null = null;
  /**
   * 规格
   */
  spec?: GoodsSpec | null = null;
  /**
   * 是否评价 0-否 1-是
   */
  isComment: number = 0;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<OrderGoods>) {
    if (!init) return;
    this.id = init.id ?? this.id;
    this.orderId = init.orderId ?? this.orderId;
    this.goodsId = init.goodsId ?? this.goodsId;
    this.price = init.price ?? this.price;
    this.discountPrice = init.discountPrice ?? this.discountPrice;
    this.count = init.count ?? this.count;
    this.remark = init.remark ?? this.remark;
    this.goodsInfo = init.goodsInfo ? new Goods(init.goodsInfo) : this.goodsInfo;
    this.spec = init.spec ? new GoodsSpec(init.spec) : this.spec;
    this.isComment = init.isComment ?? this.isComment;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
