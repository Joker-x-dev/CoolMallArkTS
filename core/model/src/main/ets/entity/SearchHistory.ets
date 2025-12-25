/**
 * @file 搜索历史模型
 * @author Joker.X
 */
export class SearchHistory {
  /**
   * 搜索关键词
   */
  keyword: string = "";
  /**
   * 搜索时间戳
   */
  searchTime: number = Date.now();

  constructor(init?: Partial<SearchHistory>) {
    if (!init) {
      return;
    }
    this.keyword = init.keyword ?? this.keyword;
    this.searchTime = init.searchTime ?? this.searchTime;
  }
}
