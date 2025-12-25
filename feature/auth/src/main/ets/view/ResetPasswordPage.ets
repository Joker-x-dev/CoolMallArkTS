import { AppNavDestination } from "ui";
import ResetPasswordViewModel from "../viewmodel/ResetPasswordViewModel";

/**
 * @file 重置密码页面视图
 * @author Joker.X
 */
@ComponentV2
export struct ResetPasswordPage {
  /**
   * 重置密码页面 ViewModel
   */
  @Local
  private vm: ResetPasswordViewModel = new ResetPasswordViewModel();

  /**
   * 构建重置密码页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "重置密码",
      viewModel: this.vm
    }) {
      this.ResetPasswordContent();
    }
  }

  /**
   * 重置密码页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private ResetPasswordContent() {
    Text("重置密码页面内容视图")
  }
}
