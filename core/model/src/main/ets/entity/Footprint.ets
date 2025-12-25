/**
 * @file 用户足迹模型
 * @author Joker.X
 */
export class Footprint {
  /**
   * 商品ID
   */
  goodsId: number = 0;
  /**
   * 商品名称
   */
  goodsName: string = "";
  /**
   * 商品副标题
   */
  goodsSubTitle?: string | null = null;
  /**
   * 商品主图
   */
  goodsMainPic: string = "";
  /**
   * 商品价格
   */
  goodsPrice: number = 0;
  /**
   * 已售数量
   */
  goodsSold: number = 0;
  /**
   * 浏览时间戳
   */
  viewTime: number = Date.now();

  constructor(init?: Partial<Footprint>) {
    if (!init) {
      return;
    }
    this.goodsId = init.goodsId ?? this.goodsId;
    this.goodsName = init.goodsName ?? this.goodsName;
    this.goodsSubTitle = init.goodsSubTitle ?? this.goodsSubTitle;
    this.goodsMainPic = init.goodsMainPic ?? this.goodsMainPic;
    this.goodsPrice = init.goodsPrice ?? this.goodsPrice;
    this.goodsSold = init.goodsSold ?? this.goodsSold;
    this.viewTime = init.viewTime ?? this.viewTime;
  }
}
