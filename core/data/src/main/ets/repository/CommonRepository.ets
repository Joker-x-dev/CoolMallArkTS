import { CommonNetworkDataSource, CommonNetworkDataSourceImpl } from "network";
import { DictDataRequest, DictDataResponse, NetworkResponse, Unknown } from "model";

/**
 * @file 公共基础仓库
 * @author Joker.X
 */
export class CommonRepository {
  /**
   * 通用网络数据源
   */
  private networkDataSource: CommonNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 可选的数据源实例，便于单元测试注入
   */
  constructor(networkDataSource?: CommonNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new CommonNetworkDataSourceImpl();
  }

  /**
   * 获取系统参数配置
   * @param key 参数键
   * @returns 系统参数配置值
   */
  async getParam(key: string): Promise<NetworkResponse<string>> {
    return this.networkDataSource.getParam(key);
  }

  /**
   * 获取实体信息与路径
   * @returns 实体信息与路径
   */
  async getEntityPathInfo(): Promise<NetworkResponse<Unknown>> {
    return this.networkDataSource.getEntityPathInfo();
  }

  /**
   * 获取字典数据
   * @param request 字典数据请求参数
   * @returns 字典数据结果
   */
  async getDictData(request: DictDataRequest): Promise<NetworkResponse<DictDataResponse>> {
    return this.networkDataSource.getDictData(request);
  }
}
