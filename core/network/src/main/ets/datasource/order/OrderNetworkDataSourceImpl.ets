import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
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
import { OrderNetworkDataSource } from "./OrderNetworkDataSource";

/**
 * @file 订单相关数据源实现类
 * @author Joker.X
 */
export class OrderNetworkDataSourceImpl implements OrderNetworkDataSource {
  /**
   * 发起支付宝 App 支付
   * @param {Record<string, number>} params - 支付参数
   * @returns {Promise<NetworkResponse<string>>} 支付签名结果
   */
  async alipayAppPay(params: Record<string, number>): Promise<NetworkResponse<string>> {
    const resp: AxiosResponse<NetworkResponse<string>> =
      await NetworkClient.http.post("order/pay/alipayAppPay", params);
    return resp.data;
  }

  /**
   * 更新订单信息
   * @param {Unknown} params - 订单更新参数
   * @returns {Promise<NetworkResponse<Unknown>>} 更新结果
   */
  async updateOrder(params: Unknown): Promise<NetworkResponse<Unknown>> {
    const resp: AxiosResponse<NetworkResponse<Unknown>> =
      await NetworkClient.http.post("order/info/update", params);
    return resp.data;
  }

  /**
   * 申请订单退款
   * @param {RefundOrderRequest} params - 退款请求参数
   * @returns {Promise<NetworkResponse<boolean>>} 是否成功
   */
  async refundOrder(params: RefundOrderRequest): Promise<NetworkResponse<boolean>> {
    const resp: AxiosResponse<NetworkResponse<boolean>> =
      await NetworkClient.http.post("order/info/refund", params);
    return resp.data;
  }

  /**
   * 获取订单分页列表
   * @param {OrderPageRequest} params - 分页查询参数
   * @returns {Promise<NetworkResponse<NetworkPageData<Order>>>} 订单分页数据
   */
  async getOrderPage(params: OrderPageRequest): Promise<NetworkResponse<NetworkPageData<Order>>> {
    const resp: AxiosResponse<NetworkResponse<NetworkPageData<Order>>> =
      await NetworkClient.http.post("order/info/page", params);
    return resp.data;
  }

  /**
   * 创建订单
   * @param {CreateOrderRequest} params - 创建订单参数
   * @returns {Promise<NetworkResponse<Order>>} 创建成功的订单信息
   */
  async createOrder(params: CreateOrderRequest): Promise<NetworkResponse<Order>> {
    const resp: AxiosResponse<NetworkResponse<Order>> =
      await NetworkClient.http.post("order/info/create", params);
    return resp.data;
  }

  /**
   * 取消订单
   * @param {CancelOrderRequest} params - 取消订单参数
   * @returns {Promise<NetworkResponse<boolean>>} 是否取消成功
   */
  async cancelOrder(params: CancelOrderRequest): Promise<NetworkResponse<boolean>> {
    const resp: AxiosResponse<NetworkResponse<boolean>> =
      await NetworkClient.http.post("order/info/cancel", params);
    return resp.data;
  }

  /**
   * 获取用户订单数量汇总
   * @returns {Promise<NetworkResponse<OrderCount>>} 订单数量信息
   */
  async getUserOrderCount(): Promise<NetworkResponse<OrderCount>> {
    const resp: AxiosResponse<NetworkResponse<OrderCount>> =
      await NetworkClient.http.get("order/info/userCount");
    return resp.data;
  }

  /**
   * 查询订单物流信息
   * @param {number} orderId - 订单 ID
   * @returns {Promise<NetworkResponse<Logistics>>} 物流详情
   */
  async getOrderLogistics(orderId: number): Promise<NetworkResponse<Logistics>> {
    const resp: AxiosResponse<NetworkResponse<Logistics>> =
      await NetworkClient.http.get("order/info/logistics", { params: { orderId } });
    return resp.data;
  }

  /**
   * 获取订单详情
   * @param {number} id - 订单 ID
   * @returns {Promise<NetworkResponse<Order>>} 订单详情
   */
  async getOrderInfo(id: number): Promise<NetworkResponse<Order>> {
    const resp: AxiosResponse<NetworkResponse<Order>> =
      await NetworkClient.http.get("order/info/info", { params: { id } });
    return resp.data;
  }

  /**
   * 确认收货
   * @param {number} orderId - 订单 ID
   * @returns {Promise<NetworkResponse<boolean>>} 是否成功
   */
  async confirmReceive(orderId: number): Promise<NetworkResponse<boolean>> {
    const resp: AxiosResponse<NetworkResponse<boolean>> =
      await NetworkClient.http.get("order/info/confirm", { params: { orderId } });
    return resp.data;
  }
}
