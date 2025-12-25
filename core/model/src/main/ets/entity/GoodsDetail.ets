import { Goods } from "./Goods";
import { Coupon } from "./Coupon";
import { Comment } from "./Comment";

/**
 * @file 商品详情信息
 * @author Joker.X
 */
export class GoodsDetail {
  /**
   * 商品信息
   */
  goodsInfo: Goods = new Goods();
  /**
   * 优惠券列表
   */
  coupon: Coupon[] = [];
  /**
   * 评论列表
   */
  comment: Comment[] = [];

  constructor(init?: Partial<GoodsDetail>) {
    if (!init) {
      return;
    }
    this.goodsInfo = init.goodsInfo ? new Goods(init.goodsInfo) : this.goodsInfo;
    this.coupon = init.coupon ? init.coupon.map((c) => new Coupon(c)) : this.coupon;
    this.comment = init.comment ? init.comment.map((c) => new Comment(c)) : this.comment;
  }
}
