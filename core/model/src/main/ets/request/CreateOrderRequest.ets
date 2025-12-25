import { SelectedGoods } from "../entity/SelectedGoods";

/**
 * @file 创建订单请求模型
 * @author Joker.X
 */
export class CreateOrderRequest {
  /**
   * 创建订单所需参数
   */
  data: CreateOrder = new CreateOrder();

  /**
   * @param {Partial<CreateOrderRequest>} init - 初始化数据
   */
  constructor(init?: Partial<CreateOrderRequest>) {
    if (!init) return;
    this.data = init.data ? new CreateOrder(init.data) : this.data;
  }
}

/**
 * 创建订单所需参数
 */
export class CreateOrder {
  /**
   * 备注信息
   */
  remark: string = "";
  /**
   * 地址ID
   */
  addressId: number = 0;
  /**
   * 选中的商品列表
   */
  goodsList: SelectedGoods[] = [];
  /**
   * 优惠券ID（可选）
   */
  couponId?: number | null = null;
  /**
   * 标题
   */
  title: string = "";

  /**
   * @param {Partial<CreateOrder>} init - 初始化数据
   */
  constructor(init?: Partial<CreateOrder>) {
    if (!init) return;
    this.remark = init.remark ?? this.remark;
    this.addressId = init.addressId ?? this.addressId;
    this.goodsList = init.goodsList ? init.goodsList.map((g) => new SelectedGoods(g)) : this.goodsList;
    this.couponId = init.couponId ?? this.couponId;
    this.title = init.title ?? this.title;
  }
}
