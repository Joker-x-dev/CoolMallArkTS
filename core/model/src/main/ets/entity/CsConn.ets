/**
 * @file 客服连接
 * @author Joker.X
 */
export class CsConn {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 用户ID
   */
  userId: number = 0;
  /**
   * 连接ID
   */
  connId: string = "";
  /**
   * 类型 0-客户 1-后台
   */
  type: number = 0;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<CsConn>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.userId = init.userId ?? this.userId;
    this.connId = init.connId ?? this.connId;
    this.type = init.type ?? this.type;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
