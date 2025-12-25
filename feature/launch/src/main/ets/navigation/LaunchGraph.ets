import { RouteGraph, RouteBuild, LaunchRoutes } from "navigation";
import { SplashNav } from "./SplashNav";
import { GuideNav } from "./GuideNav";

/**
 * @file 启动模块导航图
 * @author Joker.X
 */
export class LaunchGraph implements RouteGraph {
  /**
   * 注册启动模块导航路由
   */
  register(): void {
    RouteBuild.register(LaunchRoutes.Splash, wrapBuilder(SplashNav));
    RouteBuild.register(LaunchRoutes.Guide, wrapBuilder(GuideNav));
  }
}
