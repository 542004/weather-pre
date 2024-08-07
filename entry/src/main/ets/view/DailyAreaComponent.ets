// 导入viewModel
import {DailyDetailViewModel,DailyDetailViewModelArray} from '../viewmodel/DailyDetailViewModel'
import {DailyViewModel} from '../viewmodel/DailyViewModel'
// 导入bean

import {DailyWeatherResult,DailyWeatherResults,DailyItem} from '../bean/dailyWeather/Results'

//导入dal
import {weatherDataHelper} from '../dal/WeatherDataHelper'

//util
import { HttpGetDailyWeather } from '../util/HttpGetDailyWeather'
import { hilog } from '@kit.PerformanceAnalysisKit'

import { router } from '@kit.ArkUI';
import { text } from '@kit.ArkGraphics2D'

@Component
export struct DailyAreaComponent{//
  @Prop city:string;
  //viewModel
  @State dailyDetailViewModelArray:DailyDetailViewModel[]=[]//
  @State dailyViewModelArray:DailyViewModel[]=[]//
  @State item:DailyWeatherResult=new DailyWeatherResult()
  @State arr:Array<DailyItem>=[]
  @State a:DailyWeatherResult=new DailyWeatherResult()
  //文件名+results  array

  //内部model 文件名+model array[0]
  aboutToAppear(): void {
    let httpGetDailyWeather:HttpGetDailyWeather=new HttpGetDailyWeather()//
    httpGetDailyWeather.getHttp(this.city).then((res:DailyWeatherResults)=>{
       this.a=res.results[0]
      // this.arr=weatherDataHelper.getDailyDetail(a);
       // this.dailyDetailViewModelArray=weatherDataHelper.getDailyDetail(a) //15天的详细数据
      // this.dailyViewModelArray=weatherDataHelper.getDaily(a)
      hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather成功')
    })
      .catch(()=>{
        hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather失败')
      })
  }

  build() {
    Column(){
      Row(){
        Text(this.a?.daily?.length?.toString())
          .fontSize(40)
        ForEach(this.dailyViewModelArray,(item:DailyViewModel,index:number)=>{
          Row(){
            Text(item.week+'hahah')
            Text(item.weather)
            // Image()
            Text(item.tempHigh)
            Text(item.tempLow)
          }
        })
      }
      .layoutWeight(5)
      Row(){
        Text('查看近15日天气')
      }
      .margin($r('app.float.common_space_size'))
      .layoutWeight(2)
      .opacity(0.8)
    }
    .opacity(0.5)
    .margin($r('app.float.common_space_size'))
  }
}