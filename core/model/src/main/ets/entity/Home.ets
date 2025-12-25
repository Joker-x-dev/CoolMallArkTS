import { Banner } from "./Banner";
import { Category } from "./Category";
import { Goods } from "./Goods";
import { Coupon } from "./Coupon";

/**
 * @file 首页模型
 * @author Joker.X
 */
export class Home {
  /**
   * 轮播图
   */
  banner?: Banner[] | null = null;
  /**
   * 分类
   */
  category?: Category[] | null = null;
  /**
   * 全部分类
   */
  categoryAll?: Category[] | null = null;
  /**
   * 限时精选商品
   */
  flashSale?: Goods[] | null = null;
  /**
   * 推荐商品
   */
  recommend?: Goods[] | null = null;
  /**
   * 优惠券
   */
  coupon?: Coupon[] | null = null;
  /**
   * 第一页全部商品
   */
  goods?: Goods[] | null = null;

  constructor(init?: Partial<Home>) {
    if (!init) {
      return;
    }
    this.banner = init.banner ? init.banner.map((b) => new Banner(b)) : this.banner;
    this.category = init.category ? init.category.map((c) => new Category(c)) : this.category;
    this.categoryAll = init.categoryAll ? init.categoryAll.map((c) => new Category(c)) : this.categoryAll;
    this.flashSale = init.flashSale ? init.flashSale.map((g) => new Goods(g)) : this.flashSale;
    this.recommend = init.recommend ? init.recommend.map((g) => new Goods(g)) : this.recommend;
    this.coupon = init.coupon ? init.coupon.map((c) => new Coupon(c)) : this.coupon;
    this.goods = init.goods ? init.goods.map((g) => new Goods(g)) : this.goods;
  }
}
