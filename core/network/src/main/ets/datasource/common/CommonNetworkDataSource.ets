import { DictDataRequest, DictDataResponse, NetworkResponse, Unknown } from "model";

/**
 * @file 通用基础接口数据源
 * @author Joker.X
 */
export interface CommonNetworkDataSource {
  /**
   * 获取系统参数配置
   * @param key 参数键
   * @returns 参数值响应
   */
  getParam(key: string): Promise<NetworkResponse<string>>;

  /**
   * 获取实体信息与路径
   * @returns 实体信息响应
   */
  getEntityPathInfo(): Promise<NetworkResponse<Unknown>>;

  /**
   * 获取字典数据
   * @param request 字典数据请求参数
   * @returns 字典数据响应
   */
  getDictData(request: DictDataRequest): Promise<NetworkResponse<DictDataResponse>>;
}
