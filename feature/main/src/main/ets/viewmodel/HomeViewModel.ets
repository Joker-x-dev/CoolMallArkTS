import { BaseNetWorkListUiState, BaseNetWorkListViewModel } from "base";
import { GoodsRepository, PageRepository } from "data";
import { Goods, GoodsSearchRequest, Home, NetworkPageData, NetworkResponse } from "model";
import { RequestHelper } from "result";

/**
 * @file 首页 ViewModel
 * @author Joker.X
 */
@ObservedV2
export default class HomeViewModel extends BaseNetWorkListViewModel<Goods> {
  /**
   * 商品仓库
   */
  private goodsRepository: GoodsRepository = new GoodsRepository();
  /**
   * 页面数据仓库
   */
  private pageRepository: PageRepository = new PageRepository();
  /**
   * 首页页面数据
   */
  @Trace
  pageData: Home = new Home();

  /**
   * 重写请求列表数据方法来实现全部商品分页
   *
   * @return 商品分页数据流
   */
  protected requestListData(): Promise<NetworkResponse<NetworkPageData<Goods>>> {
    const request = new GoodsSearchRequest();
    request.page = this.currentPage;
    request.size = this.pageSize;
    return this.goodsRepository.getGoodsPage(request);
  }

  /**
   * 页面出现时初始化页面数据
   * @returns {void} 无返回值
   */
  aboutToAppear(): void {
    this.loadHomeData();
  }

  /**
   * 加载首页数据
   * @returns {void} 无返回值
   */
  loadHomeData(): void {
    RequestHelper.repository<Home>(this.pageRepository.getHomeData())
      .toast(false)
      .execute()
      .then((data: Home): void => {
        const homeData: Home = new Home(data);
        this.pageData = new Home(data);
        this.listData = homeData.goods ?? [];
        this.uiState = BaseNetWorkListUiState.SUCCESS;
      })
      .catch((): void => {
        this.uiState = BaseNetWorkListUiState.ERROR;
      });
  }

  /**
   * 触发下拉刷新
   * @returns {void} 无返回值
   */
  onRefresh(): void {
    if (this.isLoading) {
      return;
    }

    this.currentPage = 1;
    this.loadHomeData();
  }
}
