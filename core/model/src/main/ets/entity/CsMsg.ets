import { MessageContent } from "./MessageContent";

/**
 * @file 客服消息
 * @author Joker.X
 */
export class CsMsg {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 用户ID
   */
  userId: number = 0;
  /**
   * 会话ID
   */
  sessionId: number = 0;
  /**
   * 消息内容
   */
  content: MessageContent = new MessageContent();
  /**
   * 类型 0-反馈 1-回复
   */
  type: number = 0;
  /**
   * 状态 0-未读 1-已读
   */
  status: number = 0;
  /**
   * 用户昵称
   */
  nickName: string = "";
  /**
   * 用户头像
   */
  avatarUrl: string = "";
  /**
   * 管理员用户名
   */
  adminUserName: string = "";
  /**
   * 管理员头像
   */
  adminUserHeadImg: string = "";
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<CsMsg>) {
    if (!init) return;
    this.id = init.id ?? this.id;
    this.userId = init.userId ?? this.userId;
    this.sessionId = init.sessionId ?? this.sessionId;
    this.content = init.content ? new MessageContent(init.content) : this.content;
    this.type = init.type ?? this.type;
    this.status = init.status ?? this.status;
    this.nickName = init.nickName ?? this.nickName;
    this.avatarUrl = init.avatarUrl ?? this.avatarUrl;
    this.adminUserName = init.adminUserName ?? this.adminUserName;
    this.adminUserHeadImg = init.adminUserHeadImg ?? this.adminUserHeadImg;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
