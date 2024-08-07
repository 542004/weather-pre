import { http } from '@kit.NetworkKit';
import CommonConstants from '../common/CommonConstants';
import {NowWeatherResults} from '../bean/nowWeather/Results'
import { BusinessError } from '@ohos.base';
import { hilog } from '@kit.PerformanceAnalysisKit'

export class HttpGetNowWeather {
  async getHttp(city: string): Promise<NowWeatherResults> {
    let httpRequest = http.createHttp();

    try {
      const response = await httpRequest.request(
        CommonConstants.NOW_URL+'&location='+city+'&language=zh-Hans&unit=c',
        {
          method: http.RequestMethod.GET,
        }
      );
      hilog.info(0x1111,'mytag','%{public}s','获取NowWeatherResults数据成功')
      return JSON.parse(response.result.toString());
    } catch (err) {
      // 请求失败，处理错误
      hilog.info(0x1111,'mytag','%{public}s','获取NowWeatherResults数据失败'+JSON.stringify(err))
      // console.error("获取网络数据失败: " + JSON.stringify(err));
      throw new Error("获取网络数据失败: " + err.message);
    } finally {
      // 不论请求成功或失败，确保销毁请求
      httpRequest.destroy();
    }
  }
}

