# NotificationUtil 鸿蒙消息通知工具

封装鸿蒙 `@kit.NotificationKit` 的通知工具类，按功能场景拆分为多个命名空间，简化通知的权限管理、发送、生命周期管理等操作。

## 导入

```typescript
import { NotificationUtil, NotificationBasicOptions, NotificationLongTextOptions,
  NotificationMultiLineOptions, NotificationPictureOptions, NotificationTemplateOptions } from "util";
```

## 命名空间

| 命名空间 | 说明 |
|---------|------|
| `Permission` | 通知权限管理 |
| `Sender` | 通知发送（支持多种类型） |
| `Manager` | 通知生命周期管理 |
| `Channel` | 通知渠道管理 |
| `Tools` | 辅助工具方法 |

## Permission - 权限管理

### isEnabled()
查询当前应用通知使能状态。

```typescript
const enabled = NotificationUtil.Permission.isEnabled();
```

### requestEnable()
申请通知授权，拉起授权弹窗。

```typescript
await NotificationUtil.Permission.requestEnable();
```

### openSettings()
拉起应用的通知设置界面（半模态形式）。

```typescript
await NotificationUtil.Permission.openSettings();
```

### requestPermission(callback)
统一处理权限申请流程，已授权直接回调，未授权则拉起弹窗。

```typescript
NotificationUtil.Permission.requestPermission((granted) => {
  if (!granted) {
    // 用户拒绝，可拉起设置页二次申请
    NotificationUtil.Permission.openSettings();
  }
});
```

## Sender - 发送通知

### sendText(options)
发布普通文本通知。

```typescript
const options: NotificationBasicOptions = {
  mainTitle: "通知标题",
  mainContent: "通知内容"
};
const id = await NotificationUtil.Sender.sendText(options);
```

### sendLongText(options)
发布长文本通知。

```typescript
const options: NotificationLongTextOptions = {
  mainTitle: "通知标题",
  mainContent: "通知内容",
  summaryText: "摘要文本",
  detailedLongContent: "展开后显示的全部内容",
  expandedDisplayTitle: "展开时的标题"
};
const id = await NotificationUtil.Sender.sendLongText(options);
```

### sendMultiLine(options)
发布多行文本通知。

```typescript
const options: NotificationMultiLineOptions = {
  mainTitle: "通知标题",
  mainContent: "通知内容",
  summaryText: "摘要文本",
  expandedDisplayTitle: "展开时的标题",
  multiLineContentList: ["第一行", "第二行", "第三行"]
};
const id = await NotificationUtil.Sender.sendMultiLine(options);
```

### sendPicture(options)
发布带图片的通知。

```typescript
const pixelMap = await NotificationUtil.Tools.createCompressedImage($r("app.media.image"));
const options: NotificationPictureOptions = {
  mainTitle: "通知标题",
  mainContent: "通知内容",
  summaryText: "摘要文本",
  expandedDisplayTitle: "展开时的标题",
  attachedImage: pixelMap
};
const id = await NotificationUtil.Sender.sendPicture(options);
```

### sendTemplate(options)
发布下载进度模板通知。

```typescript
if (await NotificationUtil.Tools.isSupportTemplate()) {
  const options: NotificationTemplateOptions = {
    mainTitle: "下载中",
    mainContent: "正在下载文件",
    downloadFileName: "文件.mp4",
    downloadProgress: 85
  };
  const id = await NotificationUtil.Sender.sendTemplate(options);
}
```

## Manager - 生命周期管理

### cancel(id, label?)
取消指定通知。

```typescript
await NotificationUtil.Manager.cancel(notificationId);
```

### cancelGroup(groupName)
取消指定组的所有通知。

```typescript
await NotificationUtil.Manager.cancelGroup("groupName");
```

### cancelAll()
取消当前应用所有通知。

```typescript
await NotificationUtil.Manager.cancelAll();
```

### setBadgeNumber(count)
设置桌面图标角标数量。

```typescript
await NotificationUtil.Manager.setBadgeNumber(3);
```

### clearBadgeNumber()
清空桌面角标。

```typescript
await NotificationUtil.Manager.clearBadgeNumber();
```

### getActiveCount()
获取未删除的通知数量。

```typescript
const count = await NotificationUtil.Manager.getActiveCount();
```

### getActiveList()
获取未删除的通知列表。

```typescript
const list = await NotificationUtil.Manager.getActiveList();
```

## Channel - 渠道管理

### add(type)
创建指定类型的通知渠道。

