import { AppNavDestination, BaseNetWorkListView, RefreshLayout } from "ui";
import { HomeBanner } from "../component/HomeBanner";
import HomeViewModel from "../viewmodel/HomeViewModel";

/**
 * @file 首页视图
 * @author Joker.X
 */
@ComponentV2
export struct HomePage {
  /**
   * 首页 ViewModel
   */
  @Local
  private vm: HomeViewModel = new HomeViewModel();

  /**
   * 构建首页
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      viewModel: this.vm
    }) {
      BaseNetWorkListView({
        uiState: this.vm.uiState,
        onRetry: (): void => this.vm.loadHomeData(),
        content: (): void => this.HomeContent()
      });
    }
  }

  /**
   * 首页内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private HomeContent() {
    RefreshLayout({
      loading: this.vm.isLoading,
      isEnableSlideUp: this.vm.isEnableSlideUp,
      onRefresh: (direction): void => this.vm.onRefreshDirection(direction),
    }) {
      List() {
        if ((this.vm.pageData.banner ?? []).length > 0) {
          ListItem() {
            HomeBanner({
              bannerList: this.vm.pageData.banner ?? [],
            });
          }
        }
      };
    }
  }
}
