import { AppNavDestination } from "ui";
import LoginViewModel from "../viewmodel/LoginViewModel";

/**
 * @file 登录页面视图
 * @author Joker.X
 */
@ComponentV2
export struct LoginPage {
  /**
   * 登录页面 ViewModel
   */
  @Local
  private vm: LoginViewModel = new LoginViewModel();

  /**
   * 构建登录页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "登录",
      viewModel: this.vm
    }) {
      this.LoginContent();
    }
  }

  /**
   * 登录页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private LoginContent() {
    Text("登录页面内容视图")
  }
}
