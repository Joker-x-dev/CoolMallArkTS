import { ConfirmOrder, GoodsDetail, Home, NetworkResponse } from "model";

/**
 * @file 页面相关数据源接口
 * @author Joker.X
 */
export interface PageNetworkDataSource {
  /**
   * 获取首页数据
   * @returns 首页数据响应
   */
  getHomeData(): Promise<NetworkResponse<Home>>;

  /**
   * 获取商品详情
   * @param goodsId 商品ID
   * @returns 商品详情响应
   */
  getGoodsDetail(goodsId: number): Promise<NetworkResponse<GoodsDetail>>;

  /**
   * 获取确认订单页面数据
   * @returns 确认订单页面数据响应
   */
  getConfirmOrder(): Promise<NetworkResponse<ConfirmOrder>>;
}
