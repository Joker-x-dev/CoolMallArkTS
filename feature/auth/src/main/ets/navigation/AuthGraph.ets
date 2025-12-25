import { RouteGraph, RouteBuild, AuthRoutes } from "navigation";
import { LoginNav } from "./LoginNav";
import { AccountLoginNav } from "./AccountLoginNav";
import { SmsLoginNav } from "./SmsLoginNav";
import { RegisterNav } from "./RegisterNav";
import { ResetPasswordNav } from "./ResetPasswordNav";

/**
 * @file 认证模块导航图
 * @author Joker.X
 */
export class AuthGraph implements RouteGraph {
  /**
   * 注册认证模块导航路由
   */
  register(): void {
    RouteBuild.register(AuthRoutes.Login, wrapBuilder(LoginNav));
    RouteBuild.register(AuthRoutes.AccountLogin, wrapBuilder(AccountLoginNav));
    RouteBuild.register(AuthRoutes.SmsLogin, wrapBuilder(SmsLoginNav));
    RouteBuild.register(AuthRoutes.Register, wrapBuilder(RegisterNav));
    RouteBuild.register(AuthRoutes.ResetPassword, wrapBuilder(ResetPasswordNav));
  }
}
