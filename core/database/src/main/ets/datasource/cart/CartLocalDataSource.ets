import { Cart } from "model";

/**
 * @file 购物车本地数据源接口
 * @author Joker.X
 */
export interface CartLocalDataSource {
  /**
   * 添加商品到购物车
   * @param {Cart} cart 购物车商品
   * @returns {Promise<void>} Promise<void>
   */
  addToCart(cart: Cart): Promise<void>;

  /**
   * 更新购物车中的商品
   * @param {Cart} cart 购物车商品
   * @returns {Promise<void>} Promise<void>
   */
  updateCart(cart: Cart): Promise<void>;

  /**
   * 更新购物车中商品的规格数量
   * @param {number} goodsId 商品ID
   * @param {number} specId 规格ID
   * @param {number} count 规格数量
   * @returns {Promise<void>} Promise<void>
   */
  updateCartSpecCount(goodsId: number, specId: number, count: number): Promise<void>;

  /**
   * 从购物车删除商品
   * @param {number} goodsId 商品ID
   * @returns {Promise<void>} Promise<void>
   */
  removeFromCart(goodsId: number): Promise<void>;

  /**
   * 从购物车删除商品规格
   * @param {number} goodsId 商品ID
   * @param {number} specId 规格ID
   * @returns {Promise<void>} Promise<void>
   */
  removeSpecFromCart(goodsId: number, specId: number): Promise<void>;

  /**
   * 清空购物车
   * @returns {Promise<void>} Promise<void>
   */
  clearCart(): Promise<void>;

  /**
   * 获取购物车中所有商品
   * @returns {Promise<Cart[]>} 购物车列表
   */
  getAllCarts(): Promise<Cart[]>;

  /**
   * 获取购物车商品总数量
   * @returns {Promise<number>} 商品总数
   */
  getCartCount(): Promise<number>;

  /**
   * 根据商品ID获取购物车商品
   * @param {number} goodsId 商品ID
   * @returns {Promise<Cart | undefined>} 匹配到的购物车商品
   */
  getCartByGoodsId(goodsId: number): Promise<Cart | undefined>;
}
