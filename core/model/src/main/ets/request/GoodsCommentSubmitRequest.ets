import { Comment } from "./Comment";

/**
 * @file 商品评论提交请求模型
 * @author Joker.X
 */
export class GoodsCommentSubmitRequest {
  /**
   * 订单ID
   */
  orderId: number = 0;
  /**
   * 评论数据
   */
  data: Comment = new Comment();

  /**
   * @param {Partial<GoodsCommentSubmitRequest>} init - 初始化数据
   */
  constructor(init?: Partial<GoodsCommentSubmitRequest>) {
    if (!init) return;
    this.orderId = init.orderId ?? this.orderId;
    this.data = init.data ? new Comment(init.data) : this.data;
  }
}