```typescript
import { notificationManager } from '@kit.NotificationKit';
await NotificationUtil.Channel.add(notificationManager.SlotType.SERVICE_INFORMATION);
```

### get(type) / getAll()
获取指定类型或所有通知渠道。

```typescript
const slot = await NotificationUtil.Channel.get(notificationManager.SlotType.SERVICE_INFORMATION);
const allSlots = await NotificationUtil.Channel.getAll();
```

### remove(type) / removeAll()
删除指定类型或所有通知渠道。

```typescript
await NotificationUtil.Channel.remove(notificationManager.SlotType.SERVICE_INFORMATION);
await NotificationUtil.Channel.removeAll();
```

## Tools - 辅助工具

### createCompressedImage(src)
生成压缩的通知图片（≤2MB）。

```typescript
const pixelMap = await NotificationUtil.Tools.createCompressedImage($r("app.media.image"));
```

### createCompressedIcon(src)
生成压缩的通知图标（≤192KB）。

```typescript
const icon = await NotificationUtil.Tools.createCompressedIcon($r("app.media.icon"));
```

### getSelfWantAgent()
获取可拉起本应用的 WantAgent。

```typescript
const wantAgent = await NotificationUtil.Tools.getSelfWantAgent();
```

### isSupportTemplate(templateName?)
查询是否支持指定通知模板（默认 downloadTemplate）。

```typescript
const supported = await NotificationUtil.Tools.isSupportTemplate();
```

## PresetConfig - 预设配置

设置全局默认配置，后续发送通知时自动应用。

```typescript
const smallIcon = await NotificationUtil.Tools.createCompressedIcon($r("app.media.icon"));
const largeIcon = await NotificationUtil.Tools.createCompressedIcon($r("app.media.large_icon"));
const wantAgent = await NotificationUtil.Tools.getSelfWantAgent();

NotificationUtil.PresetConfig((config) => {
  config.wantAgent = wantAgent;              // 点击通知跳转
  config.smallIcon = smallIcon;              // 小图标
  config.largeIcon = largeIcon;              // 大图标
  config.autoDismissOnTap = true;            // 点击后自动清除
  config.showStatusBarIcon = true;           // 显示状态栏图标
  config.supplementaryContent = "应用名称";   // 补充内容
});
```

## 配置项说明

### NotificationBasicOptions（基础配置）

| 属性 | 类型 | 必填 | 说明 |
|-----|------|-----|------|
| mainTitle | string | 是 | 通知主标题 |
| mainContent | string | 是 | 通知核心内容 |
| supplementaryContent | string | 否 | 补充内容 |
| lockscreenDisplayImage | PixelMap | 否 | 锁屏显示图片 |
| channelType | SlotType | 否 | 通知通道类型 |
| autoDismissOnTap | boolean | 否 | 点击后自动清除 |
| autoRemoveTime | number | 否 | 自动清除时间戳 |
| wantAgent | WantAgent | 否 | 点击触发的行为 |
| smallIcon | PixelMap | 否 | 小图标（≤100KB） |
| largeIcon | PixelMap | 否 | 大图标（≤100KB） |
| actionButtons | Array | 否 | 操作按钮（最多3个） |
| notificationGroupName | string | 否 | 通知组名称 |
| notificationBadgeCount | number | 否 | 角标数量 |

### 扩展配置

- `NotificationLongTextOptions`: 增加 `summaryText`、`detailedLongContent`、`expandedDisplayTitle`
- `NotificationMultiLineOptions`: 增加 `summaryText`、`expandedDisplayTitle`、`multiLineContentList`
- `NotificationPictureOptions`: 增加 `summaryText`、`expandedDisplayTitle`、`attachedImage`
- `NotificationTemplateOptions`: 增加 `downloadFileName`、`downloadProgress`

## 完整示例

```typescript
import { NotificationUtil, NotificationBasicOptions } from "util";

// 1. 申请权限
NotificationUtil.Permission.requestPermission(async (granted) => {
  if (!granted) {
    NotificationUtil.Permission.openSettings();
    return;
  }

  // 2. 预设全局配置
  const wantAgent = await NotificationUtil.Tools.getSelfWantAgent();
  NotificationUtil.PresetConfig((config) => {
    config.wantAgent = wantAgent;
    config.autoDismissOnTap = true;
  });

  // 3. 发送通知
  const options: NotificationBasicOptions = {
    mainTitle: "新消息",
    mainContent: "您有一条新消息"
  };
  const id = await NotificationUtil.Sender.sendText(options);
  console.log("通知已发送，ID:", id);
});
```
