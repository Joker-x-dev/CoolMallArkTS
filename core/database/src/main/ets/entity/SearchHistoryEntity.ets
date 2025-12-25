import { Table, Column, PrimaryKey, ColumnType } from "@ibestservices/ibest-orm";

/**
 * @file 搜索历史数据库实体，映射 search_history 表。
 * @author Joker.X
 */
@Table({ name: "search_history" })
export class SearchHistoryEntity {
  /**
   * 主键，使用搜索关键词作为主键
   */
  @PrimaryKey({ autoIncrement: false })
  keyword?: string;
  /**
   * 搜索时间戳
   */
  @Column({ type: ColumnType.INTEGER })
  searchTime?: number;
}
