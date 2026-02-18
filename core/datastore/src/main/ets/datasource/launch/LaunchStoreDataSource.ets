/**
 * @file 启动流程本地存储数据源接口
 * @author Joker.X
 */
export interface LaunchStoreDataSource {
  /**
   * 保存引导页已展示状态
   * @param {boolean} shown - 是否已展示
   * @returns {Promise<void>} Promise<void>
   */
  setGuideShown(shown: boolean): Promise<void>;

  /**
   * 读取引导页已展示状态
   * @returns {Promise<boolean>} 是否已展示
   */
  getGuideShown(): Promise<boolean>;
}
