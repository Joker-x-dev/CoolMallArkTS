import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { NetworkPageData, NetworkResponse, PageRequest, UserContributor } from "model";
import { UserContributorNetworkDataSource } from "./UserContributorNetworkDataSource";

/**
 * @file 用户贡献者相关数据源实现类
 * @author Joker.X
 */
export class UserContributorNetworkDataSourceImpl implements UserContributorNetworkDataSource {
  /**
   * 获取用户贡献者分页数据
   * @param {PageRequest} params - 分页参数
   * @returns {Promise<NetworkResponse<NetworkPageData<UserContributor>>>} 贡献者列表
   */
  async getUserContributorPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<UserContributor>>> {
    const resp: AxiosResponse<NetworkResponse<NetworkPageData<UserContributor>>> =
      await NetworkClient.http.post("user/contributor/page", params);
    return resp.data;
  }
}
