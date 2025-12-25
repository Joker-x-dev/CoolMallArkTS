import { Footprint } from "model";

/**
 * @file 用户足迹本地数据源接口
 * @author Joker.X
 */
export interface FootprintLocalDataSource {
  /**
   * 添加足迹记录
   * @param {Footprint} footprint 足迹记录
   * @returns {Promise<void>} Promise<void>
   */
  addFootprint(footprint: Footprint): Promise<void>;

  /**
   * 根据商品ID删除足迹记录
   * @param {number} goodsId 商品ID
   * @returns {Promise<void>} Promise<void>
   */
  removeFootprint(goodsId: number): Promise<void>;

  /**
   * 清空所有足迹记录
   * @returns {Promise<void>} Promise<void>
   */
  clearAllFootprints(): Promise<void>;

  /**
   * 获取所有足迹记录，按浏览时间倒序
   * @returns {Promise<Footprint[]>} 足迹列表
   */
  getAllFootprints(): Promise<Footprint[]>;

  /**
   * 获取足迹记录总数量
   * @returns {Promise<number>} 足迹数量
   */
  getFootprintCount(): Promise<number>;

  /**
   * 获取指定数量的最新足迹记录
   * @param {number} limit 限制数量
   * @returns {Promise<Footprint[]>} 足迹列表
   */
  getRecentFootprints(limit: number): Promise<Footprint[]>;

  /**
   * 根据商品ID获取足迹记录
   * @param {number} goodsId 商品ID
   * @returns {Promise<Footprint | undefined>} 匹配到的足迹
   */
  getFootprintByGoodsId(goodsId: number): Promise<Footprint | undefined>;
}
