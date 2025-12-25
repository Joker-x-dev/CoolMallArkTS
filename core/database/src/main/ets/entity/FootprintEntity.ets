import { Table, Column, PrimaryKey, ColumnType } from "@ibestservices/ibest-orm";

/**
 * @file 用户足迹数据库实体，映射 footprints 表。
 * @author Joker.X
 */
@Table({ name: "footprints" })
export class FootprintEntity {
  /**
   * 主键，使用商品ID作为主键
   */
  @PrimaryKey({ autoIncrement: false })
  goodsId?: number;
  /**
   * 商品名称
   */
  @Column({ type: ColumnType.TEXT })
  goodsName?: string;
  /**
   * 商品副标题
   */
  @Column({ type: ColumnType.TEXT })
  goodsSubTitle?: string | null;
  /**
   * 商品主图
   */
  @Column({ type: ColumnType.TEXT })
  goodsMainPic?: string;
  /**
   * 商品价格
   */
  @Column({ type: ColumnType.INTEGER })
  goodsPrice?: number;
  /**
   * 已售数量
   */
  @Column({ type: ColumnType.INTEGER })
  goodsSold?: number;
  /**
   * 浏览时间戳
   */
  @Column({ type: ColumnType.INTEGER })
  viewTime?: number;
}
