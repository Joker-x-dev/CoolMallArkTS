import { getORM } from "@ibestservices/ibest-orm";
import { Footprint } from "model";
import { FootprintLocalDataSource } from "./FootprintLocalDataSource";
import { FootprintEntity } from "../../entity/FootprintEntity";

/**
 * @file 用户足迹本地数据源实现
 * @author Joker.X
 */
export class FootprintLocalDataSourceImpl implements FootprintLocalDataSource {
  /**
   * 迁移标记，防止重复执行 migrate
   */
  private static migrated: boolean = false;
  /**
   * ORM 实例，用于执行数据库操作
   */
  private orm = getORM();

  /**
   * 构造函数，初始化 ORM 并确保足迹表已迁移
   * @returns {FootprintLocalDataSourceImpl} 实例
   */
  constructor() {
    this.ensureMigrated();
  }

  /**
   * 确保足迹表完成迁移
   * @returns {void} 无返回
   */
  private ensureMigrated(): void {
    if (!FootprintLocalDataSourceImpl.migrated) {
      this.orm.migrate(FootprintEntity);
      FootprintLocalDataSourceImpl.migrated = true;
    }
  }

  /**
   * 添加足迹记录
   * @param {Footprint} footprint 足迹记录
   * @returns {Promise<void>} Promise<void>
   */
  async addFootprint(footprint: Footprint): Promise<void> {
    this.orm.save(this.toEntity(footprint));
  }

  /**
   * 根据商品ID删除足迹记录
   * @param {number} goodsId 商品ID
   * @returns {Promise<void>} Promise<void>
   */
  async removeFootprint(goodsId: number): Promise<void> {
    this.orm.deleteById(FootprintEntity, goodsId);
  }

  /**
   * 清空所有足迹记录
   * @returns {Promise<void>} Promise<void>
   */
  async clearAllFootprints(): Promise<void> {
    this.orm.query(FootprintEntity).delete();
  }

  /**
   * 获取所有足迹记录，按浏览时间倒序
   * @returns {Promise<Footprint[]>} 足迹列表
   */
  async getAllFootprints(): Promise<Footprint[]> {
    const list: FootprintEntity[] = this.orm.query(FootprintEntity).find();
    return list
      .map((entity) => this.toModel(entity))
      .sort((left, right) => (right.viewTime ?? 0) - (left.viewTime ?? 0));
  }

  /**
   * 获取足迹记录总数量
   * @returns {Promise<number>} 足迹数量
   */
  async getFootprintCount(): Promise<number> {
    return this.orm.query(FootprintEntity).find().length;
  }

  /**
   * 获取指定数量的最新足迹记录
   * @param {number} limit 限制数量
   * @returns {Promise<Footprint[]>} 足迹列表
   */
  async getRecentFootprints(limit: number): Promise<Footprint[]> {
    const all: Footprint[] = await this.getAllFootprints();
    return all.slice(0, limit);
  }

  /**
   * 根据商品ID获取足迹记录
   * @param {number} goodsId 商品ID
   * @returns {Promise<Footprint | undefined>} 匹配到的足迹
   */
  async getFootprintByGoodsId(goodsId: number): Promise<Footprint | undefined> {
    const result: FootprintEntity[] = this.orm.query(FootprintEntity).where("goodsId", goodsId).find();
    const entity: FootprintEntity | undefined = result[0];
    return entity ? this.toModel(entity) : undefined;
  }

  /**
   * 将领域模型转换为数据库实体
   * @param {Footprint} footprint 足迹领域模型
   * @returns {FootprintEntity} 数据库实体
   */
  private toEntity(footprint: Footprint): FootprintEntity {
    const entity: FootprintEntity = new FootprintEntity();
    entity.goodsId = footprint.goodsId;
    entity.goodsName = footprint.goodsName;
    entity.goodsSubTitle = footprint.goodsSubTitle ?? null;
    entity.goodsMainPic = footprint.goodsMainPic;
    entity.goodsPrice = footprint.goodsPrice;
    entity.goodsSold = footprint.goodsSold;
    entity.viewTime = footprint.viewTime;
    return entity;
  }

  /**
   * 将数据库实体转换为领域模型
   * @param {FootprintEntity} entity 数据库实体
   * @returns {Footprint} 领域模型
   */
  private toModel(entity: FootprintEntity): Footprint {
    const footprint: Footprint = new Footprint();
    footprint.goodsId = entity.goodsId ?? 0;
    footprint.goodsName = entity.goodsName ?? "";
    footprint.goodsSubTitle = entity.goodsSubTitle ?? null;
    footprint.goodsMainPic = entity.goodsMainPic ?? "";
    footprint.goodsPrice = entity.goodsPrice ?? 0;
    footprint.goodsSold = entity.goodsSold ?? 0;
    footprint.viewTime = entity.viewTime ?? Date.now();
    return footprint;
  }
}
