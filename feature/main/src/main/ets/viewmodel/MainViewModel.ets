import { LottieController } from "@ohos/lottie-turbo";
import { BaseViewModel } from "base";

/**
 * @file 主页面 ViewModel
 * @author Joker.X
 */
export interface IMainTabItem {
  /**
   * 文本标题
   */
  title: string;

  /**
   * 动画资源
   */
  animation: Resource;
}

/**
 * @file 主页面 ViewModel
 * @author Joker.X
 */
@ObservedV2
export default class MainViewModel extends BaseViewModel {
  /**
   * 当前选中的页面索引
   */
  @Trace
  currentPageIndex: number = 0;
  /**
   * 底部 Tab 配置
   */
  readonly tabItems: Array<IMainTabItem> = [
    { title: "首页", animation: $rawfile("home.json") },
    { title: "分类", animation: $rawfile("category.json") },
    { title: "购物车", animation: $rawfile("cart.json") },
    { title: "我的", animation: $rawfile("me.json") }
  ];
  /**
   * 每个 Tab 对应的 Lottie 控制器
   */
  readonly lottieControllers: Array<LottieController> = this.createLottieControllers();

  /**
   * 更新当前页面索引
   * @param {number} index - 目标页面索引
   * @returns {void} 无返回值
   * @example
  * this.updateCurrentPage(1);
   */
  updateCurrentPage(index: number): void {
    this.currentPageIndex = index;
  }

  /**
   * 切换 Tab 时更新索引并处理动画
   * @param {number} index - 选中的索引
   * @returns {void} 无返回值
   */
  handleTabChanged(index: number): void {
    this.updateCurrentPage(index);
    this.playSelectedAnimation(index);
  }

  /**
   * Tab 出现时根据选中状态播放或重置动画
   * @param {number} index - 当前渲染的 Tab 索引
   * @returns {void} 无返回值
   */
  handleTabAppear(index: number): void {
    if (this.currentPageIndex === index) {
      this.lottieControllers[index].stop();
      this.lottieControllers[index].play();
      return;
    }
    this.lottieControllers[index].goToAndStop(0, true);
  }

  /**
   * 同步当前选中项的动画播放，用于首次进入或生命周期回调
   * @returns {void} 无返回值
   */
  syncCurrentAnimation(): void {
    this.playSelectedAnimation(this.currentPageIndex);
  }

  /**
   * 页面出现时触发动画同步
   * @returns {void} 无返回值
   */
  aboutToAppear(): void {
    super.aboutToAppear();
    this.syncCurrentAnimation();
  }

  /**
   * 组件构建完成时触发动画同步
   * @returns {void} 无返回值
   */
  onDidBuild(): void {
    super.onDidBuild();
    this.syncCurrentAnimation();
  }

  /**
   * 创建 Lottie 控制器列表
   * @returns {Array<LottieController>} 控制器列表
   */
  private createLottieControllers(): Array<LottieController> {
    return this.tabItems.map(() => new LottieController());
  }

  /**
   * 播放选中 Tab 的动画并重置其他动画帧
   * @param {number} index - 选中的 Tab 索引
   * @returns {void} 无返回值
   */
  private playSelectedAnimation(index: number): void {
    this.lottieControllers.forEach((controller: LottieController, controllerIndex: number) => {
      if (controllerIndex === index) {
        controller.stop();
        controller.play();
        return;
      }
      controller.stop();
      controller.goToAndStop(0, true);
    });
  }
}
