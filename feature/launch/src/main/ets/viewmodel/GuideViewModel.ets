import { BaseViewModel } from "base";
import { GuidePageItem } from "../model/GuidePageItem";

/**
 * @file 引导页 ViewModel
 * @author Joker.X
 */
@ObservedV2
export default class GuideViewModel extends BaseViewModel {
  /**
   * 当前页索引
   */
  @Trace
  currentPageIndex: number = 0;
  /**
   * 引导页数据
   */
  readonly guidePages: GuidePageItem[] = [
    {
      image: $r("app.media.ic_home_screen"),
      title: $r("app.string.guide_page_1_title"),
      description: $r("app.string.guide_page_1_desc")
    },
    {
      image: $r("app.media.ic_dev_productivity"),
      title: $r("app.string.guide_page_2_title"),
      description: $r("app.string.guide_page_2_desc")
    },
    {
      image: $r("app.media.ic_add_to_cart"),
      title: $r("app.string.guide_page_3_title"),
      description: $r("app.string.guide_page_3_desc")
    },
    {
      image: $r("app.media.ic_book_writer"),
      title: $r("app.string.guide_page_4_title"),
      description: $r("app.string.guide_page_4_desc")
    }
  ];

  /**
   * 页码切换
   * @param {number} index - 当前页索引
   * @returns {void} 无返回值
   */
  onPageChange(index: number): void {
    this.currentPageIndex = index;
  }

  /**
   * 获取当前操作按钮文案
   * @returns {ResourceStr} 按钮文案
   */
  getActionText(): ResourceStr {
    return this.isLastPage() ? $r("app.string.guide_start_experience") : $r("app.string.guide_continue");
  }

  /**
   * 获取当前操作按钮宽度
   * @returns {number} 按钮宽度
   */
  getActionButtonWidth(): number {
    return this.isLastPage() ? 160 : 120;
  }

  /**
   * 处理继续/开始体验按钮点击
   * @returns {void} 无返回值
   */
  onActionClick(): void {
    if (this.isLastPage()) {
      this.onStartExperienceClick();
      return;
    }
    this.currentPageIndex = Math.min(this.currentPageIndex + 1, this.guidePages.length - 1);
  }

  /**
   * 是否为最后一页
   * @returns {boolean} 是否最后一页
   */
  isLastPage(): boolean {
    return this.currentPageIndex >= this.guidePages.length - 1;
  }

  /**
   * 点击跳过
   * @returns {void} 无返回值
   */
  onSkipClick(): void {
  }

  /**
   * 点击开始体验
   * @returns {void} 无返回值
   */
  onStartExperienceClick(): void {
  }
}
