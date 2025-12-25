/**
 * @file 通用分页请求模型
 * @author Joker.X
 */
export class PageRequest {
  /**
   * 页码
   */
  page: number = 1;
  /**
   * 每页大小
   */
  size: number = 10;
  /**
   * 排序方式："asc" 或 "desc"
   */
  sort: string = "desc";

  /**
   * @param {Partial<PageRequest>} init - 初始化数据
   */
  constructor(init?: Partial<PageRequest>) {
    if (!init) return;
    this.page = init.page ?? this.page;
    this.size = init.size ?? this.size;
    this.sort = init.sort ?? this.sort;
  }
}
