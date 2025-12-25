import { CartGoodsSpec } from "./CartGoodsSpec";

/**
 * @file 购物车模型
 * @author Joker.X
 */
export class Cart {
  /**
   * 商品 id
   */
  goodsId: number = 0;
  /**
   * 商品名称
   */
  goodsName: string = "";
  /**
   * 商品主图
   */
  goodsMainPic: string = "";
  /**
   * 规格
   */
  spec: CartGoodsSpec[] = [];

  constructor(init?: Partial<Cart>) {
    if (!init) {
      return;
    }
    this.goodsId = init.goodsId ?? this.goodsId;
    this.goodsName = init.goodsName ?? this.goodsName;
    this.goodsMainPic = init.goodsMainPic ?? this.goodsMainPic;
    this.spec = init.spec ? init.spec.map((s) => new CartGoodsSpec(s)) : this.spec;
  }
}
