import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { NetworkResponse, Unknown, User } from "model";
import { UserInfoNetworkDataSource } from "./UserInfoNetworkDataSource";

/**
 * @file 用户信息相关数据源实现类
 * @author Joker.X
 */
export class UserInfoNetworkDataSourceImpl implements UserInfoNetworkDataSource {
  /**
   * 更新个人信息
   * @param {Record<string, unknown>} params - 更新参数
   * @returns {Promise<NetworkResponse<Unknown>>} 更新结果
   */
  async updatePersonInfo(params: Record<string, Unknown>): Promise<NetworkResponse<Unknown>> {
    const resp: AxiosResponse<NetworkResponse<Unknown>> =
      await NetworkClient.http.post("user/info/updatePerson", params);
    return resp.data;
  }

  /**
   * 修改密码
   * @param {Record<string, string>} params - 修改密码参数
   * @returns {Promise<NetworkResponse<Unknown>>} 修改结果
   */
  async updatePassword(params: Record<string, string>): Promise<NetworkResponse<Unknown>> {
    const resp: AxiosResponse<NetworkResponse<Unknown>> =
      await NetworkClient.http.post("user/info/updatePassword", params);
    return resp.data;
  }

  /**
   * 注销账号
   * @param {Record<string, unknown>} params - 注销参数
   * @returns {Promise<NetworkResponse<Unknown>>} 注销结果
   */
  async logoff(params: Record<string, Unknown>): Promise<NetworkResponse<Unknown>> {
    const resp: AxiosResponse<NetworkResponse<Unknown>> =
      await NetworkClient.http.post("user/info/logoff", params);
    return resp.data;
  }

  /**
   * 绑定手机号
   * @param {Record<string, string>} params - 绑定参数
   * @returns {Promise<NetworkResponse<Unknown>>} 绑定结果
   */
  async bindPhone(params: Record<string, string>): Promise<NetworkResponse<Unknown>> {
    const resp: AxiosResponse<NetworkResponse<Unknown>> =
      await NetworkClient.http.post("user/info/bindPhone", params);
    return resp.data;
  }

  /**
   * 获取个人信息
   * @returns {Promise<NetworkResponse<User>>} 个人信息
   */
  async getPersonInfo(): Promise<NetworkResponse<User>> {
    const resp: AxiosResponse<NetworkResponse<User>> =
      await NetworkClient.http.get("user/info/person");
    return resp.data;
  }
}
