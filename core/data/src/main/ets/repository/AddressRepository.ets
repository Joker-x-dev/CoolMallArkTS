import { AddressNetworkDataSource, AddressNetworkDataSourceImpl } from "network";
import { Address, Id, Ids, NetworkPageData, NetworkResponse, PageRequest } from "model";

/**
 * @file 用户地址仓库，封装用户地址相关请求
 * @author Joker.X
 */
export class AddressRepository {
  /**
   * 地址网络数据源
   */
  private networkDataSource: AddressNetworkDataSource;

  /**
   * 构造函数
   * @param networkDataSource 可选的网络数据源实例
   */
  constructor(networkDataSource?: AddressNetworkDataSource) {
    this.networkDataSource = networkDataSource ?? new AddressNetworkDataSourceImpl();
  }

  /**
   * 修改地址
   * @param params 地址信息
   * @returns 修改结果
   */
  async updateAddress(params: Address): Promise<NetworkResponse<void>> {
    return this.networkDataSource.updateAddress(params);
  }

  /**
   * 分页查询地址
   * @param params 分页查询参数
   * @returns 地址分页数据
   */
  async getAddressPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<Address>>> {
    return this.networkDataSource.getAddressPage(params);
  }

  /**
   * 查询地址列表
   * @returns 地址列表
   */
  async getAddressList(): Promise<NetworkResponse<Address[]>> {
    return this.networkDataSource.getAddressList();
  }

  /**
   * 删除地址
   * @param params 待删除地址ID集合
   * @returns 删除结果
   */
  async deleteAddress(params: Ids): Promise<NetworkResponse<void>> {
    return this.networkDataSource.deleteAddress(params);
  }

  /**
   * 新增地址
   * @param params 地址信息
   * @returns 新增地址ID
   */
  async addAddress(params: Address): Promise<NetworkResponse<Id>> {
    return this.networkDataSource.addAddress(params);
  }

  /**
   * 获取地址信息
   * @param id 地址ID
   * @returns 地址详情
   */
  async getAddressInfo(id: number): Promise<NetworkResponse<Address>> {
    return this.networkDataSource.getAddressInfo(id);
  }

  /**
   * 获取默认地址
   * @returns 默认地址或 null
   */
  async getDefaultAddress(): Promise<NetworkResponse<Address | null>> {
    return this.networkDataSource.getDefaultAddress();
  }
}
