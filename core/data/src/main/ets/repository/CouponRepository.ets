import { CouponNetworkDataSource, CouponNetworkDataSourceImpl } from "network";
import {
  Coupon,
  NetworkPageData,
  NetworkResponse,
  PageRequest,
  ReceiveCouponRequest,
  Unknown
} from "model";

/**
 * @file 优惠券仓库，封装优惠券相关请求
 * @author Joker.X
 */
export class CouponRepository {
  /**
   * 优惠券网络数据源
   */
  private networkDataSource: CouponNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 可选的数据源实例，便于注入测试替身
   */
  constructor(networkDataSource?: CouponNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new CouponNetworkDataSourceImpl();
  }

  /**
   * 领取优惠券
   * @param request 领取请求参数
   * @returns 领取结果
   */
  async receiveCoupon(request: ReceiveCouponRequest): Promise<NetworkResponse<string>> {
    return this.networkDataSource.receiveCoupon(request);
  }

  /**
   * 分页查询用户优惠券
   * @param params 分页查询参数
   * @returns 用户优惠券分页数据
   */
  async getUserCouponPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<Coupon>>> {
    return this.networkDataSource.getUserCouponPage(params);
  }

  /**
   * 查询用户优惠券列表
   * @param params 查询参数
   * @returns 用户优惠券列表数据
   */
  async getUserCouponList(params: Record<string, Unknown>): Promise<NetworkResponse<Coupon[]>> {
    return this.networkDataSource.getUserCouponList(params);
  }
}
