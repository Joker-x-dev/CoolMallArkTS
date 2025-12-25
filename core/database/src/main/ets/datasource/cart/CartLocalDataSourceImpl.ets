import { getORM } from "@ibestservices/ibest-orm";
import { Cart, CartGoodsSpec } from "model";
import { CartLocalDataSource } from "./CartLocalDataSource";
import { CartEntity } from "../../entity/CartEntity";

/**
 * @file 购物车本地数据源实现
 * @author Joker.X
 */
export class CartLocalDataSourceImpl implements CartLocalDataSource {
  /**
   * 迁移标记，防止重复执行 migrate
   */
  private static migrated: boolean = false;
  /**
   * ORM 实例，用于执行数据库操作
   */
  private orm = getORM();

  /**
   * 构造函数，初始化 ORM 并确保购物车表已迁移
   * @returns {CartLocalDataSourceImpl} 实例
   */
  constructor() {
    this.ensureMigrated();
  }

  /**
   * 确保购物车表完成迁移
   * @returns {void} 无返回
   */
  private ensureMigrated(): void {
    if (!CartLocalDataSourceImpl.migrated) {
      this.orm.migrate(CartEntity);
      CartLocalDataSourceImpl.migrated = true;
    }
  }

  /**
   * 添加商品到购物车
   * @param {Cart} cart 购物车商品
   * @returns {Promise<void>} Promise<void>
   */
  async addToCart(cart: Cart): Promise<void> {
    this.orm.insert(this.toEntity(cart));
  }

  /**
   * 更新购物车中的商品
   * @param {Cart} cart 购物车商品
   * @returns {Promise<void>} Promise<void>
   */
  async updateCart(cart: Cart): Promise<void> {
    this.orm.save(this.toEntity(cart));
  }

  /**
   * 更新购物车中商品的规格数量
   * @param {number} goodsId 商品ID
   * @param {number} specId 规格ID
   * @param {number} count 规格数量
   * @returns {Promise<void>} Promise<void>
   */
  async updateCartSpecCount(goodsId: number, specId: number, count: number): Promise<void> {
    const entity: CartEntity | undefined = this.findEntityByGoodsId(goodsId);
    if (!entity) {
      return;
    }
    const specs: CartGoodsSpec[] = this.parseSpecs(entity.specJson);
    const updatedSpecs: CartGoodsSpec[] = specs.map((spec) => {
      const next = new CartGoodsSpec(spec);
      if (next.id === specId) {
        next.count = count;
      }
      return next;
    });

    if (updatedSpecs.length === 0 || updatedSpecs.every((item) => item.count <= 0)) {
      this.orm.deleteById(CartEntity, goodsId);
      return;
    }

    entity.specJson = JSON.stringify(updatedSpecs);
    this.orm.save(entity);
  }

  /**
   * 从购物车删除商品
   * @param {number} goodsId 商品ID
   * @returns {Promise<void>} Promise<void>
   */
  async removeFromCart(goodsId: number): Promise<void> {
    this.orm.deleteById(CartEntity, goodsId);
  }

  /**
   * 从购物车删除商品规格
   * @param {number} goodsId 商品ID
   * @param {number} specId 规格ID
   * @returns {Promise<void>} Promise<void>
   */
  async removeSpecFromCart(goodsId: number, specId: number): Promise<void> {
    const entity: CartEntity | undefined = this.findEntityByGoodsId(goodsId);
    if (!entity) {
      return;
    }
    const specs: CartGoodsSpec[] = this.parseSpecs(entity.specJson).filter((spec) => spec.id !== specId);
    if (specs.length === 0) {
      this.orm.deleteById(CartEntity, goodsId);
      return;
    }
    entity.specJson = JSON.stringify(specs);
    this.orm.save(entity);
  }

  /**
   * 清空购物车
   * @returns {Promise<void>} Promise<void>
   */
  async clearCart(): Promise<void> {
    this.orm.query(CartEntity).delete();
  }

  /**
   * 获取购物车中所有商品
   * @returns {Promise<Cart[]>} 购物车列表
   */
  async getAllCarts(): Promise<Cart[]> {
    const list: CartEntity[] = this.orm.query(CartEntity).find();
    return list.map((entity) => this.toModel(entity));
  }

  /**
   * 获取购物车商品总数量
   * @returns {Promise<number>} 商品总数
   */
  async getCartCount(): Promise<number> {
    return this.orm.query(CartEntity).find().length;
  }

  /**
   * 根据商品ID获取购物车商品
   * @param {number} goodsId 商品ID
   * @returns {Promise<Cart | undefined>} 匹配到的购物车商品
   */
  async getCartByGoodsId(goodsId: number): Promise<Cart | undefined> {
    const entity: CartEntity | undefined = this.findEntityByGoodsId(goodsId);
    return entity ? this.toModel(entity) : undefined;
  }

  /**
   * 根据商品ID查询实体
   * @param {number} goodsId 商品ID
   * @returns {CartEntity | undefined} 匹配实体
   */
  private findEntityByGoodsId(goodsId: number): CartEntity | undefined {
    const result: CartEntity[] = this.orm.query(CartEntity).where("goodsId", goodsId).find();
    return result[0];
  }

  /**
   * 将领域模型转换为数据库实体
   * @param {Cart} cart 购物车领域模型
   * @returns {CartEntity} 数据库实体
   */
  private toEntity(cart: Cart): CartEntity {
    const entity: CartEntity = new CartEntity();
    entity.goodsId = cart.goodsId;
    entity.goodsName = cart.goodsName;
    entity.goodsMainPic = cart.goodsMainPic;
    entity.specJson = JSON.stringify(cart.spec ?? []);
    return entity;
  }

  /**
   * 将数据库实体转换为领域模型
   * @param {CartEntity} entity 数据库实体
   * @returns {Cart} 领域模型
   */
  private toModel(entity: CartEntity): Cart {
    const cart: Cart = new Cart();
    cart.goodsId = entity.goodsId ?? 0;
    cart.goodsName = entity.goodsName ?? "";
    cart.goodsMainPic = entity.goodsMainPic ?? "";
    cart.spec = this.parseSpecs(entity.specJson);
    return cart;
  }

  /**
   * 解析规格 JSON 字符串为规格列表
   * @param {string | undefined} specJson 规格 JSON
   * @returns {CartGoodsSpec[]} 规格列表
   */
  private parseSpecs(specJson?: string): CartGoodsSpec[] {
    if (!specJson) {
      return [];
    }
    try {
      const raw: CartGoodsSpec[] | undefined = JSON.parse(specJson) as CartGoodsSpec[];
      if (Array.isArray(raw)) {
        return raw.map((item: CartGoodsSpec) => new CartGoodsSpec(item as Partial<CartGoodsSpec>));
      }
      return [];
    } catch (error) {
      return [];
    }
  }
}
