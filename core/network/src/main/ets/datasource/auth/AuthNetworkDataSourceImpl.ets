import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { Auth, Captcha, NetworkResponse, QQLoginRequest } from "model";
import { AuthNetworkDataSource } from "./AuthNetworkDataSource";

/**
 * @file 认证相关网络数据源实现类
 * @author Joker.X
 */
export class AuthNetworkDataSourceImpl implements AuthNetworkDataSource {
  /**
   * 微信 APP 授权登录
   * @param {Record<string, string>} params - 微信授权参数
   * @returns {Promise<NetworkResponse<Auth>>} 登录结果
   */
  async loginByWxApp(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    const response: AxiosResponse<NetworkResponse<Auth>> =
      await NetworkClient.http.post("user/login/wxApp", params);
    return response.data;
  }

  /**
   * QQ APP 授权登录
   * @param {QQLoginRequest} params - QQ 授权参数
   * @returns {Promise<NetworkResponse<Auth>>} 登录结果
   */
  async loginByQqApp(params: QQLoginRequest): Promise<NetworkResponse<Auth>> {
    const response: AxiosResponse<NetworkResponse<Auth>> =
      await NetworkClient.http.post("user/login/qq", params);
    return response.data;
  }

  /**
   * 用户注册
   * @param {Record<string, string>} params - 注册参数
   * @returns {Promise<NetworkResponse<Auth>>} 注册结果
   */
  async register(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    const response: AxiosResponse<NetworkResponse<Auth>> =
      await NetworkClient.http.post("user/login/register", params);
    return response.data;
  }

  /**
   * 获取短信验证码
   * @param {Record<string, string>} params - 验证码请求参数
   * @returns {Promise<NetworkResponse<string>>} 发送结果
   */
  async getSmsCode(params: Record<string, string>): Promise<NetworkResponse<string>> {
    const response: AxiosResponse<NetworkResponse<string>> =
      await NetworkClient.http.post("user/login/smsCode", params);
    return response.data;
  }

  /**
   * 刷新 Token
   * @param {Record<string, string>} params - 刷新参数
   * @returns {Promise<NetworkResponse<Auth>>} 刷新后的认证信息
   */
  async refreshToken(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    const response: AxiosResponse<NetworkResponse<Auth>> =
      await NetworkClient.http.post("user/login/refreshToken", params);
    return response.data;
  }

  /**
   * 手机号验证码登录
   * @param {Record<string, string>} params - 手机号登录参数
   * @returns {Promise<NetworkResponse<Auth>>} 登录结果
   */
  async loginByPhone(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    const response: AxiosResponse<NetworkResponse<Auth>> =
      await NetworkClient.http.post("user/login/phone", params);
    return response.data;
  }

  /**
   * 密码登录实现
   * @param {Record<string, string>} params - 登录参数
   * @returns {Promise<NetworkResponse<Auth>>} 登录结果
   */
  async loginByPassword(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    const response: AxiosResponse<NetworkResponse<Auth>> =
      await NetworkClient.http.post("user/login/password", params);
    return response.data;
  }

  /**
   * 获取图片验证码
   * @returns {Promise<NetworkResponse<Captcha>>} 图片验证码
   */
  async getCaptcha(): Promise<NetworkResponse<Captcha>> {
    const response: AxiosResponse<NetworkResponse<Captcha>> =
      await NetworkClient.http.get("user/login/captcha");
    return response.data;
  }
}
