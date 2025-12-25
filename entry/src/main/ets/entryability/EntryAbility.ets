import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { IBestInit, IBestSetUIBaseStyle } from 'ui';
import { MainGraph } from 'main';
import { AuthGraph } from 'auth';
import { CommonGraph } from 'common';
import { CsGraph } from 'cs';
import { FeedbackGraph } from 'feedback';
import { GoodsGraph } from 'goods';
import { LaunchGraph } from 'launch';
import { UserGraph } from 'user';
import { OrderGraph } from 'order';
import { MarketGraph } from 'market';
import { IBestORMInit } from 'database';
import { ContextUtil, PermissionUtils } from 'util';

const DOMAIN = 0x0000;

/**
 * 入口Ability
 * 负责初始化应用、设置路由、处理生命周期事件
 * @author Joker.X
 */
export default class EntryAbility extends UIAbility {
  /**
   * 应用创建时调用
   * 初始化应用上下文、设置颜色模式、注册路由
   * @param {Want} want - 启动意图
   * @param {AbilityConstant.LaunchParam} launchParam - 启动参数
   * @returns {void} 无返回值
   */
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
      this.registerRouter();
      ContextUtil.init(this.context)
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  /**
   * 窗口创建时调用
   * 加载入口页面、初始化UI基础样式
   * @param {window.WindowStage} windowStage - 窗口阶段
   * @returns {Promise<void>} 无返回值的Promise
   */
  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    await this.initIBestORM();
    windowStage.loadContent('view/EntryPage', (_) => {
      this.initIBestUI(windowStage);
      const permissionCli = new PermissionUtils();
      permissionCli.requestAudioPermission((granted: boolean) => {
        hilog.info(DOMAIN, 'testTag', 'requestAudioPermission: %{public}d', granted);
      })
    });
  }

  /**
   * 应用销毁时调用
   * 释放应用上下文、注销路由
   * @returns {void} 无返回值
   */
  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  /**
   * 窗口销毁时调用
   * 释放窗口资源
   * @returns {void} 无返回值
   */
  onWindowStageDestroy(): void {
  }

  /**
   * 应用进入前台时调用
   * 刷新应用状态、重新注册路由
   * @returns {void} 无返回值
   */
  onForeground(): void {
  }

  /**
   * 应用进入后台时调用
   * 暂停应用状态、注销路由
   * @returns {void} 无返回值
   */
  onBackground(): void {
  }

  /**
   * 初始化 IBest UI 组件库
   * @param {window.WindowStage} windowStage - 窗口阶段
   */
  initIBestUI(windowStage: window.WindowStage): void {
    IBestInit(windowStage, this.context);
    this.setIBestUIBaseStyle();
  }

  /**
   * 设置 IBest UI 组件库基础样式
   */
  setIBestUIBaseStyle(): void {
    IBestSetUIBaseStyle({
      primary: $r('app.color.primary'),
      success: $r('app.color.success'),
      warning: $r('app.color.warning'),
      danger: $r('app.color.danger'),
    });
  }

  /**
   * 初始化 IBest ORM 数据库
   */
  async initIBestORM(): Promise<void> {
    await IBestORMInit(this.context, { name: "app.db" });
  }

  /**
   * 注册路由
   */
  registerRouter(): void {
    new MainGraph().register();
    new AuthGraph().register();
    new CommonGraph().register();
    new CsGraph().register();
    new FeedbackGraph().register();
    new GoodsGraph().register();
    new LaunchGraph().register();
    new UserGraph().register();
    new OrderGraph().register();
    new MarketGraph().register();
  }
}
