import { P100 } from "designsystem";
import { Banner } from "model";
import { bp, BreakpointState, getBreakpointState } from "state";

/**
 * @file 首页轮播图组件
 * @author Joker.X
 */
@ComponentV2
export struct HomeBanner {
  /**
   * 轮播图数据
   */
  @Param
  bannerList: Banner[] = [];
  /**
   * 轮播图点击回调
   */
  @Param
  onBannerClick: (item: Banner) => void = () => {
  };
  /**
   * 屏幕断点状态
   */
  @Local
  private breakpointState: BreakpointState = getBreakpointState();

  /**
   * 构建轮播图视图
   * @returns {void} 无返回值
   */
  build(): void {
    Column() {
      if (this.bannerList && this.bannerList.length > 0) {
        Swiper() {
          ForEach(this.bannerList, (item: Banner) => {
            Image(item.pic)
              .width(P100)
              .borderRadius($r("app.float.radius_medium"))
              .objectFit(ImageFit.Contain)
              .margin({
                right: bp({
                  sm: $r("app.float.space_padding_small"),
                  md: $r("app.float.space_padding_medium"),
                  lg: $r("app.float.space_padding_large")
                })
              })
              .onClick((): void => this.onBannerClick(item));
          }, (item: Banner) => `${item.id}-${item.pic}`);
        }
        .displayCount(bp({ sm: 1, md: 2, lg: 2 }))
        .displayMode(SwiperDisplayMode.STRETCH)
        .indicator(this.getIndicator())
        .nextMargin(bp({ sm: 0, md: 12, lg: 260 }))
        .autoPlay(true)
        .loop(true);
      }
    }
  }

  /**
   * 获取轮播图指示器
   * @returns {DotIndicator | boolean} 指示器配置
   */
  private getIndicator(): DotIndicator | boolean {
    if (this.breakpointState.isXS() || this.breakpointState.isSM()) {
      return Indicator.dot()
        .bottom($r("app.float.space_vertical_medium"))
        .color($r("app.color.bg_purple_light"))
        .selectedColor($r("app.color.primary"));
    }

    return false;
  }
}
