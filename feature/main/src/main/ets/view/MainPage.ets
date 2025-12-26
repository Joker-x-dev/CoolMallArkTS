import { AppNavDestination } from "ui";
import { NotificationBasicOptions, NotificationLongTextOptions,
  NotificationMultiLineOptions,
  NotificationPictureOptions,
  NotificationTemplateOptions,
  NotificationUtil } from "util";
import MainViewModel from "../viewmodel/MainViewModel";

/**
 * @file 主页面视图
 * @author Joker.X
 */
@ComponentV2
export struct MainPage {
  /**
   * 主页面 ViewModel
   */
  @Local
  private vm: MainViewModel = new MainViewModel();

  /**
   * 构建主页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "主页面",
      viewModel: this.vm
    }) {
      this.MainContent();
    }
  }

  /**
   * 主页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private MainContent() {
    Text("主页面内容视图")
    Column() {
      Button("申请发送通知权限，未授权则拉起一次二次授权申请").onClick(async()=>{
        NotificationUtil.Permission.requestPermission((grant) => {
          if (!grant) {
            NotificationUtil.Permission.openSettings();
          }
        })
      })
      Button("预设默认配置").onClick(async()=>{
        const smallIcon = await NotificationUtil.Tools.createCompressedIcon($r("app.media.notify_test_1"));
        const largeIcon = await NotificationUtil.Tools.createCompressedIcon($r("app.media.notify_test_3"));
        const picture = await NotificationUtil.Tools.createCompressedImage($r("app.media.notify_test_3"));
        const wantAgent = await NotificationUtil.Tools.getSelfWantAgent();
        NotificationUtil.PresetConfig((config) => {
          config.wantAgent = wantAgent
          config.removeRedirectWantAgent = wantAgent
          config.smallIcon = smallIcon
          config.largeIcon = largeIcon
          config.showStatusBarIcon = true
          config.autoDismissOnTap = true
          config.supplementaryContent = "默认配置"
          config.lockscreenDisplayImage = picture
        })
      })
      Button("发送文本消息").onClick(async()=>{
        const options: NotificationBasicOptions = {
          mainTitle: "通知标题",
          mainContent: "通知内容"
        }
        const id = await NotificationUtil.Sender.sendText(options);
        console.log("Notification sendText", id);
      })
      Button("发送长文本消息").onClick(async()=>{
        const options: NotificationLongTextOptions = {
          mainTitle: "通知标题",
          mainContent: "通知内容",
          summaryText: "摘要，对长文本内容的总结",
          detailedLongContent: "展开后显示的全部内容",
          expandedDisplayTitle: "通知展开的标题"
        }
        const id = await NotificationUtil.Sender.sendLongText(options);
        console.log("Notification sendLongText", id);
      })
      Button("发送多行文本消息").onClick(async()=>{
        const options: NotificationMultiLineOptions = {
          mainTitle: "通知标题",
          mainContent: "通知内容",
          summaryText: "摘要，对长文本内容的总结",
          expandedDisplayTitle: "通知展开的标题",
          multiLineContentList: ["111","222","333"]
        }
        const id = await NotificationUtil.Sender.sendMultiLine(options);
        console.log("Notification sendMultiLine", id);
      })
      Button("发送图片消息").onClick(async()=>{
        const pixelMap = await NotificationUtil.Tools.createCompressedImage($r("app.media.notify_test_3"))
        const options: NotificationPictureOptions = {
          mainTitle: "通知标题",
          mainContent: "通知内容",
          summaryText: "摘要，对长文本内容的总结",
          expandedDisplayTitle: "通知展开的标题",
          attachedImage: pixelMap
        }
        const id = await NotificationUtil.Sender.sendPicture(options);
        console.log("Notification sendPicture", id, pixelMap.getPixelBytesNumber());
      })
      Button("下载模板消息").onClick(async()=>{
        if(await NotificationUtil.Tools.isSupportTemplate()) {
          const options: NotificationTemplateOptions = {
            mainTitle: "通知标题",
            mainContent: "通知内容",
            downloadFileName: "学习资料.mp4",
            downloadProgress: 85
          }
          const id = await NotificationUtil.Sender.sendTemplate(options);
          console.log("Notification sendTemplate", id);
        } else {
          console.log("Notification isSupportTemplate false");
        }
      })
      Button("清楚通知").onClick(()=>{
        NotificationUtil.Manager.cancelAll();
      })
      Button("设置角标").onClick(()=>{
        NotificationUtil.Manager.setBadgeNumber(3);
      })
      Button("清楚角标").onClick(()=>{
        NotificationUtil.Manager.clearBadgeNumber();
      })
    }
  }
}