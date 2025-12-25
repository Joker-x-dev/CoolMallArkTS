import { Address, Id, Ids, NetworkPageData, NetworkResponse, PageRequest } from "model";

/**
 * @file 用户地址相关网络数据源接口
 * @author Joker.X
 */
export interface AddressNetworkDataSource {
  /**
   * 修改地址
   * @param params 地址信息
   * @returns 修改结果响应
   */
  updateAddress(params: Address): Promise<NetworkResponse<void>>;

  /**
   * 分页查询地址
   * @param params 分页请求参数
   * @returns 地址分页数据响应
   */
  getAddressPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<Address>>>;

  /**
   * 查询地址列表
   * @returns 地址列表响应
   */
  getAddressList(): Promise<NetworkResponse<Address[]>>;

  /**
   * 删除地址
   * @param params 地址ID列表
   * @returns 删除结果响应
   */
  deleteAddress(params: Ids): Promise<NetworkResponse<void>>;

  /**
   * 新增地址
   * @param params 地址信息
   * @returns 新增地址ID响应
   */
  addAddress(params: Address): Promise<NetworkResponse<Id>>;

  /**
   * 获取地址信息
   * @param id 地址ID
   * @returns 地址信息响应
   */
  getAddressInfo(id: number): Promise<NetworkResponse<Address>>;

  /**
   * 获取默认地址
   * @returns 默认地址响应
   */
  getDefaultAddress(): Promise<NetworkResponse<Address | null>>;
}
