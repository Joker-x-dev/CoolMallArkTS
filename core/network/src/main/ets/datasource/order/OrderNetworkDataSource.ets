import {
  Logistics,
  Order,
  OrderCount,
  NetworkPageData,
  NetworkResponse,
  CancelOrderRequest,
  CreateOrderRequest,
  OrderPageRequest,
  RefundOrderRequest,
  Unknown
} from "model";

/**
 * @file 订单相关数据源接口
 * @author Joker.X
 */
export interface OrderNetworkDataSource {
  /**
   * 发起支付宝 App 支付
   * @param {Record<string, number>} params - 支付参数
   * @returns {Promise<NetworkResponse<string>>} 支付签名结果
   */
  alipayAppPay(params: Record<string, number>): Promise<NetworkResponse<string>>;

  /**
   * 更新订单信息
   * @param {unknown} params - 订单更新参数
   * @returns {Promise<NetworkResponse<unknown>>} 更新结果
   */
  updateOrder(params: Unknown): Promise<NetworkResponse<Unknown>>;

  /**
   * 申请订单退款
   * @param {RefundOrderRequest} params - 退款请求参数
   * @returns {Promise<NetworkResponse<boolean>>} 是否成功
   */
  refundOrder(params: RefundOrderRequest): Promise<NetworkResponse<boolean>>;

  /**
   * 获取订单分页列表
   * @param {OrderPageRequest} params - 分页查询参数
   * @returns {Promise<NetworkResponse<NetworkPageData<Order>>>} 订单分页数据
   */
  getOrderPage(params: OrderPageRequest): Promise<NetworkResponse<NetworkPageData<Order>>>;

  /**
   * 创建订单
   * @param {CreateOrderRequest} params - 创建订单参数
   * @returns {Promise<NetworkResponse<Order>>} 创建成功的订单信息
   */
  createOrder(params: CreateOrderRequest): Promise<NetworkResponse<Order>>;

  /**
   * 取消订单
   * @param {CancelOrderRequest} params - 取消订单参数
   * @returns {Promise<NetworkResponse<boolean>>} 是否取消成功
   */
  cancelOrder(params: CancelOrderRequest): Promise<NetworkResponse<boolean>>;

  /**
   * 获取用户订单数量汇总
   * @returns {Promise<NetworkResponse<OrderCount>>} 订单数量信息
   */
  getUserOrderCount(): Promise<NetworkResponse<OrderCount>>;

  /**
   * 查询订单物流信息
   * @param {number} orderId - 订单 ID
   * @returns {Promise<NetworkResponse<Logistics>>} 物流详情
   */
  getOrderLogistics(orderId: number): Promise<NetworkResponse<Logistics>>;

  /**
   * 获取订单详情
   * @param {number} id - 订单 ID
   * @returns {Promise<NetworkResponse<Order>>} 订单详情
   */
  getOrderInfo(id: number): Promise<NetworkResponse<Order>>;

  /**
   * 确认收货
   * @param {number} orderId - 订单 ID
   * @returns {Promise<NetworkResponse<boolean>>} 是否成功
   */
  confirmReceive(orderId: number): Promise<NetworkResponse<boolean>>;
}
