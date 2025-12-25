import { AppNavDestination } from "ui";
import AccountLoginViewModel from "../viewmodel/AccountLoginViewModel";

/**
 * @file 账号登录页面视图
 * @author Joker.X
 */
@ComponentV2
export struct AccountLoginPage {
  /**
   * 账号登录页面 ViewModel
   */
  @Local
  private vm: AccountLoginViewModel = new AccountLoginViewModel();

  /**
   * 构建账号登录页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "账号登录",
      viewModel: this.vm
    }) {
      this.AccountLoginContent();
    }
  }

  /**
   * 账号登录页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private AccountLoginContent() {
    Text("账号登录页面内容视图")
  }
}
