import { GoodsSpec } from "./GoodsSpec";

/**
 * @file 商品模型
 * @author Joker.X
 */
export class Goods {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 类型ID
   */
  typeId: number = 0;
  /**
   * 标题
   */
  title: string = "";
  /**
   * 副标题
   */
  subTitle?: string | null = null;
  /**
   * 主图
   */
  mainPic: string = "";
  /**
   * 图片
   */
  pics?: string[] | null = null;
  /**
   * 价格
   */
  price: number = 0;
  /**
   * 已售
   */
  sold: number = 0;
  /**
   * 详情富文本（已弃用）
   */
  content?: string | null = null;
  /**
   * 详情图片
   */
  contentPics?: string[] | null = null;
  /**
   * 推荐
   */
  recommend: boolean = false;
  /**
   * 精选
   */
  featured: boolean = false;
  /**
   * 状态 0-下架 1-上架
   */
  status: number = 0;
  /**
   * 排序
   */
  sortNum: number = 0;
  /**
   * 规格
   */
  specs?: GoodsSpec[] | null = null;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  /**
   * @param {Partial<Goods>} init - 初始化数据
   * @returns {void} 无返回值
   */
  constructor(init?: Partial<Goods>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.typeId = init.typeId ?? this.typeId;
    this.title = init.title ?? this.title;
    this.subTitle = init.subTitle ?? this.subTitle;
    this.mainPic = init.mainPic ?? this.mainPic;
    this.pics = init.pics ?? this.pics;
    this.price = init.price ?? this.price;
    this.sold = init.sold ?? this.sold;
    this.content = init.content ?? this.content;
    this.contentPics = init.contentPics ?? this.contentPics;
    this.recommend = init.recommend ?? this.recommend;
    this.featured = init.featured ?? this.featured;
    this.status = init.status ?? this.status;
    this.sortNum = init.sortNum ?? this.sortNum;
    this.specs = init.specs ?? this.specs;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
