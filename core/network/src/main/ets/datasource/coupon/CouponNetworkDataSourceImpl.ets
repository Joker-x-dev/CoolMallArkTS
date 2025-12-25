import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { Coupon, NetworkPageData, NetworkResponse, PageRequest, ReceiveCouponRequest, Unknown } from "model";
import { CouponNetworkDataSource } from "./CouponNetworkDataSource";

/**
 * @file 优惠券相关数据源实现类
 * @author Joker.X
 */
export class CouponNetworkDataSourceImpl implements CouponNetworkDataSource {
  /**
   * 领取优惠券
   * @param {ReceiveCouponRequest} request - 领取参数
   * @returns {Promise<NetworkResponse<string>>} 领取结果
   */
  async receiveCoupon(request: ReceiveCouponRequest): Promise<NetworkResponse<string>> {
    const resp: AxiosResponse<NetworkResponse<string>> =
      await NetworkClient.http.post("market/coupon/user/receive", request);
    return resp.data;
  }

  /**
   * 获取用户优惠券分页
   * @param {PageRequest} params - 分页参数
   * @returns {Promise<NetworkResponse<NetworkPageData<Coupon>>>} 优惠券分页数据
   */
  async getUserCouponPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<Coupon>>> {
    const resp: AxiosResponse<NetworkResponse<NetworkPageData<Coupon>>> =
      await NetworkClient.http.post("market/coupon/user/page", params);
    return resp.data;
  }

  /**
   * 获取用户优惠券列表
   * @param {Record<string, Unknown>} params - 查询参数
   * @returns {Promise<NetworkResponse<Coupon[]>>} 优惠券列表
   */
  async getUserCouponList(params: Record<string, Unknown>): Promise<NetworkResponse<Coupon[]>> {
    const resp: AxiosResponse<NetworkResponse<Coupon[]>> =
      await NetworkClient.http.post("market/coupon/user/list", params);
    return resp.data;
  }
}
