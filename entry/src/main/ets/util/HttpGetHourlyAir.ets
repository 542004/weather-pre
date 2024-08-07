import { http } from '@kit.NetworkKit';
import CommonConstants from '../common/CommonConstants';
import {HourlyAirResults} from '../bean/hourlyAir/Results'
import { hilog } from '@kit.PerformanceAnalysisKit'

export class HttpGetHourlyAir {
  async getHttp(city: string): Promise<HourlyAirResults> {
    let httpRequest = http.createHttp();
    try {
      const response = await httpRequest.request(
        CommonConstants.HOURLY_AIR_URL+city,
        {
          method: http.RequestMethod.GET,
        }
      );
      hilog.info(0x1111,'mytag','%{public}s','获取HourlyAirResults数据成功')
      return JSON.parse(response.result.toString());
    } catch (err) {
      // 请求失败，处理错误
      hilog.info(0x1111,'mytag','%{public}s','获取HourlyAirResults数据失败 '+ JSON.stringify(err))
      // console.error("获取网络Hourily air data数据失败: " + JSON.stringify(err));
      throw new Error("获取网络Hourily air data数据失败: " + err.message);
    } finally {
      // 不论请求成功或失败，确保销毁请求
      httpRequest.destroy();
    }
  }
}

