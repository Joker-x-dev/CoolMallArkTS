/**
 * @file 订单分页查询请求模型
 * @author Joker.X
 */
export class OrderPageRequest {
  /**
   * 页码
   */
  page: number = 1;
  /**
   * 每页大小
   */
  size: number = 10;
  /**
   * 订单状态列表
   */
  status?: number[] | null = null;

  /**
   * @param {Partial<OrderPageRequest>} init - 初始化数据
   */
  constructor(init?: Partial<OrderPageRequest>) {
    if (!init) return;
    this.page = init.page ?? this.page;
    this.size = init.size ?? this.size;
    this.status = init.status ?? this.status;
  }
}
