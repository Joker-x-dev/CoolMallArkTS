/**
 * @file 用户贡献者实体类
 * @author Joker.X
 */
export class UserContributor {
  /**
   * ID
   */
  id: number = 0;
  /**
   * 头像
   */
  avatarUrl: string = "";
  /**
   * 昵称
   */
  nickName: string = "";
  /**
   * 网站地址(GitHub/Gitee/个人博客)
   */
  websiteUrl?: string | null = null;
  /**
   * 个性签名/个人描述
   */
  signature?: string | null = null;
  /**
   * 个人标签
   */
  tags?: string[] | null = null;
  /**
   * 排序
   */
  sortNum: number = 0;
  /**
   * 状态 1:启用 2:禁用
   */
  status: number = 1;
  /**
   * 创建时间
   */
  createTime?: string | null = null;
  /**
   * 更新时间
   */
  updateTime?: string | null = null;

  constructor(init?: Partial<UserContributor>) {
    if (!init) {
      return;
    }
    this.id = init.id ?? this.id;
    this.avatarUrl = init.avatarUrl ?? this.avatarUrl;
    this.nickName = init.nickName ?? this.nickName;
    this.websiteUrl = init.websiteUrl ?? this.websiteUrl;
    this.signature = init.signature ?? this.signature;
    this.tags = init.tags ?? this.tags;
    this.sortNum = init.sortNum ?? this.sortNum;
    this.status = init.status ?? this.status;
    this.createTime = init.createTime ?? this.createTime;
    this.updateTime = init.updateTime ?? this.updateTime;
  }
}
