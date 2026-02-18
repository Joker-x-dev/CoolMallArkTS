import { ColumnCenter, P100, SpaceVerticalMedium, SpaceVerticalXXLarge } from "designsystem";
import { WindowSafeAreaState, getWindowSafeAreaState } from "state";
import { AppNavDestination, LogoIcon } from "ui";
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
      viewModel: this.vm,
      hideTitleBar: true,
      pageBackgroundColor: $r("app.color.bg_white")
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
    ColumnCenter({ fillMaxSize: true }) {
      Blank().layoutWeight(1);

      LogoIcon({ iconSize: 120 });

      Blank().layoutWeight(1);

      Text($r("app.string.app_name_splash"))
        .fontSize($r("app.float.headline_large"))
        .fontWeight(FontWeight.Medium)
        .fontColor($r("app.color.text_primary"));

      SpaceVerticalMedium();

      Text($r("app.string.app_copyright"))
        .fontSize($r("app.float.body_medium"))
        .fontColor($r("app.color.text_tertiary"));
    }
  }
}
