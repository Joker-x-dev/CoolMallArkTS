import { GoodsNetworkDataSource, GoodsNetworkDataSourceImpl } from "network";
import {
  Category,
  Comment,
  Goods,
  GoodsSearchKeyword,
  GoodsSpec,
  GoodsSearchRequest,
  GoodsCommentSubmitRequest,
  GoodsCommentPageRequest,
  NetworkPageData,
  NetworkResponse
} from "model";

/**
 * @file 商品相关仓库类，封装商品模块请求
 * @author Joker.X
 */
export class GoodsRepository {
  /**
   * 商品网络数据源
   */
  private networkDataSource: GoodsNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 可选的商品网络数据源实例
   */
  constructor(networkDataSource?: GoodsNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new GoodsNetworkDataSourceImpl();
  }

  /**
   * 查询商品分类列表
   * @returns 商品分类列表
   */
  async getGoodsTypeList(): Promise<NetworkResponse<Category[]>> {
    return this.networkDataSource.getGoodsTypeList();
  }

  /**
   * 查询商品规格列表
   * @param params 查询参数
   * @returns 商品规格列表
   */
  async getGoodsSpecList(params: Record<string, number>): Promise<NetworkResponse<GoodsSpec[]>> {
    return this.networkDataSource.getGoodsSpecList(params);
  }

  /**
   * 查询搜索关键词列表
   * @returns 搜索关键词列表
   */
  async getSearchKeywordList(): Promise<NetworkResponse<GoodsSearchKeyword[]>> {
    return this.networkDataSource.getSearchKeywordList();
  }

  /**
   * 分页查询商品
   * @param params 商品搜索请求参数
   * @returns 商品分页数据
   */
  async getGoodsPage(params: GoodsSearchRequest): Promise<NetworkResponse<NetworkPageData<Goods>>> {
    return this.networkDataSource.getGoodsPage(params);
  }

  /**
   * 获取商品信息
   * @param id 商品ID
   * @returns 商品详情
   */
  async getGoodsInfo(id: string): Promise<NetworkResponse<Goods>> {
    return this.networkDataSource.getGoodsInfo(id);
  }

  /**
   * 提交商品评论
   * @param params 评论提交请求参数
   * @returns 提交结果
   */
  async submitGoodsComment(params: GoodsCommentSubmitRequest): Promise<NetworkResponse<boolean>> {
    return this.networkDataSource.submitGoodsComment(params);
  }

  /**
   * 分页查询商品评论
   * @param params 评论分页请求参数
   * @returns 评论分页数据
   */
  async getGoodsCommentPage(params: GoodsCommentPageRequest): Promise<NetworkResponse<NetworkPageData<Comment>>> {
    return this.networkDataSource.getGoodsCommentPage(params);
  }
}
