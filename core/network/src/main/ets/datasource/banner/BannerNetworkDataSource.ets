import { NetworkResponse, Unknown } from "model";

/**
 * @file 轮播图相关数据源接口
 * @author Joker.X
 */
export interface BannerNetworkDataSource {
  /**
   * 查询轮播图列表
   * @param params 请求参数
   * @returns 轮播图列表响应
   */
  getBannerList(params: Record<string, Unknown>): Promise<NetworkResponse<Unknown>>;
}
