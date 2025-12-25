/**
 * @file 提交意见反馈请求模型
 * @author Joker.X
 */
export class FeedbackSubmitRequest {
  /**
   * 联系方式
   */
  contact?: string | null = "";
  /**
   * 类型
   */
  type: number = 0;
  /**
   * 内容
   */
  content: string = "";
  /**
   * 图片
   */
  images?: string[] | null = null;

  /**
   * @param {Partial<FeedbackSubmitRequest>} init - 初始化数据
   */
  constructor(init?: Partial<FeedbackSubmitRequest>) {
    if (!init) return;
    this.contact = init.contact ?? this.contact;
    this.type = init.type ?? this.type;
    this.content = init.content ?? this.content;
    this.images = init.images ?? this.images;
  }
}
