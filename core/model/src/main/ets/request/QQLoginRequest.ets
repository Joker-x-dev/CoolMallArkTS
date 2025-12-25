/**
 * @file QQ 登录/绑定请求模型
 * @author Joker.X
 */
export class QQLoginRequest {
  /**
   * 访问令牌
   */
  accessToken: string = "";
  /**
   * 用户唯一标识
   */
  openId: string = "";

  /**
   * @param {Partial<QQLoginRequest>} init - 初始化数据
   */
  constructor(init?: Partial<QQLoginRequest>) {
    if (!init) return;
    this.accessToken = init.accessToken ?? this.accessToken;
    this.openId = init.openId ?? this.openId;
  }
}
