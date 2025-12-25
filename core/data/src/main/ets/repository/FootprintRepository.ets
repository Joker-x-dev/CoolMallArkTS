import { Footprint } from "model";
import { FootprintLocalDataSource, FootprintLocalDataSourceImpl } from "database";

/**
 * @file 用户足迹本地仓库，封装数据库数据源并提供业务方法。
 * @author Joker.X
 */
export class FootprintRepository {
  /**
   * 本地数据源实例
   */
  private dataSource: FootprintLocalDataSource;

  /**
   * 构造函数
   * @param {FootprintLocalDataSource} dataSource 可选的数据源实例
   */
  constructor(dataSource: FootprintLocalDataSource = new FootprintLocalDataSourceImpl()) {
    this.dataSource = dataSource;
  }

  /**
   * 添加足迹记录
   * @param {Footprint} footprint 足迹记录
   * @returns {Promise<void>} Promise<void>
   */
  addFootprint(footprint: Footprint): Promise<void> {
    return this.dataSource.addFootprint(footprint);
  }

  /**
   * 根据商品ID删除足迹记录
   * @param {number} goodsId 商品ID
   * @returns {Promise<void>} Promise<void>
   */
  removeFootprint(goodsId: number): Promise<void> {
    return this.dataSource.removeFootprint(goodsId);
  }

  /**
   * 清空所有足迹记录
   * @returns {Promise<void>} Promise<void>
   */
  clearAllFootprints(): Promise<void> {
    return this.dataSource.clearAllFootprints();
  }

  /**
   * 获取所有足迹记录，按浏览时间倒序
   * @returns {Promise<Footprint[]>} 足迹列表
   */
  getAllFootprints(): Promise<Footprint[]> {
    return this.dataSource.getAllFootprints();
  }

  /**
   * 获取足迹记录总数量
   * @returns {Promise<number>} 足迹数量
   */
  getFootprintCount(): Promise<number> {
    return this.dataSource.getFootprintCount();
  }

  /**
   * 获取指定数量的最新足迹记录
   * @param {number} limit 限制数量
   * @returns {Promise<Footprint[]>} 足迹列表
   */
  getRecentFootprints(limit: number): Promise<Footprint[]> {
    return this.dataSource.getRecentFootprints(limit);
  }

  /**
   * 根据商品ID获取足迹记录
   * @param {number} goodsId 商品ID
   * @returns {Promise<Footprint | undefined>} 匹配到的足迹
   */
  getFootprintByGoodsId(goodsId: number): Promise<Footprint | undefined> {
    return this.dataSource.getFootprintByGoodsId(goodsId);
  }
}
