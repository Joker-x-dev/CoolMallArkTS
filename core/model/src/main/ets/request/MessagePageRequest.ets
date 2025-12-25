/**
 * @file 分页查询消息请求
 * @author Joker.X
 */
export class MessagePageRequest {
  /**
   * 会话ID
   */
  sessionId: number = 0;
  /**
   * 页码
   */
  page: number = 1;
  /**
   * 每页大小
   */
  size: number = 20;
  /**
   * 排序字段
   */
  order: string = "createTime";
  /**
   * 排序方式："asc" 或 "desc"
   */
  sort: string = "desc";

  /**
   * @param {Partial<MessagePageRequest>} init - 初始化数据
   */
  constructor(init?: Partial<MessagePageRequest>) {
    if (!init) return;
    this.sessionId = init.sessionId ?? this.sessionId;
    this.page = init.page ?? this.page;
    this.size = init.size ?? this.size;
    this.order = init.order ?? this.order;
    this.sort = init.sort ?? this.sort;
  }
}
