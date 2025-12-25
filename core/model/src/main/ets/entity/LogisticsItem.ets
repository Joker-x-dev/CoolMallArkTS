/**
 * @file 物流轨迹项实体类
 * @author Joker.X
 */
export class LogisticsItem {
  /**
   * 时间
   */
  time?: string | null = null;
  /**
   * 状态描述
   */
  status?: string | null = null;

  constructor(init?: Partial<LogisticsItem>) {
    if (!init) {
      return;
    }
    this.time = init.time ?? this.time;
    this.status = init.status ?? this.status;
  }
}
