import { Auth, Captcha, NetworkResponse, QQLoginRequest } from "model";

/**
 * @file 认证相关网络数据源接口
 * 定义认证模块所需的所有网络请求操作
 * @author Joker.X
 */
export interface AuthNetworkDataSource {
  /**
   * 微信 APP 授权登录
   * @param {Record<string, string>} params - 微信授权参数
   * @returns {Promise<NetworkResponse<Auth>>} 认证结果
   */
  loginByWxApp(params: Record<string, string>): Promise<NetworkResponse<Auth>>;

  /**
   * QQ APP 授权登录
   * @param {QQLoginRequest} params - QQ 授权参数
   * @returns {Promise<NetworkResponse<Auth>>} 认证结果
   */
  loginByQqApp(params: QQLoginRequest): Promise<NetworkResponse<Auth>>;

  /**
   * 用户注册
   * @param {Record<string, string>} params - 注册参数
   * @returns {Promise<NetworkResponse<Auth>>} 注册结果
   */
  register(params: Record<string, string>): Promise<NetworkResponse<Auth>>;

  /**
   * 获取短信验证码
   * @param {Record<string, string>} params - 验证码请求参数
   * @returns {Promise<NetworkResponse<string>>} 短信验证码发送结果
   */
  getSmsCode(params: Record<string, string>): Promise<NetworkResponse<string>>;

  /**
   * 刷新 Token
   * @param {Record<string, string>} params - 刷新参数，包含 refresh_token
   * @returns {Promise<NetworkResponse<Auth>>} 刷新后的认证信息
   */
  refreshToken(params: Record<string, string>): Promise<NetworkResponse<Auth>>;

  /**
   * 手机号验证码登录
   * @param {Record<string, string>} params - 手机号登录参数
   * @returns {Promise<NetworkResponse<Auth>>} 登录结果
   */
  loginByPhone(params: Record<string, string>): Promise<NetworkResponse<Auth>>;

  /**
   * 密码登录
   * @param params 登录参数，包含用户名、密码等
   * @return 返回 Promise，包含认证结果
   */
  loginByPassword(params: Record<string, string>): Promise<NetworkResponse<Auth>>;

  /**
   * 获取图片验证码
   * @returns {Promise<NetworkResponse<Captcha>>} 图片验证码
   */
  getCaptcha(): Promise<NetworkResponse<Captcha>>;
}
