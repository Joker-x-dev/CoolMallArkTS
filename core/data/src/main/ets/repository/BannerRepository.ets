import { BannerNetworkDataSource, BannerNetworkDataSourceImpl } from "network";
import { NetworkResponse, Unknown } from "model";

/**
 * @file 轮播图仓库，负责轮播图数据获取
 * @author Joker.X
 */
export class BannerRepository {
  /**
   * 轮播图网络数据源
   */
  private networkDataSource: BannerNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 可选的数据源实例，便于单元测试注入
   */
  constructor(networkDataSource?: BannerNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new BannerNetworkDataSourceImpl();
  }

  /**
   * 查询轮播图列表
   * @param params 查询条件
   * @returns 轮播图列表响应
   */
  async getBannerList(params: Record<string, Unknown>): Promise<NetworkResponse<Unknown>> {
    return this.networkDataSource.getBannerList(params);
  }
}
