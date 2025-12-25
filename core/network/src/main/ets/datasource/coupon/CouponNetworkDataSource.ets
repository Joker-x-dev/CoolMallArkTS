import { Coupon, NetworkPageData, NetworkResponse, PageRequest, ReceiveCouponRequest, Unknown } from "model";

/**
 * @file 优惠券相关数据源接口
 * @author Joker.X
 */
export interface CouponNetworkDataSource {
  /**
   * 领取优惠券
   * @param request 领取优惠券请求参数
   * @returns 领取结果响应
   */
  receiveCoupon(request: ReceiveCouponRequest): Promise<NetworkResponse<string>>;

  /**
   * 分页查询用户优惠券
   * @param params 分页请求参数
   * @returns 用户优惠券分页数据响应
   */
  getUserCouponPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<Coupon>>>;

  /**
   * 查询用户优惠券列表
   * @param params 查询参数
   * @returns 用户优惠券列表响应
   */
  getUserCouponList(params: Record<string, Unknown>): Promise<NetworkResponse<Coupon[]>>;
}
