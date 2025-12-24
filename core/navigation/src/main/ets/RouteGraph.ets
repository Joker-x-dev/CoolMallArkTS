/**
 * 路由图接口
 * 每个模块实现该接口来注册自己的路由
 * @author Joker.X
 */
export interface RouteGraph {
  /**
   * 注册路由
   */
  register(): void;
}
