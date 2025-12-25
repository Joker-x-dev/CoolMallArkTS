import { FeedbackNetworkDataSource, FeedbackNetworkDataSourceImpl } from "network";
import { Feedback, FeedbackSubmitRequest, NetworkPageData, NetworkResponse, PageRequest } from "model";

/**
 * @file 意见反馈仓库，封装反馈相关请求
 * @author Joker.X
 */
export class FeedbackRepository {
  /**
   * 反馈网络数据源
   */
  private networkDataSource: FeedbackNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 反馈网络数据源
   */
  constructor(networkDataSource?: FeedbackNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new FeedbackNetworkDataSourceImpl();
  }

  /**
   * 提交意见反馈
   * @param params 反馈提交请求参数
   * @returns 提交结果
   */
  async submitFeedback(params: FeedbackSubmitRequest): Promise<NetworkResponse<boolean>> {
    return this.networkDataSource.submitFeedback(params);
  }

  /**
   * 分页查询意见反馈列表
   * @param params 分页请求参数
   * @returns 反馈分页数据
   */
  async getFeedbackPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<Feedback>>> {
    return this.networkDataSource.getFeedbackPage(params);
  }
}
