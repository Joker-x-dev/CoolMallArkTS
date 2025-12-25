import { AppNavDestination } from "ui";
import ChatViewModel from "../viewmodel/ChatViewModel";

/**
 * @file 客服聊天页面视图
 * @author Joker.X
 */
@ComponentV2
export struct ChatPage {
  /**
   * 客服聊天页面 ViewModel
   */
  @Local
  private vm: ChatViewModel = new ChatViewModel();

  /**
   * 构建客服聊天页面
   * @returns {void} 无返回值
   */
  build() {
    AppNavDestination({
      title: "客服聊天",
      viewModel: this.vm
    }) {
      this.ChatContent();
    }
  }

  /**
   * 客服聊天页面内容视图
   * @returns {void} 无返回值
   */
  @Builder
  private ChatContent() {
    Text("客服聊天页面内容视图")
  }
}
