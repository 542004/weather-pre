// 导入viewModel
import {AirDetailViewModel} from '../viewmodel/AirDetailViewModel'
import {DailyDetailViewModel} from '../viewmodel/DailyDetailViewModel'
import {DailyViewModel} from '../viewmodel/DailyViewModel'
import {HourlyViewModel} from '../viewmodel/HourlyViewModel'
import {LiveCardsViewModel} from '../viewmodel/LiveCardsViewModel'
import {NowViewModel} from '../viewmodel/NowViewModel'
import {WarningViewModel} from '../viewmodel/WarningViewModel'
import {WeatherCardsViewModel} from '../viewmodel/WeatherCardsViewModel'
import {CityWeatherViewModel} from '../viewmodel/CityWeathersViewModel'

// 导入bean
import {HourlyAirResult,HourlyAirResults} from '../bean/hourlyAir/Results'
import {NowWeatherResult,NowWeatherResults} from '../bean/nowWeather/Results'
import {SimpleResults} from '../bean/simpleData/Results'

//导入dal
import {weatherDataHelper} from '../dal/WeatherDataHelper'

//util
import { HttpGetHourlyAir } from '../util/HttpGetHourlyAir'
import { hilog } from '@kit.PerformanceAnalysisKit'

import { router } from '@kit.ArkUI';

@Component
export struct AqiAreaComponent{
  @Prop city:string;
  //viewModel
  @State airDetailViewModel:AirDetailViewModel=new AirDetailViewModel()
  //文件名+results  array

  //内部model 文件名+model array[0]
  aboutToAppear(): void {
    let httpGetHourlyAir:HttpGetHourlyAir=new HttpGetHourlyAir()
    httpGetHourlyAir.getHttp(this.city).then((res:HourlyAirResults)=>{
      let item=res.results[0]
      this.airDetailViewModel=weatherDataHelper.getAqi(item)
    })
  }
  build() {
    Row(){
      Button(){
        Row(){
          // Image()
          Text(this.airDetailViewModel.quality)
            .fontSize($r('app.float.common_font_size'))
          Text(this.airDetailViewModel.aqi)
            .fontSize($r('app.float.common_font_size'))
        }
        .width('90%')
        .justifyContent(FlexAlign.SpaceAround)
      }
      .width('40%')
      .backgroundColor('#fff8f5ff')
      // .onClick(()=>{//跳转到详情页面
        // router.pushUrl({
        //   url:'pages/AqiPage'
        // })
      // })
    }
    .height('90%')
    .width('90%')
    .opacity(0.6)
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.Start)
  }
}