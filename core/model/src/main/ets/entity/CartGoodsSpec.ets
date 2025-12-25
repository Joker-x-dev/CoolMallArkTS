/**
 * @file 购物车商品规格
 * @author Joker.X
 */
export class CartGoodsSpec {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 商品ID
   */
  goodsId: number = 0;
  /**
   * 名称
   */
  name: string = "";
  /**
   * 价格
   */
  price: number = 0;
  /**
   * 库存
   */
  stock: number = 0;
  /**
   * 购买数量
   */
  count: number = 0;
  /**
   * 图片
   */
  images?: string[] | null = null;

  constructor(init?: Partial<CartGoodsSpec>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.goodsId = init.goodsId ?? this.goodsId;
    this.name = init.name ?? this.name;
    this.price = init.price ?? this.price;
    this.stock = init.stock ?? this.stock;
    this.count = init.count ?? this.count;
    this.images = init.images ?? this.images;
  }
}
