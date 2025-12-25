import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { NetworkResponse, Unknown } from "model";
import { BannerNetworkDataSource } from "./BannerNetworkDataSource";

/**
 * @file 轮播图相关数据源实现类
 * @author Joker.X
 */
export class BannerNetworkDataSourceImpl implements BannerNetworkDataSource {
  /**
   * 查询轮播图列表
   * @param params 请求参数
   * @returns 轮播图列表响应
   */
  async getBannerList(params: Record<string, Unknown>): Promise<NetworkResponse<Unknown>> {
    const resp: AxiosResponse<NetworkResponse<Unknown>> =
      await NetworkClient.http.post("info/banner/list", params);
    return resp.data;
  }
}
