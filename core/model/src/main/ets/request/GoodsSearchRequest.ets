/**
 * @file 商品搜索分页请求模型
 * @author Joker.X
 */
export class GoodsSearchRequest {
  /**
   * 页码
   */
  page: number = 1;
  /**
   * 每页大小
   */
  size: number = 20;
  /**
   * 商品分类ID列表
   */
  typeId?: number[] | null = null;
  /**
   * 最低价格
   */
  minPrice?: string | null = null;
  /**
   * 最高价格
   */
  maxPrice?: string | null = null;
  /**
   * 搜索关键词
   */
  keyWord?: string | null = null;
  /**
   * 排序字段
   */
  order?: string | null = null;
  /**
   * 排序方式
   */
  sort?: string | null = null;
  /**
   * 推荐
   */
  recommend: boolean = false;
  /**
   * 精选
   */
  featured: boolean = false;

  /**
   * @param {Partial<GoodsSearchRequest>} init - 初始化数据
   */
  constructor(init?: Partial<GoodsSearchRequest>) {
    if (!init) {
      return;
    }
    this.page = init.page ?? this.page;
    this.size = init.size ?? this.size;
    this.typeId = init.typeId ?? this.typeId;
    this.minPrice = init.minPrice ?? this.minPrice;
    this.maxPrice = init.maxPrice ?? this.maxPrice;
    this.keyWord = init.keyWord ?? this.keyWord;
    this.order = init.order ?? this.order;
    this.sort = init.sort ?? this.sort;
    this.recommend = init.recommend ?? this.recommend;
    this.featured = init.featured ?? this.featured;
  }
}
