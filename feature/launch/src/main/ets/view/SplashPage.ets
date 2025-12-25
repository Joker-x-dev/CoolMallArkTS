import { AppNavDestination } from "ui";
import SplashViewModel from "../viewmodel/SplashViewModel";

/**
 * @file 启动页视图
 * @author Joker.X
 */
@ComponentV2
export struct SplashPage {
  /**
   * 启动页 ViewModel
   */
  @Local
  private vm: SplashViewModel = new SplashViewModel();

  /**
   * 构建启动页
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "启动页",
      viewModel: this.vm
    }) {
      this.SplashContent();
    }
  }

  /**
   * 启动页内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private SplashContent() {
    Text("启动页内容视图")
  }
}
