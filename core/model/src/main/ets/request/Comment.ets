/**
 * @file 评论模型（用于提交评论）
 * @author Joker.X
 */
export class Comment {
  /**
   * 评分（可选，0-5）
   */
  score?: number | null = null;
  /**
   * 评论内容
   */
  content: string = "";
  /**
   * 评论图片
   */
  images?: string[] | null = null;

  /**
   * @param {Partial<Comment>} init - 初始化数据
   */
  constructor(init?: Partial<Comment>) {
    if (!init) return;
    this.score = init.score ?? this.score;
    this.content = init.content ?? this.content;
    this.images = init.images ?? this.images;
  }
}
