import { OrderNetworkDataSource, OrderNetworkDataSourceImpl } from "network";
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
 * @file 订单仓库，封装订单相关网络请求
 * @author Joker.X
 */
export class OrderRepository {
  /**
   * 订单网络数据源
   */
  private networkDataSource: OrderNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 可选的数据源实例，便于测试注入
   */
  constructor(networkDataSource?: OrderNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new OrderNetworkDataSourceImpl();
  }

  /**
   * 发起支付宝 App 支付
   * @param params 支付参数
   * @returns 支付签名结果
   */
  async alipayAppPay(params: Record<string, number>): Promise<NetworkResponse<string>> {
    return this.networkDataSource.alipayAppPay(params);
  }

  /**
   * 更新订单信息
   * @param params 更新参数
   * @returns 更新结果
   */
  async updateOrder(params: Unknown): Promise<NetworkResponse<Unknown>> {
    return this.networkDataSource.updateOrder(params);
  }

  /**
   * 申请订单退款
   * @param params 退款请求参数
   * @returns 是否成功
   */
  async refundOrder(params: RefundOrderRequest): Promise<NetworkResponse<boolean>> {
    return this.networkDataSource.refundOrder(params);
  }

  /**
   * 获取订单分页列表
   * @param params 分页查询参数
   * @returns 订单分页数据
   */
  async getOrderPage(params: OrderPageRequest): Promise<NetworkResponse<NetworkPageData<Order>>> {
    return this.networkDataSource.getOrderPage(params);
  }

  /**
   * 创建订单
   * @param params 创建订单参数
   * @returns 创建的订单信息
   */
  async createOrder(params: CreateOrderRequest): Promise<NetworkResponse<Order>> {
    return this.networkDataSource.createOrder(params);
  }

  /**
   * 取消订单
   * @param params 取消订单参数
   * @returns 是否取消成功
   */
  async cancelOrder(params: CancelOrderRequest): Promise<NetworkResponse<boolean>> {
    return this.networkDataSource.cancelOrder(params);
  }

  /**
   * 获取用户订单数量汇总
   * @returns 订单数量信息
   */
  async getUserOrderCount(): Promise<NetworkResponse<OrderCount>> {
    return this.networkDataSource.getUserOrderCount();
  }

  /**
   * 查询订单物流信息
   * @param orderId 订单 ID
   * @returns 物流详情
   */
  async getOrderLogistics(orderId: number): Promise<NetworkResponse<Logistics>> {
    return this.networkDataSource.getOrderLogistics(orderId);
  }

  /**
   * 获取订单详情
   * @param id 订单 ID
   * @returns 订单详情
   */
  async getOrderInfo(id: number): Promise<NetworkResponse<Order>> {
    return this.networkDataSource.getOrderInfo(id);
  }

  /**
   * 确认收货
   * @param orderId 订单 ID
   * @returns 是否成功
   */
  async confirmReceive(orderId: number): Promise<NetworkResponse<boolean>> {
    return this.networkDataSource.confirmReceive(orderId);
  }
}
