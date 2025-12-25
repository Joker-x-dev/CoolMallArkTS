import { AppNavDestination } from "ui";
import RegisterViewModel from "../viewmodel/RegisterViewModel";

/**
 * @file 注册页面视图
 * @author Joker.X
 */
@ComponentV2
export struct RegisterPage {
  /**
   * 注册页面 ViewModel
   */
  @Local
  private vm: RegisterViewModel = new RegisterViewModel();

  /**
   * 构建注册页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "注册",
      viewModel: this.vm
    }) {
      this.RegisterContent();
    }
  }

  /**
   * 注册页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private RegisterContent() {
    Text("注册页面内容视图")
  }
}
