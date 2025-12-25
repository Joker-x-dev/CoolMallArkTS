import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { CsMsg, CsSession, MessagePageRequest, NetworkPageData, NetworkResponse, ReadMessageRequest } from "model";
import { CustomerServiceNetworkDataSource } from "./CustomerServiceNetworkDataSource";

/**
 * @file 客服相关数据源实现类
 * @author Joker.X
 */
export class CustomerServiceNetworkDataSourceImpl implements CustomerServiceNetworkDataSource {
  /**
   * 创建客服会话
   * @returns {Promise<NetworkResponse<CsSession>>} 会话信息
   */
  async createSession(): Promise<NetworkResponse<CsSession>> {
    const resp: AxiosResponse<NetworkResponse<CsSession>> =
      await NetworkClient.http.post("cs/session/create");
    return resp.data;
  }

  /**
   * 获取会话详情
   * @returns {Promise<NetworkResponse<CsSession>>} 会话详情
   */
  async getSessionDetail(): Promise<NetworkResponse<CsSession>> {
    const resp: AxiosResponse<NetworkResponse<CsSession>> =
      await NetworkClient.http.get("cs/session/detail");
    return resp.data;
  }

  /**
   * 设置消息已读
   * @param {ReadMessageRequest} params - 已读参数
   * @returns {Promise<NetworkResponse<boolean>>} 是否成功
   */
  async readMessage(params: ReadMessageRequest): Promise<NetworkResponse<boolean>> {
    const resp: AxiosResponse<NetworkResponse<boolean>> =
      await NetworkClient.http.post("cs/msg/read", params);
    return resp.data;
  }

  /**
   * 分页获取消息
   * @param {MessagePageRequest} params - 分页参数
   * @returns {Promise<NetworkResponse<NetworkPageData<CsMsg>>>} 消息分页数据
   */
  async getMessagePage(params: MessagePageRequest): Promise<NetworkResponse<NetworkPageData<CsMsg>>> {
    const resp: AxiosResponse<NetworkResponse<NetworkPageData<CsMsg>>> =
      await NetworkClient.http.post("cs/msg/page", params);
    return resp.data;
  }

  /**
   * 获取未读消息数量
   * @returns {Promise<NetworkResponse<number>>} 未读数量
   */
  async getUnreadCount(): Promise<NetworkResponse<number>> {
    const resp: AxiosResponse<NetworkResponse<number>> =
      await NetworkClient.http.get("cs/msg/unreadCount");
    return resp.data;
  }
}
