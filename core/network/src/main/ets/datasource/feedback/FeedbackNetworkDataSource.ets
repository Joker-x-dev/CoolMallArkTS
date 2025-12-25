import { Feedback, NetworkPageData, NetworkResponse, FeedbackSubmitRequest, PageRequest } from "model";

/**
 * @file 意见反馈数据源接口
 * @author Joker.X
 */
export interface FeedbackNetworkDataSource {
  /**
   * 提交意见反馈
   * @param params 反馈提交请求参数
   * @returns 提交结果响应
   */
  submitFeedback(params: FeedbackSubmitRequest): Promise<NetworkResponse<boolean>>;

  /**
   * 分页查询意见反馈列表
   * @param params 分页请求参数
   * @returns 反馈分页数据响应
   */
  getFeedbackPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<Feedback>>>;
}
