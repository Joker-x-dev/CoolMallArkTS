/**
 * @file 意见反馈模型
 * @author Joker.X
 */
export class Feedback {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 用户ID
   */
  userId: number = 0;
  /**
   * 联系方式
   */
  contact: string = "";
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
   * 状态 0-未处理 1-已处理
   */
  status: number = 0;
  /**
   * 处理人ID
   */
  handlerId?: number | null = null;
  /**
   * 备注
   */
  remark?: string | null = null;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<Feedback>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.userId = init.userId ?? this.userId;
    this.contact = init.contact ?? this.contact;
    this.type = init.type ?? this.type;
    this.content = init.content ?? this.content;
    this.images = init.images ?? this.images;
    this.status = init.status ?? this.status;
    this.handlerId = init.handlerId ?? this.handlerId;
    this.remark = init.remark ?? this.remark;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
