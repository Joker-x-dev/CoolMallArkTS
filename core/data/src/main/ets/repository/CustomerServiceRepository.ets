import { CustomerServiceNetworkDataSource, CustomerServiceNetworkDataSourceImpl } from "network";
import { CsMsg, CsSession, MessagePageRequest, NetworkPageData, NetworkResponse, ReadMessageRequest } from "model";

/**
 * @file 客服仓库，封装客服相关请求
 * @author Joker.X
 */
export class CustomerServiceRepository {
  /**
   * 客服网络数据源
   */
  private networkDataSource: CustomerServiceNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 客服网络数据源
   */
  constructor(networkDataSource?: CustomerServiceNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new CustomerServiceNetworkDataSourceImpl();
  }

  /**
   * 创建客服会话
   * @returns 客服会话信息
   */
  async createSession(): Promise<NetworkResponse<CsSession>> {
    return this.networkDataSource.createSession();
  }

  /**
   * 获取会话详情
   * @returns 会话详情
   */
  async getSessionDetail(): Promise<NetworkResponse<CsSession>> {
    return this.networkDataSource.getSessionDetail();
  }

  /**
   * 标记消息为已读
   * @param params 标记消息为已读请求参数
   * @returns 操作结果
   */
  async readMessage(params: ReadMessageRequest): Promise<NetworkResponse<boolean>> {
    return this.networkDataSource.readMessage(params);
  }

  /**
   * 分页查询消息
   * @param params 分页查询消息请求参数
   * @returns 消息分页数据
   */
  async getMessagePage(params: MessagePageRequest): Promise<NetworkResponse<NetworkPageData<CsMsg>>> {
    return this.networkDataSource.getMessagePage(params);
  }

  /**
   * 获取未读消息数
   * @returns 未读消息数量
   */
  async getUnreadCount(): Promise<NetworkResponse<number>> {
    return this.networkDataSource.getUnreadCount();
  }
}
