/**
 * @file 字典数据请求
 * @author Joker.X
 */
export class DictDataRequest {
  /**
   * 字典类型列表
   */
  types: string[] = [];

  /**
   * @param {Partial<DictDataRequest>} init - 初始化数据
   */
  constructor(init?: Partial<DictDataRequest>) {
    if (!init) return;
    this.types = init.types ?? this.types;
  }
}
