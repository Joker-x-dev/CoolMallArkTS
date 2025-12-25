import { Table, Column, PrimaryKey, ColumnType } from "@ibestservices/ibest-orm";

/**
 * @file 购物车数据库实体，映射 carts 表。
 * @author Joker.X
 */
@Table({ name: "carts" })
export class CartEntity {
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
   * 商品主图
   */
  @Column({ type: ColumnType.TEXT })
  goodsMainPic?: string;
  /**
   * 规格列表使用 JSON 字符串存储
   */
  @Column({ type: ColumnType.TEXT })
  specJson?: string;
}
