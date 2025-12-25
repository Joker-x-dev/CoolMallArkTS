import common from "@ohos.app.ability.common";
import { AccountStoreDataSource, AccountStoreDataSourceImpl } from "datastore";

/**
 * @file 账号密码本地存储仓库，封装存取逻辑
 * @author Joker.X
 */
export class AccountStoreRepository {
  /**
   * 本地数据源实例
   */
  private dataSource: AccountStoreDataSource;

  /**
   * 构造函数
   * @param {common.Context} context UIAbility 上下文
   * @param {AccountStoreDataSource} [dataSource] 可选自定义数据源
   */
  constructor(context: common.Context, dataSource?: AccountStoreDataSource) {
    this.dataSource = dataSource ?? new AccountStoreDataSourceImpl(context);
  }

  /**
   * 保存账号
   * @param {string} account 用户账号
   * @returns {Promise<void>} Promise<void>
   */
  saveAccount(account: string): Promise<void> {
    return this.dataSource.setAccount(account);
  }

  /**
   * 读取账号
   * @returns {Promise<string>} 用户账号，默认空字符串
   */
  loadAccount(): Promise<string> {
    return this.dataSource.getAccount();
  }

  /**
   * 保存密码
   * @param {string} password 用户密码
   * @returns {Promise<void>} Promise<void>
   */
  savePassword(password: string): Promise<void> {
    return this.dataSource.setPassword(password);
  }

  /**
   * 读取密码
   * @returns {Promise<string>} 用户密码，默认空字符串
   */
  loadPassword(): Promise<string> {
    return this.dataSource.getPassword();
  }
}
