/**
 * @file 规格模型
 * @author Joker.X
 */
export class GoodsSpec {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 商品ID
   */
  goodsId: number = 0;
  /**
   * 名称
   */
  name: string = "";
  /**
   * 价格
   */
  price: number = 0;
  /**
   * 库存
   */
  stock: number = 0;
  /**
   * 排序
   */
  sortNum: number = 0;
  /**
   * 图片
   */
  images?: string[] | null = null;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<GoodsSpec>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.goodsId = init.goodsId ?? this.goodsId;
    this.name = init.name ?? this.name;
    this.price = init.price ?? this.price;
    this.stock = init.stock ?? this.stock;
    this.sortNum = init.sortNum ?? this.sortNum;
    this.images = init.images ?? this.images;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
