import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { ConfirmOrder, GoodsDetail, Home, NetworkResponse } from "model";
import { PageNetworkDataSource } from "./PageNetworkDataSource";

/**
 * @file 页面相关数据源实现类
 * @author Joker.X
 */
export class PageNetworkDataSourceImpl implements PageNetworkDataSource {
  /**
   * 获取首页数据
   * @returns {Promise<NetworkResponse<Home>>} 首页聚合数据
   */
  async getHomeData(): Promise<NetworkResponse<Home>> {
    const resp: AxiosResponse<NetworkResponse<Home>> =
      await NetworkClient.http.get("page/home");
    return resp.data;
  }

  /**
   * 获取商品详情页数据
   * @param {number} goodsId - 商品 ID
   * @returns {Promise<NetworkResponse<GoodsDetail>>} 商品详情
   */
  async getGoodsDetail(goodsId: number): Promise<NetworkResponse<GoodsDetail>> {
    const resp: AxiosResponse<NetworkResponse<GoodsDetail>> =
      await NetworkClient.http.get("page/goodsDetail", { params: { goodsId } });
    return resp.data;
  }

  /**
   * 获取确认订单页数据
   * @returns {Promise<NetworkResponse<ConfirmOrder>>} 确认订单信息
   */
  async getConfirmOrder(): Promise<NetworkResponse<ConfirmOrder>> {
    const resp: AxiosResponse<NetworkResponse<ConfirmOrder>> =
      await NetworkClient.http.get("page/confirmOrder");
    return resp.data;
  }
}
