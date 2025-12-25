/**
 * @file 轮播图模型
 * @author Joker.X
 */
export class Banner {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 描述
   */
  description: string = "";
  /**
   * 跳转路径
   */
  path: string = "";
  /**
   * 图片
   */
  pic: string = "";
  /**
   * 排序
   */
  sortNum: number = 0;
  /**
   * 状态 1:启用 2:禁用
   */
  status: number = 1;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<Banner>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.description = init.description ?? this.description;
    this.path = init.path ?? this.path;
    this.pic = init.pic ?? this.pic;
    this.sortNum = init.sortNum ?? this.sortNum;
    this.status = init.status ?? this.status;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
