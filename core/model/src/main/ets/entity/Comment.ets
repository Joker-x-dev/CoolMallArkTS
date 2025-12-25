/**
 * @file 商品评价
 * @author Joker.X
 */
export class Comment {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 用户ID
   */
  userId: number = 0;
  /**
   * 商品ID
   */
  goodsId: number = 0;
  /**
   * 订单ID
   */
  orderId: number = 0;
  /**
   * 内容
   */
  content: string = "";
  /**
   * 星数
   */
  starCount: number = 5;
  /**
   * 图片
   */
  pics?: string[] | null = null;
  /**
   * 用户昵称
   */
  nickName?: string | null = null;
  /**
   * 用户头像
   */
  avatarUrl?: string | null = null;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<Comment>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.userId = init.userId ?? this.userId;
    this.goodsId = init.goodsId ?? this.goodsId;
    this.orderId = init.orderId ?? this.orderId;
    this.content = init.content ?? this.content;
    this.starCount = init.starCount ?? this.starCount;
    this.pics = init.pics ?? this.pics;
    this.nickName = init.nickName ?? this.nickName;
    this.avatarUrl = init.avatarUrl ?? this.avatarUrl;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
