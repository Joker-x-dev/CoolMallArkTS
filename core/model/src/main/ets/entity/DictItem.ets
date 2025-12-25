/**
 * @file 字典项
 * @author Joker.X
 */
export class DictItem {
  /**
   * 字典类型ID
   */
  typeId?: number | null = 0;
  /**
   * 父级ID
   */
  parentId?: number | null = 0;
  /**
   * 字典项名称
   */
  name?: string | null = "";
  /**
   * 字典项ID
   */
  id?: number | null = 0;
  /**
   * 字典项值
   */
  value?: number | null = 0;

  constructor(init?: Partial<DictItem>) {
    if (!init) {
      return;
    }
    this.typeId = init.typeId ?? this.typeId;
    this.parentId = init.parentId ?? this.parentId;
    this.name = init.name ?? this.name;
    this.id = init.id ?? this.id;
    this.value = init.value ?? this.value;
  }
}
