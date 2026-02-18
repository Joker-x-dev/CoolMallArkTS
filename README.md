<div align="center">

<img src="docs/images/graphs/logo.svg" width="120" alt="青商城Logo"/>

# 青商城 · HarmonyOS

_🛍️ 基于 ArkTS 与 ArkUI 的鸿蒙电商应用_

<!-- 语言切换按钮 -->
<div align="center">
  <a href="README_EN.md">🌍 English</a>
</div>

[![GitHub](https://img.shields.io/badge/GitHub-CoolMallArkTS-blue?style=flat-square&logo=github)](https://github.com/Joker-x-dev/CoolMallArkTS)
[![Gitee](https://img.shields.io/badge/Gitee-CoolMallArkTS-red?style=flat-square&logo=gitee)](https://gitee.com/Joker-x-dev/CoolMallArkTS)
[![API](https://img.shields.io/badge/API-文档-orange?style=flat-square&logo=postman)](https://coolmall.apifox.cn)
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/Joker-x-dev/CoolMallKotlin)

</div>

## 📖 项目简介

这是一个基于 ArkTS 和 ArkUI 打造的开源电商学习项目，旨在展示如何运用现代 HarmonyOS
开发技术构建一个完整的电商应用。项目涵盖用户认证、商品展示、购物车、订单支付等核心流程，适合开发者学习参考现代
HarmonyOS 开发技术。

作为热爱技术的个人开发者，我将工作之外半年多的时间都投入到这个项目中。每一个功能的实现、每一次代码的优化，都是我在闲暇时间精心打磨的成果。尽管进度可能不如专职团队那么快，而且某些功能的实现还不够完善，但我会持续改进，不断完善。如果你对
HarmonyOS 开发感兴趣，无论是学习还是共同创造，都欢迎加入。

> 如果项目对您有帮助，请给个 Star 支持 ⭐ 这对我来说很重要，能给我带来长期更新维护的动力！

## 📱 项目预览

> 💡 **说明**：由于功能模块较多，截图不下，这里仅展示部分界面。

<img src="docs/images/preview/Mobile 1.png" alt="青商城移动端预览1"/>
<img src="docs/images/preview/Mobile 2.png" alt="青商城移动端预览2"/>
<img src="docs/images/preview/Tablet 1.png" alt="青商城平板端预览1"/>
<img src="docs/images/preview/Tablet 2.png" alt="青商城平板端预览2"/>
<img src="docs/images/preview/Foldable 1.png" alt="青商城折叠屏预览"/>

## 📍 项目地址

- **GitHub 地址**：[https://github.com/Joker-x-dev/CoolMallArkTS](https://github.com/Joker-x-dev/CoolMallArkTS)
- **Gitee 地址**：[https://gitee.com/Joker-x-dev/CoolMallArkTS](https://gitee.com/Joker-x-dev/CoolMallArkTS)

### 相关文档

- **青商城 API 接口文档**：[在线查看](https://coolmall.apifox.cn)
  - 接口文档会随着项目开发进度同步更新，主要包含各接口的请求参数和返回数据示例


- **IBest-UI-V2 组件库文档**：[在线查看](https://ibestui-v2.ibestservices.com)
  - 组件库使用说明与参数配置，包含常用组件示例


- **IBest-ORM 数据库文档**：[在线查看](https://ibest-orm.ibestservices.com/)
  - 本地数据库能力与实体定义说明，包含基础使用示例

## 🛠️ 技术栈

### 核心技术

| 类别    | 技术选型                           | 说明                     |
|-------|--------------------------------|------------------------|
| 编程语言  | ArkTS                          | HarmonyOS NEXT 主流语言   |
| UI 框架 | ArkUI                          | 声明式 UI 框架            |
| 架构模式  | MVVM                           | View + ViewModel 分离   |
| 导航框架  | Navigation                     | 路由与页面导航管理       |
| 状态管理  | V2（ObservedV2/AppStorageV2）     | 新版状态管理能力           |
| 组件库   | IBest-UI-V2                    | 业务组件库与基础控件封装       |

### 功能模块

| 类别    | 技术选型      | 说明            |
|-------|-----------|---------------|
| 网络请求  | Axios     | 网络客户端与拦截器封装 |
| 数据库   | IBest-ORM | 本地数据库能力      |

## ✨ 项目特点

- **现代化架构**: 采用模块化设计，各功能模块高度解耦
- **声明式 UI**: 使用 ArkUI 构建现代化用户界面
- **主题适配**: 完整支持浅色/深色主题动态切换
- **国际化**: 支持中英文语言切换，便于全球化推广
- **响应式编程**: 基于 V2 状态管理的响应式编程范式
- **完整的测试覆盖** `计划中`
- **屏幕适配**: 支持平板 / 折叠屏 / 手机

## 📚 资源与参考

- **资源说明**: 项目中的部分素材来自网络，仅用于学习交流
- **图标来源**: 项目使用的图标库来自[图鸟 Icon](https://github.com/tuniaoTech)

## 📱 功能模块目录

> **状态说明：**
> - `已完成` - 功能页面已完整实现并可以正常使用
> - `待完善` - 功能页面基本实现，但还需要进一步优化和完善
> - `待优化` - 功能页面已实现，但需要性能优化或体验优化
> - `仅页面` - 只完成了页面UI，功能逻辑尚未实现
> - `待开发` - 功能页面尚未开发，陆续实现中

- **主模块 (main)**
    - 首页 (home) `待完善`
    - 分类 (category) `待完善`
    - 购物车 (cart) `待完善`
    - 我的 (me) `待完善`


- **认证模块 (auth)**
    - 登录主页 (login) `待完善`
    - 账号密码登录 (account-login) `已完成`
    - 注册页面 (register) `仅页面`
    - 找回密码 (reset-password) `仅页面`
    - 短信登录 (sms-login) `仅页面`


- **用户体系模块 (user)**
    - 个人中心 (profile) `仅页面`
    - 收货地址列表 (address-list) `已完成`
    - 收货地址详情 (address-detail) `已完成`
    - 用户足迹 (footprint) `已完成`


- **订单模块 (order)**
    - 订单列表 (list) `待完善`
    - 确认订单 (confirm) `待完善`
    - 订单详情 (detail) `待完善`
    - 订单支付 (pay) `已完成`
    - 退款申请 (refund) `已完成`
    - 订单评价 (comment) `待完善`
    - 订单物流 (logistics) `已完成`


- **商品模块 (goods)**
    - 商品搜索 (search) `已完成`
    - 商品详情 (detail) `待完善`
    - 商品评价 (comment) `已完成`
    - 商品分类页面 (category) `已完成`


- **营销模块 (market)**
    - 优惠券管理 (coupon) `已完成`


- **客服模块 (cs)**
    - 客服聊天 (chat) `待开发`


- **反馈模块 (feedback)**
    - 反馈列表 (list) `待开发`
    - 提交反馈 (submit) `待开发`


- **通用模块 (common)**
    - 关于我们 (about) `待开发`
    - WebView 页面 (web) `待开发`
    - 应用设置 (settings) `待开发`
    - 用户协议 (user-agreement) `待开发`
    - 隐私政策 (privacy-policy) `待开发`
    - 贡献者列表 (contributors) `待开发`


- **启动流程模块 (launch)**
    - 启动页 (splash) `仅页面`
    - 引导页 (guide) `仅页面`

## 项目结构

```
AppScope/               # 应用配置
entry/                  # 应用入口模块
core/                   # 核心模块
│   ├── base/           # 基类
│   ├── data/           # 数据层
│   ├── database/       # 数据库
│   ├── datastore/      # 数据存储
│   ├── designsystem/   # 设计系统
│   ├── ibestui/        # IBest UI 组件库
│   ├── model/          # 数据模型
│   ├── navigation/     # 导航
│   ├── network/        # 网络层
│   ├── result/         # 结果处理
│   ├── state/          # 全局状态
│   ├── ui/             # UI组件
│   └── util/           # 工具类
feature/                # 功能模块
│   ├── auth/           # 认证模块
│   ├── common/         # 公共模块
│   ├── cs/             # 客服模块
│   ├── feedback/       # 反馈模块
│   ├── goods/          # 商品模块
│   ├── launch/         # 启动模块
│   ├── main/           # 主模块
│   ├── market/         # 营销模块
│   ├── order/          # 订单模块
│   └── user/           # 用户模块
```

## 🚀 开发计划

这是一个纯粹由个人热情驱动的开源项目。作为一名全职开发者，我只能在工作之余的时间来维护它，每一行代码都凝聚着我下班后和周末的心血。尽管时间有限，我仍然希望通过这个项目创建一个完整的电商学习案例，它更适合作为学习参考而非商业应用，因为某些方面还未达到商业级水准。我的目标是为其他开发者提供一个学习现代
HarmonyOS 开发技术的实践平台。

由于时间和精力的限制，项目的更新节奏可能不会很快，但我会坚持长期投入，一步一步地完善每个功能模块。如果你有兴趣参与贡献，无论是代码、设计还是文档方面，都将非常欢迎！

### 🌟 鸿蒙版本（当前）

- **技术栈**：ArkTS + ArkUI + MVVM
- **架构特点**：模块化设计 + 原子化服务

### 📱 Android 版本（维护中）

- **技术栈**：Kotlin + Jetpack Compose + MVVM
- **架构特点**：模块化设计 + Clean Architecture
- **项目地址**：
    - **GitHub**：[https://github.com/Joker-x-dev/CoolMallKotlin](https://github.com/Joker-x-dev/CoolMallKotlin)
    - **Gitee**：[https://gitee.com/Joker-x-dev/CoolMallKotlin](https://gitee.com/Joker-x-dev/CoolMallKotlin)

### 🍎 iOS 版本（计划中）

- **技术栈**：Swift + SwiftUI + MVVM
- **架构特点**：模块化设计 + 组件化开发

### 🔧 近期重点

1. **核心交易完善**：完善下单、支付、订单列表/详情等核心流程的细节
2. **首页与分类完善**：优化首页、分类、购物车的核心交互与数据链路

### 🚀 中长期规划

3. **业务模块扩展**：逐步补齐客服、反馈、商品、订单、营销等业务模块
4. **质量提升**：补充测试与性能优化，提升可维护性
5. **文档完善**：持续更新开发文档与使用说明

## 👥 加入群聊

欢迎加入青商城开发者交流群，一起分享学习心得，讨论技术问题！

<div align="left">
  <img src="docs/images/group/qq.jpg" width="200" alt="QQ群二维码"/>
  <p>扫码或搜索群号加入 QQ 群</p>
</div>

## 🤝 参与贡献

欢迎对 HarmonyOS 开发感兴趣的同学参与贡献：

- **代码贡献**: 提交 Pull Request，完善功能实现或修复问题
- **问题反馈**: 通过 Issue 报告 Bug 或提出功能建议
- **文档优化**: 完善项目文档、添加使用说明或开发指南
- **设计支持**: 提供 UI/UX 设计建议或素材资源
- **测试协助**: 参与功能测试，提供使用反馈和改进建议

让我们一起打造一个优质的鸿蒙学习项目！ 🚀
