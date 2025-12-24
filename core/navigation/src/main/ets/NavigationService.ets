import { hilog } from "@kit.PerformanceAnalysisKit";
import { getUserState } from "state";
import { Any } from "model";
import { requiresLogin, getLoginRoute } from "./RouteInterceptor";

/**
 * @file 全局导航服务：集中存放 NavPathStack，提供统一跳转 API，方便 ViewModel 直接调用
 * @author Joker.X
 */

/**
 * Provider / Consumer 共享的键名
 */
export const NAV_PATH_STACK_KEY: string = "navStack";

/**
 * 全局导航栈实例
 */
let globalNavStack: NavPathStack | undefined;

const DOMAIN: number = 0;

/**
 * 路由参数类型定义（避免使用 any/unknown）
 */
export type NavParams = Record<string, string | number | boolean | object | null | undefined>;

/**
 * 设置全局导航栈实例（在 NavigationHost aboutToAppear 中调用）
 * @param {NavPathStack} stack - 导航栈实例
 * @returns {void} 无返回值
 */
export function setNavPathStack(stack: NavPathStack): void {
  globalNavStack = stack;
}

/**
 * 获取当前导航栈实例
 * @returns {NavPathStack | undefined} 导航栈实例；未初始化时返回 undefined
 */
export function getNavPathStack(): NavPathStack | undefined {
  if (!globalNavStack) {
    const msg: string = "[NavigationService] nav stack is not initialized, call setNavPathStack first.";
    hilog.error(DOMAIN, "NavSvc", msg);
    return undefined;
  }
  return globalNavStack;
}

/**
 * 路由跳转（入栈）
 * @param {string} name - 路由名称
 * @param {NavParams} [params={}] - 跳转参数
 * @returns {void} 无返回值
 */
export function navigateTo(name: string, params: NavParams = {}): void {
  if (requiresLogin(name)) {
    const userState = getUserState();
    if (!userState.isLoggedIn()) {
      hilog.info(DOMAIN, "NavSvc", `[NavigationService] Intercepting route to ${name}, redirecting to Login`);
      name = getLoginRoute();
    }
  }

  const stack: NavPathStack | undefined = getNavPathStack();
  if (!stack) {
    return;
  }
  try {
    stack.pushPath({
      name: name,
      param: params
    });
  } catch (err) {
    hilog.error(DOMAIN, "NavSvc", "[NavigationService] navigateTo failed: %{public}s", JSON.stringify(err));
  }
}

/**
 * 返回上一页
 * @returns {void} 无返回值
 */
export function navigateBack(): void {
  const stack: NavPathStack | undefined = getNavPathStack();
  if (!stack) {
    return;
  }
  try {
    stack.pop();
  } catch (err) {
    hilog.error(DOMAIN, "NavSvc", "[NavigationService] navigateBack failed: %{public}s", JSON.stringify(err));
  }
}

/**
 * 携带结果返回上一页（触发上一跳中的 onPop 回调）
 * @param {Any} [result={}] - 返回结果
 * @param {boolean} [animated=true] - 是否需要动画
 * @returns {void} 无返回值
 */
export function navigateBackWithResult(result: NavParams | object = {}, animated?: boolean): void {
  const stack: NavPathStack | undefined = getNavPathStack();
  if (!stack) {
    return;
  }
  try {
    stack.pop(result, animated);
  } catch (err) {
    hilog.error(DOMAIN, "NavSvc", "[NavigationService] navigateBackWithResult failed: %{public}s", JSON.stringify(err));
  }
}

/**
 * 返回到指定路由
 * @param {string} name - 目标路由名称
 * @param {boolean} inclusive - 是否移除目标自身（默认 false）
 * @returns {void} 无返回值
 */
export function popTo(name: string, inclusive: boolean = false): void {
  const stack: NavPathStack | undefined = getNavPathStack();
  if (!stack) {
    return;
  }
  try {
    stack.popToName(name, inclusive);
  } catch (err) {
    hilog.error(DOMAIN, "NavSvc", "[NavigationService] popTo failed: %{public}s", JSON.stringify(err));
  }
}

/**
 * 跳转并监听返回结果（使用 ArkUI promise 版本 pushDestinationByName）
 * @param {string} name - 路由名称
 * @param {Any} [params={}] - 跳转参数
 * @param {(info: PopInfo) => void} [onPop] - 返回结果回调（在目标页调用 pop(result) 时触发）
 * @returns {Promise<void>} 跳转完成 Promise
 */
export function navigateToWithResult(name: string, params: NavParams = {},
  onPop?: (info: PopInfo) => void): Promise<void> {
  if (requiresLogin(name)) {
    const userState = getUserState();
    if (!userState.isLoggedIn()) {
      hilog.info(DOMAIN, "NavSvc", `[NavigationService] Intercepting route to ${name}, redirecting to Login`);
      name = getLoginRoute();
    }
  }

  const stack: NavPathStack | undefined = getNavPathStack();
  if (!stack) {
    return Promise.resolve();
  }

  const safeParam: Object = params as Object;
  try {
    if (onPop) {
      return stack.pushDestinationByName(name, safeParam, onPop).catch((err: Any) => {
        hilog.error(DOMAIN, "NavSvc", "[NavigationService] navigateToWithResult failed: %{public}s",
          JSON.stringify(err));
      });
    }
    return stack.pushDestinationByName(name, safeParam).catch((err: Any) => {
      hilog.error(DOMAIN, "NavSvc", "[NavigationService] navigateToWithResult failed: %{public}s", JSON.stringify(err));
    });
  } catch (err) {
    hilog.error(DOMAIN, "NavSvc", "[NavigationService] navigateToWithResult failed: %{public}s", JSON.stringify(err));
    return Promise.resolve();
  }
}

/**
 * 跳转并以 Promise 形式获取返回结果（上层可 await）
 * @template T
 * @param {string} name - 路由名称
 * @param {Any} [params={}] - 跳转参数
 * @returns {Promise<T | undefined>} 返回结果（未回传时为 undefined）
 */
export function navigateToForResult<T>(name: string, params: NavParams = {}): Promise<T | undefined> {
  return new Promise<T | undefined>((resolve) => {
    navigateToWithResult(name, params, (info: PopInfo) => {
      resolve(info?.result as T);
    });
  });
}

/**
 * 获取指定路由的首个参数（类型安全，屏蔽 unknown）
 * @template T
 * @param {string} name - 路由名称
 * @returns {T} 参数对象；未获取到时返回 undefined
 */
export function getRouteParams<T>(name: string): T {
  const stack: NavPathStack | undefined = getNavPathStack();
  if (!stack) {
    return undefined as T;
  }
  try {
    return stack.getParamByName(name)[0] as T;
  } catch (err) {
    hilog.error(DOMAIN, "NavSvc", "[NavigationService] getRouteParams failed: %{public}s", JSON.stringify(err));
    return undefined as T;
  }
}
