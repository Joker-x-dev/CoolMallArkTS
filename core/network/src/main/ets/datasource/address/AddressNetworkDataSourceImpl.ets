import { AxiosResponse } from "@ohos/axios";
import { NetworkClient } from "../../NetworkClient";
import { Address, Id, Ids, NetworkPageData, NetworkResponse, PageRequest } from "model";
import { AddressNetworkDataSource } from "./AddressNetworkDataSource";

/**
 * @file 用户地址相关网络数据源实现类
 * @author Joker.X
 */
export class AddressNetworkDataSourceImpl implements AddressNetworkDataSource {
  /**
   * 更新地址
   * @param {Address} params - 地址信息
   * @returns {Promise<NetworkResponse<void>>} 更新结果
   */
  async updateAddress(params: Address): Promise<NetworkResponse<void>> {
    const resp: AxiosResponse<NetworkResponse<void>> =
      await NetworkClient.http.post("user/address/update", params);
    return resp.data;
  }

  /**
   * 分页获取地址列表
   * @param {PageRequest} params - 分页参数
   * @returns {Promise<NetworkResponse<NetworkPageData<Address>>>} 地址分页数据
   */
  async getAddressPage(params: PageRequest): Promise<NetworkResponse<NetworkPageData<Address>>> {
    const resp: AxiosResponse<NetworkResponse<NetworkPageData<Address>>> =
      await NetworkClient.http.post("user/address/page", params);
    return resp.data;
  }

  /**
   * 获取地址列表
   * @returns {Promise<NetworkResponse<Address[]>>} 地址列表
   */
  async getAddressList(): Promise<NetworkResponse<Address[]>> {
    const resp: AxiosResponse<NetworkResponse<Address[]>> =
      await NetworkClient.http.post("user/address/list");
    return resp.data;
  }

  /**
   * 删除地址
   * @param {{ ids: number[] }} params - 地址 ID 集合
   * @returns {Promise<NetworkResponse<void>>} 删除结果
   */
  async deleteAddress(params: Ids): Promise<NetworkResponse<void>> {
    const resp: AxiosResponse<NetworkResponse<void>> =
      await NetworkClient.http.post("user/address/delete", params);
    return resp.data;
  }

  /**
   * 新增地址
   * @param {Address} params - 地址信息
   * @returns {Promise<NetworkResponse<{ id: number }>>} 新增结果
   */
  async addAddress(params: Address): Promise<NetworkResponse<Id>> {
    const resp: AxiosResponse<NetworkResponse<Id>> =
      await NetworkClient.http.post("user/address/add", params);
    return resp.data;
  }

  /**
   * 获取地址详情
   * @param {number} id - 地址 ID
   * @returns {Promise<NetworkResponse<Address>>} 地址详情
   */
  async getAddressInfo(id: number): Promise<NetworkResponse<Address>> {
    const resp: AxiosResponse<NetworkResponse<Address>> =
      await NetworkClient.http.get("user/address/info", { params: { id } });
    return resp.data;
  }

  /**
   * 获取默认地址
   * @returns {Promise<NetworkResponse<Address | null>>} 默认地址
   */
  async getDefaultAddress(): Promise<NetworkResponse<Address | null>> {
    const resp: AxiosResponse<NetworkResponse<Address | null>> =
      await NetworkClient.http.get("user/address/default");
    return resp.data;
  }
}
