/**
 * @file 账号密码本地存储数据源接口
 * @author Joker.X
 */
export interface AccountStoreDataSource {
  /**
   * 保存账号
   * @param {string} account 用户账号
   * @returns {Promise<void>} Promise<void>
   */
  setAccount(account: string): Promise<void>;

  /**
   * 读取账号
   * @returns {Promise<string>} 用户账号，默认空字符串
   */
  getAccount(): Promise<string>;

  /**
   * 保存密码
   * @param {string} password 用户密码
   * @returns {Promise<void>} Promise<void>
   */
  setPassword(password: string): Promise<void>;

  /**
   * 读取密码
   * @returns {Promise<string>} 用户密码，默认空字符串
   */
  getPassword(): Promise<string>;
}
