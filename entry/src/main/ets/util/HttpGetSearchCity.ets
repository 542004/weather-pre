import {searchCityResult,searchCityResults} from '../bean/searchCity/Results'
import {weatherDataHelper} from '../dal/WeatherDataHelper'
import CommonConstants from '../common/CommonConstants';
import { hilog } from '@kit.PerformanceAnalysisKit'
import { http } from '@kit.NetworkKit';

export class HttpGetSearchCity{
  async getHttp(city: string): Promise<searchCityResults> {
    let httpRequest = http.createHttp();
    try {
    const response = await httpRequest.request(
      CommonConstants.SEARCH_CITY+city,
      {
        method: http.RequestMethod.GET,
      }
    );
    hilog.info(0x1111,'20240901','%{public}s','获取HttpGetSearchCity数据成功'+JSON.parse(response.result.toString()))
    return JSON.parse(response.result.toString());
  } catch (err) {
    // 请求失败，处理错误
    hilog.info(0x1111,'20240901','%{public}s','获取HttpGetSearchCity数据失败 '+ JSON.stringify(err))
    // console.error("获取网络Hourily air data数据失败: " + JSON.stringify(err));
    throw new Error("获取网络HttpGetSearchCity数据失败: " + err.message);
  } finally {
    // 不论请求成功或失败，确保销毁请求
    httpRequest.destroy();
  }
  }
}