import { LottieView } from "@ohos/lottie-turbo";
import { AppNavDestination } from "ui";
import MainViewModel, { IMainTabItem } from "../viewmodel/MainViewModel";
import { HomePage } from "./HomePage";
import { CategoryPage } from "./CategoryPage";
import { CartPage } from "./CartPage";
import { MePage } from "./MePage";
import { P100 } from "designsystem";

/**
 * @file 主页面视图
 * @author Joker.X
 */
@ComponentV2
export struct MainPage {
  /**
   * 主页面 ViewModel
   */
  @Local
  private vm: MainViewModel = new MainViewModel();

  /**
   * 构建主页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      hideTitleBar: true,
      viewModel: this.vm
    }) {
      this.MainContent();
    }
  }

  /**
   * 主页面内容视图，包含可左右滑动的页面与底部 Lottie 导航
   * @returns {void} 无返回值
   */
  @Builder
  private MainContent() {
    Tabs({
      index: this.vm.currentPageIndex,
      barPosition: BarPosition.End
    }) {
      TabContent() {
        this.renderTabContent(0);
      }
      .tabBar(this.renderTabBar(this.vm.tabItems[0], 0));

      TabContent() {
        this.renderTabContent(1);
      }
      .tabBar(this.renderTabBar(this.vm.tabItems[1], 1));

      TabContent() {
        this.renderTabContent(2);
      }
      .tabBar(this.renderTabBar(this.vm.tabItems[2], 2));

      TabContent() {
        this.renderTabContent(3);
      }
      .tabBar(this.renderTabBar(this.vm.tabItems[3], 3));
    }
    .barMode(BarMode.Fixed)
    .scrollable(true)
    .width(P100)
    .height(P100)
    .onChange((index: number) => {
      this.vm.handleTabChanged(index);
    });
  }

  /**
   * 渲染 Tabs 的底部导航项
   * @param {IMainTabItem} item - Tab 配置
   * @param {number} index - 索引
   * @returns {void} 无返回值
   */
  @Builder
  private renderTabBar(item: IMainTabItem, index: number) {
    Column() {
      LottieView({
        lottieId: `main_tab_${index}`,
        loop: false,
        autoplay: this.vm.currentPageIndex === index,
        controller: this.vm.lottieControllers[index],
        path: item.animation
      })
        .width(32)
        .height(32)
        .onAppear(() => {
          this.vm.handleTabAppear(index);
        });

      Text(item.title)
        .fontSize(12)
        .fontColor(this.vm.currentPageIndex === index ? Color.Black : Color.Gray)
        .margin({ top: 4 });
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .padding({ top: 6, bottom: 8 })
    .layoutWeight(1);
  }

  /**
   * 渲染当前页面内容
   * @param {number} index - 页面索引
   * @returns {void} 无返回值
   */
  @Builder
  private renderTabContent(index: number) {
    Column() {
      if (index === 0) {
        HomePage();
      } else if (index === 1) {
        CategoryPage();
      } else if (index === 2) {
        CartPage();
      } else {
        MePage();
      }
    }
    .width(P100)
    .height(P100)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center);
  }
}
