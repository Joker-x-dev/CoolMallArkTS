import { AppNavDestination } from "ui";
import UserAgreementViewModel from "../viewmodel/UserAgreementViewModel";

/**
 * @file 用户协议页面视图
 * @author Joker.X
 */
@ComponentV2
export struct UserAgreementPage {
  /**
   * 用户协议页面 ViewModel
   */
  @Local
  private vm: UserAgreementViewModel = new UserAgreementViewModel();

  /**
   * 构建用户协议页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "用户协议",
      viewModel: this.vm
    }) {
      this.UserAgreementContent();
    }
  }

  /**
   * 用户协议页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private UserAgreementContent() {
    Text("用户协议页面内容视图")
  }
}
