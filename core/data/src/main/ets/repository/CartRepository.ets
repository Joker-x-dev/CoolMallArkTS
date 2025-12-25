import { Cart } from "model";
import { CartLocalDataSource, CartLocalDataSourceImpl } from "database";

/**
 * @file 购物车本地仓库，封装数据库数据源并提供业务方法。
 * @author Joker.X
 */
export class CartRepository {
  /**
   * 本地数据源实例
   */
  private dataSource: CartLocalDataSource;

  /**
   * 构造函数
   * @param {CartLocalDataSource} dataSource 可选的数据源实例
   */
  constructor(dataSource: CartLocalDataSource = new CartLocalDataSourceImpl()) {
    this.dataSource = dataSource;
  }

  /**
   * 添加商品到购物车
   * @param {Cart} cart 购物车商品
   * @returns {Promise<void>} Promise<void>
   */
  addToCart(cart: Cart): Promise<void> {
    return this.dataSource.addToCart(cart);
  }

  /**
   * 更新购物车中的商品
   * @param {Cart} cart 购物车商品
   * @returns {Promise<void>} Promise<void>
   */
  updateCart(cart: Cart): Promise<void> {
    return this.dataSource.updateCart(cart);
  }

  /**
   * 更新购物车中商品的规格数量
   * @param {number} goodsId 商品ID
   * @param {number} specId 规格ID
   * @param {number} count 规格数量
   * @returns {Promise<void>} Promise<void>
   */
  updateCartSpecCount(goodsId: number, specId: number, count: number): Promise<void> {
    return this.dataSource.updateCartSpecCount(goodsId, specId, count);
  }

  /**
   * 从购物车删除商品
   * @param {number} goodsId 商品ID
   * @returns {Promise<void>} Promise<void>
   */
  removeFromCart(goodsId: number): Promise<void> {
    return this.dataSource.removeFromCart(goodsId);
  }

  /**
   * 从购物车删除商品规格
   * @param {number} goodsId 商品ID
   * @param {number} specId 规格ID
   * @returns {Promise<void>} Promise<void>
   */
  removeSpecFromCart(goodsId: number, specId: number): Promise<void> {
    return this.dataSource.removeSpecFromCart(goodsId, specId);
  }

  /**
   * 清空购物车
   * @returns {Promise<void>} Promise<void>
   */
  clearCart(): Promise<void> {
    return this.dataSource.clearCart();
  }

  /**
   * 获取购物车中所有商品
   * @returns {Promise<Cart[]>} 购物车列表
   */
  getAllCarts(): Promise<Cart[]> {
    return this.dataSource.getAllCarts();
  }

  /**
   * 获取购物车商品总数量
   * @returns {Promise<number>} 商品总数
   */
  getCartCount(): Promise<number> {
    return this.dataSource.getCartCount();
  }

  /**
   * 根据商品ID获取购物车商品
   * @param {number} goodsId 商品ID
   * @returns {Promise<Cart | undefined>} 匹配到的购物车商品
   */
  getCartByGoodsId(goodsId: number): Promise<Cart | undefined> {
    return this.dataSource.getCartByGoodsId(goodsId);
  }
}
