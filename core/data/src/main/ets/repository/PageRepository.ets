import { PageNetworkDataSource, PageNetworkDataSourceImpl } from "network";
import { ConfirmOrder, GoodsDetail, Home, NetworkResponse } from "model";

/**
 * @file 页面数据仓库，封装页面聚合数据请求
 * @author Joker.X
 */
export class PageRepository {
  /**
   * 页面网络数据源
   */
  private networkDataSource: PageNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 页面网络数据源
   */
  constructor(networkDataSource?: PageNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new PageNetworkDataSourceImpl();
  }

  /**
   * 获取首页数据
   * @returns 首页数据
   */
  async getHomeData(): Promise<NetworkResponse<Home>> {
    return this.networkDataSource.getHomeData();
  }

  /**
   * 获取商品详情
   * @param goodsId 商品ID
   * @returns 商品详情
   */
  async getGoodsDetail(goodsId: number): Promise<NetworkResponse<GoodsDetail>> {
    return this.networkDataSource.getGoodsDetail(goodsId);
  }

  /**
   * 获取确认订单页面数据
   * @returns 确认订单页面数据
   */
  async getConfirmOrder(): Promise<NetworkResponse<ConfirmOrder>> {
    return this.networkDataSource.getConfirmOrder();
  }
}
