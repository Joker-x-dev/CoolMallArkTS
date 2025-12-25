import { RouteGraph, RouteBuild, OrderRoutes } from "navigation";
import { OrderListNav } from "./OrderListNav";
import { OrderConfirmNav } from "./OrderConfirmNav";
import { OrderDetailNav } from "./OrderDetailNav";
import { OrderPayNav } from "./OrderPayNav";
import { OrderLogisticsNav } from "./OrderLogisticsNav";
import { OrderRefundNav } from "./OrderRefundNav";
import { OrderCommentNav } from "./OrderCommentNav";

/**
 * @file 订单模块导航图
 * @author Joker.X
 */
export class OrderGraph implements RouteGraph {
  /**
   * 注册订单模块导航路由
   */
  register(): void {
    RouteBuild.register(OrderRoutes.List, wrapBuilder(OrderListNav));
    RouteBuild.register(OrderRoutes.Confirm, wrapBuilder(OrderConfirmNav));
    RouteBuild.register(OrderRoutes.Detail, wrapBuilder(OrderDetailNav));
    RouteBuild.register(OrderRoutes.Pay, wrapBuilder(OrderPayNav));
    RouteBuild.register(OrderRoutes.Logistics, wrapBuilder(OrderLogisticsNav));
    RouteBuild.register(OrderRoutes.Refund, wrapBuilder(OrderRefundNav));
    RouteBuild.register(OrderRoutes.Comment, wrapBuilder(OrderCommentNav));
  }
}
