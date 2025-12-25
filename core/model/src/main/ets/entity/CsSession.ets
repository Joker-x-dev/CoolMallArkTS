import { CsMsg } from "./CsMsg";

/**
 * @file 客服会话
 * @author Joker.X
 */
export class CsSession {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 用户ID
   */
  userId: number = 0;
  /**
   * 最后一条消息
   */
  lastMsg?: CsMsg | null = null;
  /**
   * 客服未读消息数
   */
  adminUnreadCount: number = 0;
  /**
   * 用户昵称
   */
  nickName: string = "";
  /**
   * 用户头像
   */
  avatarUrl: string = "";
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<CsSession>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.userId = init.userId ?? this.userId;
    this.lastMsg = init.lastMsg ? new CsMsg(init.lastMsg) : this.lastMsg;
    this.adminUnreadCount = init.adminUnreadCount ?? this.adminUnreadCount;
    this.nickName = init.nickName ?? this.nickName;
    this.avatarUrl = init.avatarUrl ?? this.avatarUrl;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
