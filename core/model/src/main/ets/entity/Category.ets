/**
 * @file 商品类型
 * @author Joker.X
 */
export class Category {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 名称
   */
  name: string = "";
  /**
   * 父ID
   */
  parentId?: number | null = null;
  /**
   * 排序
   */
  sortNum: number = 0;
  /**
   * 图片
   */
  pic?: string | null = null;
  /**
   * 状态 0-禁用 1-启用
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

  constructor(init?: Partial<Category>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.name = init.name ?? this.name;
    this.parentId = init.parentId ?? this.parentId;
    this.sortNum = init.sortNum ?? this.sortNum;
    this.pic = init.pic ?? this.pic;
    this.status = init.status ?? this.status;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
