import { AuthNetworkDataSource, AuthNetworkDataSourceImpl } from "network";
import { NetworkResponse, Auth, Captcha, QQLoginRequest } from "model";

/**
 * @file 认证相关仓库类，封装认证模块请求
 * @author Joker.X
 */
export class AuthRepository {
  /**
   * 认证网络数据源
   */
  private networkDataSource: AuthNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 可选的认证网络数据源实例
   */
  constructor(networkDataSource?: AuthNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new AuthNetworkDataSourceImpl();
  }

  /**
   * 微信 APP 授权登录
   * @param {Record<string, string>} params - 微信授权参数
   * @returns {Promise<NetworkResponse<Auth>>} 认证结果
   */
  async loginByWxApp(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    return this.networkDataSource.loginByWxApp(params);
  }

  /**
   * QQ APP 授权登录
   * @param {QQLoginRequest} params - QQ 授权参数
   * @returns {Promise<NetworkResponse<Auth>>} 认证结果
   */
  async loginByQqApp(params: QQLoginRequest): Promise<NetworkResponse<Auth>> {
    return this.networkDataSource.loginByQqApp(params);
  }

  /**
   * 用户注册
   * @param {Record<string, string>} params - 注册参数
   * @returns {Promise<NetworkResponse<Auth>>} 注册结果
   */
  async register(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    return this.networkDataSource.register(params);
  }

  /**
   * 获取短信验证码
   * @param {Record<string, string>} params - 验证码请求参数
   * @returns {Promise<NetworkResponse<string>>} 短信发送结果
   */
  async getSmsCode(params: Record<string, string>): Promise<NetworkResponse<string>> {
    return this.networkDataSource.getSmsCode(params);
  }

  /**
   * 刷新 Token
   * @param {Record<string, string>} params - 刷新参数
   * @returns {Promise<NetworkResponse<Auth>>} 刷新后的认证信息
   */
  async refreshToken(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    return this.networkDataSource.refreshToken(params);
  }

  /**
   * 手机号验证码登录
   * @param {Record<string, string>} params - 登录参数
   * @returns {Promise<NetworkResponse<Auth>>} 登录结果
   */
  async loginByPhone(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    return this.networkDataSource.loginByPhone(params);
  }

  /**
   * 密码登录
   * @param params 登录参数，包含用户名、密码等
   * @returns 包含认证信息的网络响应
   */
  async loginByPassword(params: Record<string, string>): Promise<NetworkResponse<Auth>> {
    return this.networkDataSource.loginByPassword(params);
  }

  /**
   * 获取图片验证码
   * @returns {Promise<NetworkResponse<Captcha>>} 图片验证码
   */
  async getCaptcha(): Promise<NetworkResponse<Captcha>> {
    return this.networkDataSource.getCaptcha();
  }
}
