/**
 * @file 用户收货地址模型
 * @author Joker.X
 */
export class Address {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 用户ID
   */
  userId: number = 0;
  /**
   * 联系人
   */
  contact: string = "";
  /**
   * 手机号
   */
  phone: string = "";
  /**
   * 省
   */
  province: string = "";
  /**
   * 市
   */
  city: string = "";
  /**
   * 区
   */
  district: string = "";
  /**
   * 地址
   */
  address: string = "";
  /**
   * 是否默认
   */
  isDefault: boolean = false;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<Address>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.userId = init.userId ?? this.userId;
    this.contact = init.contact ?? this.contact;
    this.phone = init.phone ?? this.phone;
    this.province = init.province ?? this.province;
    this.city = init.city ?? this.city;
    this.district = init.district ?? this.district;
    this.address = init.address ?? this.address;
    this.isDefault = init.isDefault ?? this.isDefault;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
