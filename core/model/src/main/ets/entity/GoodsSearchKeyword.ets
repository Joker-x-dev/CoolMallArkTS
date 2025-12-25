/**
 * @file 搜索关键词
 * @author Joker.X
 */
export class GoodsSearchKeyword {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 名称
   */
  name: string = "";
  /**
   * 排序
   */
  sortNum: number = 0;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<GoodsSearchKeyword>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.name = init.name ?? this.name;
    this.sortNum = init.sortNum ?? this.sortNum;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
