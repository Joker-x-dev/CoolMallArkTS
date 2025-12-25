import { SearchHistory } from "model";

/**
 * @file 搜索历史本地数据源接口
 * @author Joker.X
 */
export interface SearchHistoryLocalDataSource {
  /**
   * 添加搜索历史记录
   * @param {SearchHistory} searchHistory 搜索历史记录
   * @returns {Promise<void>} Promise<void>
   */
  addSearchHistory(searchHistory: SearchHistory): Promise<void>;

  /**
   * 根据关键词删除搜索历史记录
   * @param {string} keyword 搜索关键词
   * @returns {Promise<void>} Promise<void>
   */
  removeSearchHistory(keyword: string): Promise<void>;

  /**
   * 清空所有搜索历史记录
   * @returns {Promise<void>} Promise<void>
   */
  clearAllSearchHistory(): Promise<void>;

  /**
   * 获取所有搜索历史记录，按搜索时间倒序
   * @returns {Promise<SearchHistory[]>} 搜索历史列表
   */
  getAllSearchHistory(): Promise<SearchHistory[]>;

  /**
   * 获取搜索历史记录数量
   * @returns {Promise<number>} 搜索历史数量
   */
  getSearchHistoryCount(): Promise<number>;

  /**
   * 获取指定数量的最新搜索历史记录
   * @param {number} limit 限制数量
   * @returns {Promise<SearchHistory[]>} 搜索历史列表
   */
  getRecentSearchHistory(limit: number): Promise<SearchHistory[]>;

  /**
   * 根据关键词获取搜索历史记录
   * @param {string} keyword 搜索关键词
   * @returns {Promise<SearchHistory | undefined>} 匹配到的搜索历史
   */
  getSearchHistoryByKeyword(keyword: string): Promise<SearchHistory | undefined>;
}
