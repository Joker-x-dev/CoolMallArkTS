import { AppNavDestination } from "ui";
import SmsLoginViewModel from "../viewmodel/SmsLoginViewModel";

/**
 * @file 短信登录页面视图
 * @author Joker.X
 */
@ComponentV2
export struct SmsLoginPage {
  /**
   * 短信登录页面 ViewModel
   */
  @Local
  private vm: SmsLoginViewModel = new SmsLoginViewModel();

  /**
   * 构建短信登录页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "短信登录",
      viewModel: this.vm
    }) {
      this.SmsLoginContent();
    }
  }

  /**
   * 短信登录页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private SmsLoginContent() {
    Text("短信登录页面内容视图")
  }
}
