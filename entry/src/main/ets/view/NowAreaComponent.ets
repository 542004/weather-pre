import {NowViewModel} from '../viewmodel/NowViewModel';
import { HttpGetSimpleWeather } from '../util/HttpGetSimpleWeather'
import { HttpGetNowWeather } from '../util/HttpGetNowWeather'

import {NowWeatherResult,NowWeatherResults} from '../bean/nowWeather/Results'
import {SimpleResults} from '../bean/simpleData/Results'

import {weatherDataHelper} from '../dal/WeatherDataHelper'

import { hilog } from '@kit.PerformanceAnalysisKit'

@Component
export
struct NowAreaComponent{
  @Prop city:string
  @State nowViewModel:NowViewModel=new NowViewModel()
  @State nowWeatherModel:NowWeatherResult=new NowWeatherResult()
  aboutToAppear(): void {
    //httpGetNowWeather
    let httpGetNowWeather:HttpGetNowWeather=new HttpGetNowWeather()
    httpGetNowWeather.getHttp(this.city).then((res:NowWeatherResults)=>{
      // this.nowWeatherResults = res
      this.nowWeatherModel =res.results[0]
    })
    //NowArea的数据 Simple
    let httpGetSimpleWeather:HttpGetSimpleWeather=new HttpGetSimpleWeather()
    httpGetSimpleWeather.getHttp('%E6%8B%89%E8%90%A8').then((res:SimpleResults)=>{
      // this.simpleModel=res
      this.nowViewModel=weatherDataHelper.getNow(res,this.nowWeatherModel)
      hilog.info(0x1111,'mytag','%{public}s',JSON.stringify(this.nowViewModel))
    })
  }
  build() {
    Column(){
      Row(){
        Text(this.nowViewModel.temp)
          .fontSize($r('app.float.large_font_size'))
      }
      .layoutWeight(3)
      .width('90%')
      .justifyContent(FlexAlign.Start)

      Row(){
        Column(){
          Text(this.nowViewModel.weather)
            .fontSize($r('app.float.medium_font_size'))
        }
        .margin({right:$r('app.float.common_space_size')})
        Column(){
          Text('最高'+this.nowViewModel.tempHigh)
            .fontSize($r('app.float.medium_font_size'))
        }
        .margin({right:$r('app.float.small_space_size')})
        Column(){
          Text('最低'+this.nowViewModel.tempLow)
            .fontSize($r('app.float.medium_font_size'))
        }
      }
      .layoutWeight(1)
      .width('90%')
      .justifyContent(FlexAlign.Start)
    }
  }
}
