import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { Feedback, FeedbackSubmitRequest, NetworkPageData, NetworkResponse, PageRequest } from "model";
import { FeedbackNetworkDataSource } from "./FeedbackNetworkDataSource";

/**
 * @file 意见反馈数据源实现类
 * @author Joker.X
 */
export class FeedbackNetworkDataSourceImpl implements FeedbackNetworkDataSource {
  /**
   * 提交反馈
   * @param {FeedbackSubmitRequest} params - 反馈内容
   * @returns {Promise<NetworkResponse<boolean>>} 是否提交成功
   */
  async submitFeedback(params: FeedbackSubmitRequest): Promise<NetworkResponse<boolean>> {
    const resp: AxiosResponse<NetworkResponse<boolean>> =
      await NetworkClient.http.post("app/feedback/submit", params);
    return resp.data;
  }

  /**
   * 获取反馈分页列表
   * @param {PageRequest} params - 分页参数
   * @returns {Promise<NetworkResponse<NetworkPageData<Feedback>>>} 反馈分页数据
   */
  async getFeedbackPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<Feedback>>> {
    const resp: AxiosResponse<NetworkResponse<NetworkPageData<Feedback>>> =
      await NetworkClient.http.post("app/feedback/page", params);
    return resp.data;
  }

  /**
   * 获取反馈详情
   * @param {number} id - 反馈 ID
   * @returns {Promise<NetworkResponse<Feedback>>} 反馈详情
   */
  async getFeedbackDetail(id: number): Promise<NetworkResponse<Feedback>> {
    const resp: AxiosResponse<NetworkResponse<Feedback>> =
      await NetworkClient.http.get("app/feedback/detail", { params: { id } });
    return resp.data;
  }
}
