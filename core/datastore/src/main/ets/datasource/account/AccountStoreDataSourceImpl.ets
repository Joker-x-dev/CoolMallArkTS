import common from "@ohos.app.ability.common";
import preferences from "@ohos.data.preferences";
import { PreferencesUtil } from "util";
import { AccountStoreDataSource } from "./AccountStoreDataSource";

/**
 * @file 账号密码本地存储数据源实现，基于 Preferences 封装
 * @author Joker.X
 */
export class AccountStoreDataSourceImpl implements AccountStoreDataSource {
  /**
   * Preferences 工具实例
   */
  private prefs: PreferencesUtil;
  /**
   * Preferences 文件名，用于存储账号密码
   */
  private static readonly PREFS_NAME: string = "account_store";
  /**
   * 账号键名
   */
  private static readonly KEY_ACCOUNT: string = "account";
  /**
   * 密码键名
   */
  private static readonly KEY_PASSWORD: string = "password";

  /**
   * 构造函数
   * @param {common.Context} context UIAbility 上下文
   */
  constructor(context: common.Context) {
    this.prefs = new PreferencesUtil(context, AccountStoreDataSourceImpl.PREFS_NAME);
  }

  /**
   * 保存账号
   * @param {string} account 用户账号
   * @returns {Promise<void>} Promise<void>
   */
  async setAccount(account: string): Promise<void> {
    await this.prefs.set(AccountStoreDataSourceImpl.KEY_ACCOUNT, account);
  }

  /**
   * 读取账号（默认返回空字符串）
   * @returns {Promise<string>} 用户账号
   */
  async getAccount(): Promise<string> {
    const value: preferences.ValueType = await this.prefs.get(AccountStoreDataSourceImpl.KEY_ACCOUNT, "");
    return typeof value === "string" ? value : "";
  }

  /**
   * 保存密码
   * @param {string} password 用户密码
   * @returns {Promise<void>} Promise<void>
   */
  async setPassword(password: string): Promise<void> {
    await this.prefs.set(AccountStoreDataSourceImpl.KEY_PASSWORD, password);
  }

  /**
   * 读取密码（默认返回空字符串）
   * @returns {Promise<string>} 用户密码
   */
  async getPassword(): Promise<string> {
    const value: preferences.ValueType = await this.prefs.get(AccountStoreDataSourceImpl.KEY_PASSWORD, "");
    return typeof value === "string" ? value : "";
  }
}
