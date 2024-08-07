import { http } from '@kit.NetworkKit';
import CommonConstants from '../common/CommonConstants';
import {DailyWeatherResults} from '../bean/dailyWeather/Results'//
import { hilog } from '@kit.PerformanceAnalysisKit'

export class HttpGetDailyWeather {//
  async getHttp(city: string): Promise<DailyWeatherResults> {//
    let httpRequest = http.createHttp();
    try {
      const response = await httpRequest.request(
        CommonConstants.DAILY_URL+city+'&language=zh-Hans&unit=c&start=0&days=15',//
        {
          method: http.RequestMethod.GET,
        }
      );
      hilog.info(0x1111,'mytag','%{public}s','获取DailyWeatherResults数据成功')//
      return JSON.parse(response.result.toString());
    } catch (err) {
      // 请求失败，处理错误
      hilog.info(0x1111,'mytag','%{public}s','获取DailyWeatherResults数据失败 '+ JSON.stringify(err))//
      // console.error("获取网络Hourily air data数据失败: " + JSON.stringify(err));
      throw new Error("获取网络DailyWeatherResults数据失败: " + err.message);//
    } finally {
      // 不论请求成功或失败，确保销毁请求
      httpRequest.destroy();
    }
  }
}

