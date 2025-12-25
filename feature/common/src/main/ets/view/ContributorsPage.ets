import { AppNavDestination } from "ui";
import ContributorsViewModel from "../viewmodel/ContributorsViewModel";

/**
 * @file 贡献者页面视图
 * @author Joker.X
 */
@ComponentV2
export struct ContributorsPage {
  /**
   * 贡献者页面 ViewModel
   */
  @Local
  private vm: ContributorsViewModel = new ContributorsViewModel();

  /**
   * 构建贡献者页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "贡献者",
      viewModel: this.vm
    }) {
      this.ContributorsContent();
    }
  }

  /**
   * 贡献者页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private ContributorsContent() {
    Text("贡献者页面内容视图")
  }
}
