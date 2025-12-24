/**
 * @file 路由构建器
 * @author Joker.X
 */
export class RouteBuild {
  private static builderMap: Map<string, WrappedBuilder<[]>> = new Map();

  /**
   * 注册路由
   * @param name 路由名称
   * @param builder 路由构建器
   */
  static register(name: string, builder: WrappedBuilder<[]>) {
    RouteBuild.builderMap.set(name, builder);
  }

  /**
   * 获取路由构建器
   * @param name 路由名称
   * @returns 路由构建器
   */
  static getBuilder(name: string): WrappedBuilder<[]> | undefined {
    return RouteBuild.builderMap.get(name);
  }
}
