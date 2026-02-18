<div align="center">

<img src="docs/images/graphs/logo.svg" width="120" alt="CoolMall Logo"/>

# CoolMall · HarmonyOS

_🛍️ A HarmonyOS e-commerce app built with ArkTS and ArkUI_

<!-- Language Switch Button -->
<div align="center">
  <a href="README.md">🌍 中文</a>
</div>

[![GitHub](https://img.shields.io/badge/GitHub-CoolMallArkTS-blue?style=flat-square&logo=github)](https://github.com/Joker-x-dev/CoolMallArkTS)
[![Gitee](https://img.shields.io/badge/Gitee-CoolMallArkTS-red?style=flat-square&logo=gitee)](https://gitee.com/Joker-x-dev/CoolMallArkTS)
[![API](https://img.shields.io/badge/API-Documentation-orange?style=flat-square&logo=postman)](https://coolmall.apifox.cn)
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/Joker-x-dev/CoolMallKotlin)

</div>

## 📖 Project Introduction

This is an open-source e-commerce learning project built with ArkTS and ArkUI, aiming to
demonstrate how to use modern HarmonyOS development technologies to build a complete e-commerce
application. The project covers core flows such as user authentication, product display, shopping
cart, and order payment, suitable for developers to learn and reference modern HarmonyOS development
technologies.

As a technology-loving individual developer, I have invested more than half a year of my spare time
into this project. Every feature implementation and code optimization is the result of my careful
crafting during leisure time. Although the progress may not be as fast as a dedicated team, and some
feature implementations are not yet perfect, I will continue to improve and refine them. If you are
interested in HarmonyOS development, whether for learning or collaborative creation, you are welcome
to join.

> If this project helps you, please give it a Star ⭐ This is very important to me and gives me the
> motivation for long-term updates and maintenance!

## 📱 Project Preview

> 💡 **Note**: Due to the large number of functional modules, screenshots cannot cover all features.
> Here we only show some interfaces.

<img src="docs/images/preview/Mobile 1.png" alt="CoolMall Mobile Preview 1"/>
<img src="docs/images/preview/Mobile 2.png" alt="CoolMall Mobile Preview 2"/>
<img src="docs/images/preview/Tablet 1.png" alt="CoolMall Tablet Preview 1"/>
<img src="docs/images/preview/Tablet 2.png" alt="CoolMall Tablet Preview 2"/>
<img src="docs/images/preview/Foldable 1.png" alt="CoolMall Foldable Preview"/>

## 📍 Project Links

- **GitHub Repository**: [https://github.com/Joker-x-dev/CoolMallArkTS](https://github.com/Joker-x-dev/CoolMallArkTS)
- **Gitee Repository**: [https://gitee.com/Joker-x-dev/CoolMallArkTS](https://gitee.com/Joker-x-dev/CoolMallArkTS)

### Related Docs

- **CoolMall API Docs**: [View Online](https://coolmall.apifox.cn)
  - The API documentation is kept in sync with project progress and mainly includes request parameters and response samples for each endpoint.


- **IBest-UI-V2 Docs**: [View Online](https://ibestui-v2.ibestservices.com)
  - Component usage and parameter reference with common examples.


- **IBest-ORM Docs**: [View Online](https://ibest-orm.ibestservices.com/)
  - Local database capabilities and entity definitions with basic usage examples.

## 🛠️ Tech Stack

### Core Technologies

| Category             | Technology                         | Description                          |
|----------------------|------------------------------------|--------------------------------------|
| Programming Language | ArkTS                              | Primary language for HarmonyOS NEXT  |
| UI Framework         | ArkUI                              | Declarative UI framework             |
| Architecture Pattern | MVVM                               | View + ViewModel separation          |
| Navigation           | Navigation                         | Routing and page navigation          |
| State Management     | V2 (ObservedV2/AppStorageV2)        | Next-gen state management            |
| Component Library    | IBest-UI-V2                         | Business UI components               |

### Functional Modules

| Category        | Technology | Description                         |
|----------------|------------|-------------------------------------|
| Network         | Axios      | HTTP client and interceptors        |
| Database        | IBest-ORM  | Local database                      |

## ✨ Project Features

- **Modern Architecture**: Adopts modular design with highly decoupled
  functional modules
- **Declarative UI**: Uses ArkUI to build modern user interfaces
- **Theme Adaptation**: Complete support for light/dark theme dynamic switching
- **Internationalization**: Supports Chinese and English language switching for global promotion
- **Reactive Programming**: Reactive programming paradigm based on V2 state management
- **Complete Test Coverage** `Planned`
- **Screen Adaptation**: Tablet / Foldable / Phone support

## 📚 Resources and References

- **Resource Description**: Some materials in the project come from the internet and are only used
  for learning and communication
- **Icon Source**: The icon library used in the project comes
  from [TuNiao Icon](https://github.com/tuniaoTech)

## 📱 Feature Module Directory

> **Status Description:**
> - `Completed` - Feature pages are fully implemented and can be used normally
> - `To be improved` - Feature pages are basically implemented but need further polish
> - `To be optimized` - Feature pages are implemented but need performance optimization or experience optimization
> - `UI only` - Only page UI is completed, functional logic is not yet implemented
> - `To be developed` - Feature pages are not yet developed and will be implemented gradually

- **Main Module (main)**
    - Home (home) `To be improved`
    - Category (category) `To be improved`
    - Shopping Cart (cart) `To be improved`
    - Profile (me) `To be improved`


- **Authentication Module (auth)**
    - Login Home (login) `To be improved`
    - Account Password Login (account-login) `Completed`
    - Registration Page (register) `UI only`
    - Password Recovery (reset-password) `UI only`
    - SMS Login (sms-login) `UI only`


- **User System Module (user)**
    - Personal Center (profile) `UI only`
    - Address List (address-list) `Completed`
    - Address Details (address-detail) `Completed`
    - User Footprint (footprint) `Completed`


- **Order Module (order)**
    - Order List (list) `To be improved`
    - Confirm Order (confirm) `To be improved`
    - Order Details (detail) `To be improved`
    - Order Payment (pay) `Completed`
    - Refund Application (refund) `Completed`
    - Order Review (comment) `To be improved`
    - Order Logistics (logistics) `Completed`


- **Product Module (goods)**
    - Product Search (search) `Completed`
    - Product Details (detail) `To be improved`
    - Product Reviews (comment) `Completed`
    - Product Category Page (category) `Completed`


- **Marketing Module (market)**
    - Coupon Management (coupon) `Completed`


- **Customer Service Module (cs)**
    - Customer Service Chat (chat) `To be developed`


- **Feedback Module (feedback)**
    - Feedback List (list) `To be developed`
    - Submit Feedback (submit) `To be developed`


- **Common Module (common)**
    - About Us (about) `To be developed`
    - WebView Page (web) `To be developed`
    - App Settings (settings) `To be developed`
    - User Agreement (user-agreement) `To be developed`
    - Privacy Policy (privacy-policy) `To be developed`
    - Contributors List (contributors) `To be developed`


- **Launch Process Module (launch)**
    - Splash Screen (splash) `UI only`
    - Guide Pages (guide) `UI only`

## Project Structure

```
AppScope/               # App config
entry/                  # Application entry module
core/                   # Core modules
│   ├── base/           # Base classes
│   ├── data/           # Data layer
│   ├── database/       # Database
│   ├── datastore/      # Data storage
│   ├── designsystem/   # Design system
│   ├── ibestui/        # IBest UI 组件库
│   ├── model/          # Data models
│   ├── navigation/     # Navigation
│   ├── network/        # Network layer
│   ├── result/         # Result processing
│   ├── state/          # Global state
│   ├── ui/             # UI components
│   └── util/           # Utility classes
feature/                # Feature modules
│   ├── auth/           # Authentication module
│   ├── common/         # Common module
│   ├── cs/             # Customer service module
│   ├── feedback/       # Feedback module
│   ├── goods/          # Product module
│   ├── launch/         # Launch module
│   ├── main/           # Main module
│   ├── market/         # Marketing module
│   ├── order/          # Order module
│   └── user/           # User module
```

## 🚀 Development Plan

This is an open-source project driven purely by personal passion. As a full-time developer, I can
only maintain it in my spare time, and every line of code embodies the effort I put in after work
and on weekends. Despite limited time, I still hope to build a complete e-commerce learning
example with this project. It is more suitable as a learning reference than a commercial product,
as some aspects have not yet reached commercial-grade standards. My goal is to provide other
developers with a hands-on platform for learning modern HarmonyOS development.

Due to time and energy constraints, the update pace may not be fast, but I will continue to invest
long-term and gradually improve each functional module. If you are interested in contributing,
whether in code, design, or documentation, you are very welcome!

### 🌟 HarmonyOS Version (Current)

- **Tech Stack**: ArkTS + ArkUI + MVVM
- **Architecture**: Modular design + atomic services

### 📱 Android Version (Maintenance)

- **Tech Stack**: Kotlin + Jetpack Compose + MVVM
- **Architecture**: Modular design + Clean Architecture
- **Project Links**:
    - **GitHub**: [https://github.com/Joker-x-dev/CoolMallKotlin](https://github.com/Joker-x-dev/CoolMallKotlin)
    - **Gitee**: [https://gitee.com/Joker-x-dev/CoolMallKotlin](https://gitee.com/Joker-x-dev/CoolMallKotlin)

### 🍎 iOS Version (Planned)

- **Tech Stack**: Swift + SwiftUI + MVVM
- **Architecture**: Modular design + component-based development

### 🔧 Near-term Focus

1. **Core Transaction Completion**: Improve the details of ordering, payment, and order list/detail flows
2. **Home & Category Completion**: Optimize core interactions and data flows for Home, Category, and Cart

### 🚀 Medium to Long-term Planning

3. **Module Expansion**: Gradually complete customer service, feedback, goods, order, and marketing modules
4. **Quality Improvement**: Add tests and performance optimizations to improve maintainability
5. **Documentation**: Keep docs and guides updated

## 👥 Join the Community

Welcome to join the CoolMall Developer Community to share learning experiences and discuss technical issues!

<div align="left">
  <img src="docs/images/group/qq.jpg" width="200" alt="QQ Group QR Code"/>
  <p>Scan or search for the group number to join QQ Group</p>
</div>

## 🤝 Contributing

Contributions are welcome for HarmonyOS development enthusiasts:

- **Code Contribution**: Submit Pull Requests to add features or fix issues
- **Issue Feedback**: Report bugs or suggest improvements via Issues
- **Documentation**: Improve project docs and usage guides
- **Design Support**: Provide UI/UX suggestions or resources
- **Testing Assistance**: Participate in testing and share feedback

Let’s build a high-quality HarmonyOS learning project together! 🚀
