import { http } from '@kit.NetworkKit';
import CommonConstants from '../common/CommonConstants';
import {WarningWeatherResults} from '../bean/warningWeather/Results'
import { hilog } from '@kit.PerformanceAnalysisKit'

export class HttpGetWarning {
  async getHttp(city: string): Promise<WarningWeatherResults> {
    let httpRequest = http.createHttp();
    try {
      const response = await httpRequest.request(
        CommonConstants.WARNING_URL+city+'&detail=more',
        {
          method: http.RequestMethod.GET,
        }
      );
      hilog.info(0x1111,'mytag','%{public}s','获取WarningWeatherResults数据成功')
      return JSON.parse(response.result.toString());
    } catch (err) {
      // 请求失败，处理错误
      hilog.info(0x1111,'mytag','%{public}s','获取WarningWeatherResults数据失败'+JSON.stringify(err))
      // console.error("获取网络WarningWeatherResults数据失败: " + JSON.stringify(err));
      throw new Error("获取网络WarningWeatherResults数据失败: " + err.message);
    } finally {
      // 不论请求成功或失败，确保销毁请求
      httpRequest.destroy();
    }
  }
}

