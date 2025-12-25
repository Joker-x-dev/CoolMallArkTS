/**
 * @file 商品评论分页查询请求模型
 * @author Joker.X
 */
export class GoodsCommentPageRequest {
  /**
   * 商品ID
   */
  goodsId: string = "";
  /**
   * 页码
   */
  page: number = 1;
  /**
   * 每页大小
   */
  size: number = 20;

  /**
   * @param {Partial<GoodsCommentPageRequest>} init - 初始化数据
   */
  constructor(init?: Partial<GoodsCommentPageRequest>) {
    if (!init) return;
    this.goodsId = init.goodsId ?? this.goodsId;
    this.page = init.page ?? this.page;
    this.size = init.size ?? this.size;
  }
}
