/**
 * @file 客服消息内容
 * @author Joker.X
 */
export class MessageContent {
  /**
   * 消息类型 TEXT/IMAGE/VOICE/VIDEO/FILE/LINK/LOCATION/EMOJI
   */
  type: string = "";
  /**
   * 消息数据
   */
  data: string = "";

  constructor(init?: Partial<MessageContent>) {
    if (!init) return;
    this.type = init.type ?? this.type;
    this.data = init.data ?? this.data;
  }
}
