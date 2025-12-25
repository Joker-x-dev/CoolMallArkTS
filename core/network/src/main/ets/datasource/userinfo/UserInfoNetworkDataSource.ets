import { NetworkResponse, Unknown, User } from "model";

/**
 * @file 用户信息相关数据源接口
 * @author Joker.X
 */
export interface UserInfoNetworkDataSource {
  /**
   * 更新用户个人信息
   * @param params 用户信息参数
   * @returns 更新结果响应
   */
  updatePersonInfo(params: Record<string, Unknown>): Promise<NetworkResponse<Unknown>>;

  /**
   * 更新用户密码
   * @param params 密码参数
   * @returns 更新结果响应
   */
  updatePassword(params: Record<string, string>): Promise<NetworkResponse<Unknown>>;

  /**
   * 注销账号
   * @param params 注销参数
   * @returns 注销结果响应
   */
  logoff(params: Record<string, Unknown>): Promise<NetworkResponse<Unknown>>;

  /**
   * 绑定手机号
   * @param params 绑定参数
   * @returns 绑定结果响应
   */
  bindPhone(params: Record<string, string>): Promise<NetworkResponse<Unknown>>;

  /**
   * 获取用户个人信息
   * @returns 用户信息响应
   */
  getPersonInfo(): Promise<NetworkResponse<User>>;
}
