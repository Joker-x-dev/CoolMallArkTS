import { CsMsg, CsSession, MessagePageRequest, NetworkPageData, NetworkResponse, ReadMessageRequest } from "model";

/**
 * @file 客服相关数据源接口
 * @author Joker.X
 */
export interface CustomerServiceNetworkDataSource {
  /**
   * 创建客服会话
   * @returns 客服会话响应
   */
  createSession(): Promise<NetworkResponse<CsSession>>;

  /**
   * 获取会话详情
   * @returns 会话详情响应
   */
  getSessionDetail(): Promise<NetworkResponse<CsSession>>;

  /**
   * 标记消息为已读
   * @param params 已读消息请求参数
   * @returns 操作结果响应
   */
  readMessage(params: ReadMessageRequest): Promise<NetworkResponse<boolean>>;

  /**
   * 分页查询消息
   * @param params 消息分页请求参数
   * @returns 消息分页数据响应
   */
  getMessagePage(params: MessagePageRequest): Promise<NetworkResponse<NetworkPageData<CsMsg>>>;

  /**
   * 获取未读消息数
   * @returns 未读消息数响应
   */
  getUnreadCount(): Promise<NetworkResponse<number>>;
}
