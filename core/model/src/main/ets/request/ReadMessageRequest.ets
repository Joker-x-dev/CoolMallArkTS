/**
 * @file 已读消息请求模型
 * @author Joker.X
 */
export class ReadMessageRequest {
  /**
   * 消息ID数组，用于批量已读
   */
  ids: number[] = [];

  /**
   * @param {Partial<ReadMessageRequest>} init - 初始化数据
   */
  constructor(init?: Partial<ReadMessageRequest>) {
    if (!init) return;
    this.ids = init.ids ?? this.ids;
  }
}
