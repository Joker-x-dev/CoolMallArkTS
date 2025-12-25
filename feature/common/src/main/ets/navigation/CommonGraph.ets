import { RouteGraph, RouteBuild, CommonRoutes } from "navigation";
import { AboutNav } from "./AboutNav";
import { WebNav } from "./WebNav";
import { SettingsNav } from "./SettingsNav";
import { UserAgreementNav } from "./UserAgreementNav";
import { PrivacyPolicyNav } from "./PrivacyPolicyNav";
import { ContributorsNav } from "./ContributorsNav";

/**
 * @file 公共模块导航图
 * @author Joker.X
 */
export class CommonGraph implements RouteGraph {
  /**
   * 注册公共模块导航路由
   */
  register(): void {
    RouteBuild.register(CommonRoutes.About, wrapBuilder(AboutNav));
    RouteBuild.register(CommonRoutes.Web, wrapBuilder(WebNav));
    RouteBuild.register(CommonRoutes.Settings, wrapBuilder(SettingsNav));
    RouteBuild.register(CommonRoutes.UserAgreement, wrapBuilder(UserAgreementNav));
    RouteBuild.register(CommonRoutes.PrivacyPolicy, wrapBuilder(PrivacyPolicyNav));
    RouteBuild.register(CommonRoutes.Contributors, wrapBuilder(ContributorsNav));
  }
}
