/**
 * @file 图片验证码模型
 * @author Joker.X
 */
export class Captcha {
  /**
   * base64 编码的图片验证码
   */
  data: string = "";
  /**
   * 验证码 ID
   */
  captchaId: string = "";

  constructor(init?: Partial<Captcha>) {
    if (!init) {
      return;
    }
    this.data = init.data ?? this.data;
    this.captchaId = init.captchaId ?? this.captchaId;
  }
}
