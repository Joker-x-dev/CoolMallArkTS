import {
  ColumnBase,
  ColumnCenter,
  P100,
  RowEndCenter,
  SpaceVerticalLarge
} from "designsystem";
import { IBestButton } from "ibestui";
import { AppNavDestination, CommonIcon } from "ui";
import { GuidePageItem } from "../model/GuidePageItem";
import GuideViewModel from "../viewmodel/GuideViewModel";

/**
 * @file 引导页视图
 * @author Joker.X
 */

@ComponentV2
export struct GuidePage {
  /**
   * 引导页 ViewModel
   */
  @Local
  private vm: GuideViewModel = new GuideViewModel();

  /**
   * 构建引导页
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      viewModel: this.vm,
      hideTitleBar: true,
      pageBackgroundColor: $r("app.color.bg_white")
    }) {
      this.GuideContent();
    }
  }

  /**
   * 引导页内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private GuideContent(): void {
    ColumnBase({ fillMaxSize: true }) {
      this.HeaderSection();

      Swiper() {
        ForEach(this.vm.guidePages, (item: GuidePageItem, index: number): void => {
          this.GuideItem(item);
        }, (item: GuidePageItem, index: number): string => index.toString());
      }
      .index(this.vm.currentPageIndex)
      .indicator(Indicator.dot()
        .color($r("app.color.bg_purple_light"))
        .selectedColor($r("app.color.primary")))
      .loop(false)
      .autoPlay(false)
      .onChange((index: number): void => {
        this.vm.onPageChange(index);
      })
      .layoutWeight(1);

      this.BottomSection();
    }
  }

  /**
   * 顶部区域
   * @returns {void} 无返回值
   */
  @Builder
  private HeaderSection(): void {
    RowEndCenter({
      widthValue: P100,
      paddingValue: {
        left: $r("app.float.space_horizontal_large"),
        right: $r("app.float.space_horizontal_large"),
        top: $r("app.float.space_vertical_large"),
        bottom: $r("app.float.space_vertical_large")
      }
    }) {
      Text($r("app.string.guide_skip"))
        .fontSize($r("app.float.body_medium"))
        .fontColor($r("app.color.text_tertiary"))
        .onClick((): void => {
          void this.vm.onSkipClick();
        });
    }
  }

  /**
   * 单页引导内容
   * @param {GuidePageItem} item - 单页数据
   * @returns {void} 无返回值
   */
  @Builder
  private GuideItem(item: GuidePageItem): void {
    ColumnCenter({
      fillMaxSize: true,
      paddingValue: {
        left: $r("app.float.space_horizontal_large_x"),
        right: $r("app.float.space_horizontal_large_x")
      }
    }) {
      Blank().layoutWeight(1);

      CommonIcon({
        icon: item.image,
        iconSize: 220
      });

      SpaceVerticalLarge();

      Text(item.title)
        .fontSize($r("app.float.display_medium"))
        .fontWeight(FontWeight.Bold)
        .fontColor($r("app.color.text_primary"))
        .textAlign(TextAlign.Center);

      SpaceVerticalLarge();

      Text(item.description)
        .fontSize($r("app.float.body_large"))
        .fontColor($r("app.color.text_secondary"))
        .textAlign(TextAlign.Center)
        .lineHeight(24);

      Blank().layoutWeight(1);
    }
  }

  /**
   * 底部区域
   * @returns {void} 无返回值
   */
  @Builder
  private BottomSection(): void {
    ColumnCenter({
      widthValue: P100,
      paddingValue: {
        left: $r("app.float.space_horizontal_large"),
        right: $r("app.float.space_horizontal_large"),
        top: $r("app.float.space_vertical_large"),
        bottom: $r("app.float.space_vertical_large_xx")
      }
    }) {
      SpaceVerticalLarge();
      IBestButton({
        text: this.vm.getActionText(),
        type: "primary",
        round: true,
        btnWidth: this.vm.getActionButtonWidth(),
        onBtnClick: (): void => {
          void this.vm.onActionClick();
        }
      });
    }
  }
}
