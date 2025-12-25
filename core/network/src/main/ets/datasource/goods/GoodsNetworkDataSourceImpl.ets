import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
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
import { GoodsNetworkDataSource } from "./GoodsNetworkDataSource";

/**
 * @file 商品相关数据源实现类
 * @author Joker.X
 */
export class GoodsNetworkDataSourceImpl implements GoodsNetworkDataSource {
  /**
   * 查询商品分类列表
   * @returns 商品分类列表响应
   */
  async getGoodsTypeList(): Promise<NetworkResponse<Category[]>> {
    const resp: AxiosResponse<NetworkResponse<Category[]>> =
      await NetworkClient.http.post("goods/type/list");
    return resp.data;
  }

  /**
   * 查询商品规格列表
   * @param params 查询参数
   * @returns 商品规格列表响应
   */
  async getGoodsSpecList(params: Record<string, number>): Promise<NetworkResponse<GoodsSpec[]>> {
    const resp: AxiosResponse<NetworkResponse<GoodsSpec[]>> =
      await NetworkClient.http.post("goods/spec/list", params);
    return resp.data;
  }

  /**
   * 查询搜索关键词列表
   * @returns 搜索关键词列表响应
   */
  async getSearchKeywordList(): Promise<NetworkResponse<GoodsSearchKeyword[]>> {
    const resp: AxiosResponse<NetworkResponse<GoodsSearchKeyword[]>> =
      await NetworkClient.http.post("goods/search/keyword/list");
    return resp.data;
  }

  /**
   * 分页查询商品
   * @param params 商品搜索请求参数
   * @returns 商品分页数据响应
   */
  async getGoodsPage(params: GoodsSearchRequest): Promise<NetworkResponse<NetworkPageData<Goods>>> {
    const resp: AxiosResponse<NetworkResponse<NetworkPageData<Goods>>> =
      await NetworkClient.http.post("goods/info/page", params);
    return resp.data;
  }

  /**
   * 获取商品信息
   * @param id 商品ID
   * @returns 商品信息响应
   */
  async getGoodsInfo(id: string): Promise<NetworkResponse<Goods>> {
    const resp: AxiosResponse<NetworkResponse<Goods>> =
      await NetworkClient.http.get("goods/info/info", { params: { id } });
    return resp.data;
  }

  /**
   * 提交商品评论
   * @param params 评论提交请求参数
   * @returns 提交结果响应
   */
  async submitGoodsComment(params: GoodsCommentSubmitRequest): Promise<NetworkResponse<boolean>> {
    const resp: AxiosResponse<NetworkResponse<boolean>> =
      await NetworkClient.http.post("goods/comment/submit", params);
    return resp.data;
  }

  /**
   * 分页查询商品评论
   * @param params 评论分页请求参数
   * @returns 评论分页数据响应
   */
  async getGoodsCommentPage(params: GoodsCommentPageRequest): Promise<NetworkResponse<NetworkPageData<Comment>>> {
    const resp: AxiosResponse<NetworkResponse<NetworkPageData<Comment>>> =
      await NetworkClient.http.post("goods/comment/page", params);
    return resp.data;
  }
}
