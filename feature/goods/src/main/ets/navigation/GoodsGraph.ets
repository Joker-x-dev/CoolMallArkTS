import { RouteGraph, RouteBuild, GoodsRoutes } from "navigation";
import { GoodsDetailNav } from "./GoodsDetailNav";
import { GoodsSearchNav } from "./GoodsSearchNav";
import { GoodsCommentNav } from "./GoodsCommentNav";
import { GoodsCategoryNav } from "./GoodsCategoryNav";

/**
 * @file 商品模块导航图
 * @author Joker.X
 */
export class GoodsGraph implements RouteGraph {
  /**
   * 注册商品模块导航路由
   */
  register(): void {
    RouteBuild.register(GoodsRoutes.Detail, wrapBuilder(GoodsDetailNav));
    RouteBuild.register(GoodsRoutes.Search, wrapBuilder(GoodsSearchNav));
    RouteBuild.register(GoodsRoutes.Comment, wrapBuilder(GoodsCommentNav));
    RouteBuild.register(GoodsRoutes.Category, wrapBuilder(GoodsCategoryNav));
  }
}
