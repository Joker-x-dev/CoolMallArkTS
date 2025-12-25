/**
 * @file 选中商品模型（用于创建订单）
 * @author Joker.X
 */
export class SelectedGoods {
  /**
   * 商品ID
   */
  goodsId: number = 0;
  /**
   * SKU ID（可选）
   */
  skuId?: number | null = null;
  /**
   * 购买数量
   */
  quantity: number = 1;
  /**
   * 单价（可选）
   */
  price?: number | null = null;

  /**
   * @param {Partial<SelectedGoods>} init - 初始化数据
   */
  constructor(init?: Partial<SelectedGoods>) {
    if (!init) {
      return;
    }
    this.goodsId = init.goodsId ?? this.goodsId;
    this.skuId = init.skuId ?? this.skuId;
    this.quantity = init.quantity ?? this.quantity;
    this.price = init.price ?? this.price;
  }
}
