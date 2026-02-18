import { LaunchStoreDataSource, LaunchStoreDataSourceImpl } from "datastore";

/**
 * @file 启动流程本地存储仓库
 * @author Joker.X
 */
export class LaunchStoreRepository {
  /**
   * 本地数据源实例
   */
  private dataSource: LaunchStoreDataSource;

  /**
   * 构造函数
   * @param {LaunchStoreDataSource} [dataSource] 可选自定义数据源
   */
  constructor(dataSource?: LaunchStoreDataSource) {
    this.dataSource = dataSource ?? new LaunchStoreDataSourceImpl();
  }

  /**
   * 保存引导页已展示状态
   * @param {boolean} shown - 是否已展示
   * @returns {Promise<void>} Promise<void>
   */
  saveGuideShown(shown: boolean): Promise<void> {
    return this.dataSource.setGuideShown(shown);
  }

  /**
   * 读取引导页已展示状态
   * @returns {Promise<boolean>} 是否已展示
   */
  loadGuideShown(): Promise<boolean> {
    return this.dataSource.getGuideShown();
  }
}
