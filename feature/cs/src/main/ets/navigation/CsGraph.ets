import { RouteGraph, RouteBuild, CsRoutes } from "navigation";
import { ChatNav } from "./ChatNav";

/**
 * @file 客服模块导航图
 * @author Joker.X
 */
export class CsGraph implements RouteGraph {
  /**
   * 注册客服模块导航路由
   */
  register(): void {
    RouteBuild.register(CsRoutes.Chat, wrapBuilder(ChatNav));
  }
}
