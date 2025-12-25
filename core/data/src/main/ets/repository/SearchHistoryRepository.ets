import { SearchHistory } from "model";
import { SearchHistoryLocalDataSource, SearchHistoryLocalDataSourceImpl } from "database";

/**
 * @file 搜索历史本地仓库，封装数据库数据源并提供业务方法。
 * @author Joker.X
 */
export class SearchHistoryRepository {
  /**
   * 本地数据源实例
   */
  private dataSource: SearchHistoryLocalDataSource;

  /**
   * 构造函数
   * @param {SearchHistoryLocalDataSource} dataSource 可选的数据源实例
   */
  constructor(dataSource: SearchHistoryLocalDataSource = new SearchHistoryLocalDataSourceImpl()) {
    this.dataSource = dataSource;
  }

  /**
   * 添加搜索历史记录
   * @param {string} keyword 搜索关键词
   * @returns {Promise<void>} Promise<void>
   * @example
  * const repo: SearchHistoryRepository = new SearchHistoryRepository();
   * await repo.addSearchHistory("手机");
   */
  async addSearchHistory(keyword: string): Promise<void> {
    const trimmed: string = keyword.trim();
    if (!trimmed) {
      return;
    }
    const history: SearchHistory = new SearchHistory();
    history.keyword = trimmed;
    history.searchTime = Date.now();
    return this.dataSource.addSearchHistory(history);
  }

  /**
   * 根据关键词删除搜索历史记录
   * @param {string} keyword 搜索关键词
   * @returns {Promise<void>} Promise<void>
   */
  removeSearchHistory(keyword: string): Promise<void> {
    return this.dataSource.removeSearchHistory(keyword);
  }

  /**
   * 清空所有搜索历史记录
   * @returns {Promise<void>} Promise<void>
   */
  clearAllSearchHistory(): Promise<void> {
    return this.dataSource.clearAllSearchHistory();
  }

  /**
   * 获取所有搜索历史记录，按搜索时间倒序
   * @returns {Promise<SearchHistory[]>} 搜索历史列表
   */
  getAllSearchHistory(): Promise<SearchHistory[]> {
    return this.dataSource.getAllSearchHistory();
  }

  /**
   * 获取搜索历史记录数量
   * @returns {Promise<number>} 搜索历史数量
   */
  getSearchHistoryCount(): Promise<number> {
    return this.dataSource.getSearchHistoryCount();
  }

  /**
   * 获取指定数量的最新搜索历史记录
   * @param {number} limit 限制数量
   * @returns {Promise<SearchHistory[]>} 搜索历史列表
   */
  getRecentSearchHistory(limit: number): Promise<SearchHistory[]> {
    return this.dataSource.getRecentSearchHistory(limit);
  }

  /**
   * 根据关键词获取搜索历史记录
   * @param {string} keyword 搜索关键词
   * @returns {Promise<SearchHistory | undefined>} 匹配到的搜索历史
   */
  getSearchHistoryByKeyword(keyword: string): Promise<SearchHistory | undefined> {
    return this.dataSource.getSearchHistoryByKeyword(keyword);
  }
}
