import { RouteGraph, RouteBuild, UserRoutes } from "navigation";
import { ProfileNav } from "./ProfileNav";
import { AddressListNav } from "./AddressListNav";
import { AddressDetailNav } from "./AddressDetailNav";
import { FootprintNav } from "./FootprintNav";

/**
 * @file 用户模块导航图
 * @author Joker.X
 */
export class UserGraph implements RouteGraph {
  /**
   * 注册用户模块导航路由
   */
  register(): void {
    RouteBuild.register(UserRoutes.Profile, wrapBuilder(ProfileNav));
    RouteBuild.register(UserRoutes.AddressList, wrapBuilder(AddressListNav));
    RouteBuild.register(UserRoutes.AddressDetail, wrapBuilder(AddressDetailNav));
    RouteBuild.register(UserRoutes.Footprint, wrapBuilder(FootprintNav));
  }
}
