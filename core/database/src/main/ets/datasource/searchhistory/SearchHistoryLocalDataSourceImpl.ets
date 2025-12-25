import { getORM } from "@ibestservices/ibest-orm";
import { SearchHistory } from "model";
import { SearchHistoryLocalDataSource } from "./SearchHistoryLocalDataSource";
import { SearchHistoryEntity } from "../../entity/SearchHistoryEntity";

/**
 * @file 搜索历史本地数据源实现
 * @author Joker.X
 */
export class SearchHistoryLocalDataSourceImpl implements SearchHistoryLocalDataSource {
  /**
   * 迁移标记，防止重复执行 migrate
   */
  private static migrated: boolean = false;
  /**
   * ORM 实例，用于执行数据库操作
   */
  private orm = getORM();

  /**
   * 构造函数，初始化 ORM 并确保搜索历史表已迁移
   * @returns {SearchHistoryLocalDataSourceImpl} 实例
   */
  constructor() {
    this.ensureMigrated();
  }

  /**
   * 确保搜索历史表完成迁移
   * @returns {void} 无返回
   */
  private ensureMigrated(): void {
    if (!SearchHistoryLocalDataSourceImpl.migrated) {
      this.orm.migrate(SearchHistoryEntity);
      SearchHistoryLocalDataSourceImpl.migrated = true;
    }
  }

  /**
   * 添加搜索历史记录
   * @param {SearchHistory} searchHistory 搜索历史记录
   * @returns {Promise<void>} Promise<void>
   */
  async addSearchHistory(searchHistory: SearchHistory): Promise<void> {
    this.orm.save(this.toEntity(searchHistory));
  }

  /**
   * 根据关键词删除搜索历史记录
   * @param {string} keyword 搜索关键词
   * @returns {Promise<void>} Promise<void>
   */
  async removeSearchHistory(keyword: string): Promise<void> {
    this.orm.query(SearchHistoryEntity).where("keyword", keyword).delete();
  }

  /**
   * 清空所有搜索历史记录
   * @returns {Promise<void>} Promise<void>
   */
  async clearAllSearchHistory(): Promise<void> {
    this.orm.query(SearchHistoryEntity).delete();
  }

  /**
   * 获取所有搜索历史记录，按搜索时间倒序
   * @returns {Promise<SearchHistory[]>} 搜索历史列表
   */
  async getAllSearchHistory(): Promise<SearchHistory[]> {
    const list: SearchHistoryEntity[] = this.orm.query(SearchHistoryEntity).find();
    return list
      .map((entity) => this.toModel(entity))
      .sort((left, right) => (right.searchTime ?? 0) - (left.searchTime ?? 0));
  }

  /**
   * 获取搜索历史记录数量
   * @returns {Promise<number>} 搜索历史数量
   */
  async getSearchHistoryCount(): Promise<number> {
    return this.orm.query(SearchHistoryEntity).find().length;
  }

  /**
   * 获取指定数量的最新搜索历史记录
   * @param {number} limit 限制数量
   * @returns {Promise<SearchHistory[]>} 搜索历史列表
   */
  async getRecentSearchHistory(limit: number): Promise<SearchHistory[]> {
    const all: SearchHistory[] = await this.getAllSearchHistory();
    return all.slice(0, limit);
  }

  /**
   * 根据关键词获取搜索历史记录
   * @param {string} keyword 搜索关键词
   * @returns {Promise<SearchHistory | undefined>} 匹配到的搜索历史
   */
  async getSearchHistoryByKeyword(keyword: string): Promise<SearchHistory | undefined> {
    const result: SearchHistoryEntity[] = this.orm.query(SearchHistoryEntity).where("keyword", keyword).find();
    const entity: SearchHistoryEntity | undefined = result[0];
    return entity ? this.toModel(entity) : undefined;
  }

  /**
   * 将领域模型转换为数据库实体
   * @param {SearchHistory} history 搜索历史领域模型
   * @returns {SearchHistoryEntity} 数据库实体
   */
  private toEntity(history: SearchHistory): SearchHistoryEntity {
    const entity: SearchHistoryEntity = new SearchHistoryEntity();
    entity.keyword = history.keyword.trim();
    entity.searchTime = history.searchTime;
    return entity;
  }

  /**
   * 将数据库实体转换为领域模型
   * @param {SearchHistoryEntity} entity 数据库实体
   * @returns {SearchHistory} 领域模型
   */
  private toModel(entity: SearchHistoryEntity): SearchHistory {
    const history: SearchHistory = new SearchHistory();
    history.keyword = entity.keyword ?? "";
    history.searchTime = entity.searchTime ?? Date.now();
    return history;
  }
}
