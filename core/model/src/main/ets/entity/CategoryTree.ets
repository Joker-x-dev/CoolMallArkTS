import { Category } from "./Category";

/**
 * @file 商品分类树结构
 * @author Joker.X
 */
export class CategoryTree {
  /**
   * ID
   */
  id: number;
  /**
   * 名称
   */
  name: string;
  /**
   * 父ID
   */
  parentId?: number | null;
  /**
   * 排序
   */
  sortNum: number;
  /**
   * 图片
   */
  pic?: string | null;
  /**
   * 状态 0-禁用 1-启用
   */
  status: number;
  /**
   * 创建时间
   */
  createTime?: string | null;
  /**
   * 更新时间
   */
  updateTime?: string | null;
  /**
   * 子分类列表
   */
  children: CategoryTree[];

  constructor(init: CategoryTreeInit) {
    this.id = init.id;
    this.name = init.name;
    this.parentId = init.parentId ?? null;
    this.sortNum = init.sortNum;
    this.pic = init.pic ?? null;
    this.status = init.status;
    this.createTime = init.createTime ?? null;
    this.updateTime = init.updateTime ?? null;
    this.children = init.children ?? [];
  }

  /**
   * 从 Category 转换为 CategoryTree
   */
  static fromCategory(category: Category): CategoryTree {
    return new CategoryTree({
      id: category.id,
      name: category.name,
      parentId: category.parentId ?? null,
      sortNum: category.sortNum,
      pic: category.pic ?? null,
      status: category.status,
      createTime: category.createTime ?? null,
      updateTime: category.updateTime ?? null,
      children: []
    });
  }
}

/**
 * CategoryTree 构造参数类型
 */
export interface CategoryTreeInit {
  id: number;
  name: string;
  parentId?: number | null;
  sortNum: number;
  pic?: string | null;
  status: number;
  createTime?: string | null;
  updateTime?: string | null;
  children?: CategoryTree[];
}
