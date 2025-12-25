/**
 * @file OSS上传响应模型（适配腾讯云）
 * @author Joker.X
 */
export class OssUpload {
  /**
   * 腾讯云凭证信息
   */
  credentials?: TencentCredentials | null = null;
  /**
   * 请求ID
   */
  requestId?: string | null = null;
  /**
   * 过期时间
   */
  expiration?: string | null = null;
  /**
   * 开始时间戳
   */
  startTime?: number | null = null;
  /**
   * 过期时间戳
   */
  expiredTime?: number | null = null;
  /**
   * 上传URL
   */
  url?: string | null = null;

  constructor(init?: Partial<OssUpload>) {
    if (!init) {
      return;
    }
    this.credentials = init.credentials ? new TencentCredentials(init.credentials) : this.credentials;
    this.requestId = init.requestId ?? this.requestId;
    this.expiration = init.expiration ?? this.expiration;
    this.startTime = init.startTime ?? this.startTime;
    this.expiredTime = init.expiredTime ?? this.expiredTime;
    this.url = init.url ?? this.url;
  }
}

/**
 * 腾讯云上传凭证模型
 */
export class TencentCredentials {
  /**
   * 临时密钥ID
   */
  tmpSecretId?: string | null = null;
  /**
   * 临时密钥Key
   */
  tmpSecretKey?: string | null = null;
  /**
   * 会话令牌
   */
  sessionToken?: string | null = null;

  constructor(init?: Partial<TencentCredentials>) {
    if (!init) {
      return;
    }
    this.tmpSecretId = init.tmpSecretId ?? this.tmpSecretId;
    this.tmpSecretKey = init.tmpSecretKey ?? this.tmpSecretKey;
    this.sessionToken = init.sessionToken ?? this.sessionToken;
  }
}
