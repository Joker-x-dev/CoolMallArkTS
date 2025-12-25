import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { DictDataRequest, DictDataResponse, NetworkResponse, Unknown } from "model";
import { CommonNetworkDataSource } from "./CommonNetworkDataSource";

/**
 * @file 通用基础接口数据源实现
 * @author Joker.X
 */
export class CommonNetworkDataSourceImpl implements CommonNetworkDataSource {
  /**
   * 获取系统参数
   * @param {string} key - 参数键
   * @returns {Promise<NetworkResponse<string>>} 参数值
   */
  async getParam(key: string): Promise<NetworkResponse<string>> {
    const resp: AxiosResponse<NetworkResponse<string>> =
      await NetworkClient.http.get("base/comm/param", { params: { key } });
    return resp.data;
  }

  /**
   * 获取实体路径配置
   * @returns {Promise<NetworkResponse<Unknown>>} 路径配置
   */
  async getEntityPathInfo(): Promise<NetworkResponse<Unknown>> {
    const resp: AxiosResponse<NetworkResponse<Unknown>> =
      await NetworkClient.http.get("base/comm/eps");
    return resp.data;
  }

  /**
   * 获取字典数据
   * @param {DictDataRequest} request - 字典查询参数
   * @returns {Promise<NetworkResponse<DictDataResponse>>} 字典数据
   */
  async getDictData(request: DictDataRequest): Promise<NetworkResponse<DictDataResponse>> {
    const resp: AxiosResponse<NetworkResponse<DictDataResponse>> =
      await NetworkClient.http.post("dict/info/data", request);
    return resp.data;
  }
}
