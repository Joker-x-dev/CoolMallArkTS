import {
  Category,
  Comment,
  Goods,
  GoodsSearchKeyword,
  GoodsSpec,
  NetworkPageData,
  NetworkResponse,
  GoodsSearchRequest,
  GoodsCommentSubmitRequest,
  GoodsCommentPageRequest
} from "model";

/**
 * @file 商品相关数据源接口
 * 定义商品模块所需的所有网络请求操作
 * @author Joker.X
 */
export interface GoodsNetworkDataSource {
  /**
   * 查询商品分类列表
   * @returns 商品分类列表响应
   */
  getGoodsTypeList(): Promise<NetworkResponse<Category[]>>;

  /**
   * 查询商品规格列表
   * @param params 查询参数
   * @returns 商品规格列表响应
   */
  getGoodsSpecList(params: Record<string, number>): Promise<NetworkResponse<GoodsSpec[]>>;

  /**
   * 查询搜索关键词列表
   * @returns 搜索关键词列表响应
   */
  getSearchKeywordList(): Promise<NetworkResponse<GoodsSearchKeyword[]>>;

  /**
   * 分页查询商品
   * @param params 商品搜索请求参数
   * @returns 商品分页数据响应
   */
  getGoodsPage(params: GoodsSearchRequest): Promise<NetworkResponse<NetworkPageData<Goods>>>;

  /**
   * 获取商品信息
   * @param id 商品ID
   * @returns 商品信息响应
   */
  getGoodsInfo(id: string): Promise<NetworkResponse<Goods>>;

  /**
   * 提交商品评论
   * @param params 评论提交请求参数
   * @returns 提交结果响应
   */
  submitGoodsComment(params: GoodsCommentSubmitRequest): Promise<NetworkResponse<boolean>>;

  /**
   * 分页查询商品评论
   * @param params 评论分页请求参数
   * @returns 评论分页数据响应
   */
  getGoodsCommentPage(params: GoodsCommentPageRequest): Promise<NetworkResponse<NetworkPageData<Comment>>>;
}
