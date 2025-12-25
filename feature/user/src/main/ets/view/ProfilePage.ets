import { AppNavDestination } from "ui";
import ProfileViewModel from "../viewmodel/ProfileViewModel";

/**
 * @file 个人中心页面视图
 * @author Joker.X
 */
@ComponentV2
export struct ProfilePage {
  /**
   * 个人中心页面 ViewModel
   */
  @Local
  private vm: ProfileViewModel = new ProfileViewModel();

  /**
   * 构建个人中心页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "个人中心",
      viewModel: this.vm
    }) {
      this.ProfileContent();
    }
  }

  /**
   * 个人中心页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private ProfileContent() {
    Text("个人中心页面内容视图")
  }
}
