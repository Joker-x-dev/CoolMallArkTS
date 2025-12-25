import { NetworkPageData, NetworkResponse, PageRequest, UserContributor } from "model";

/**
 * @file 用户贡献者相关数据源接口
 * @author Joker.X
 */
export interface UserContributorNetworkDataSource {
  /**
   * 分页查询用户贡献者
   * @param params 分页请求参数
   * @returns 用户贡献者分页数据响应
   */
  getUserContributorPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<UserContributor>>>;
}
