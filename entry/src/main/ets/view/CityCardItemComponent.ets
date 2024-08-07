import {NowViewModel} from '../viewmodel/NowViewModel';
import {DailyViewModel} from '../viewmodel/DailyViewModel';

import { HttpGetDailyWeather} from '../util/HttpGetDailyWeather'
import { HttpGetNowWeather } from '../util/HttpGetNowWeather'

import {NowWeatherResult,NowWeatherResults} from '../bean/nowWeather/Results'
import {DailyWeatherResults,DailyWeatherResult} from '../bean/dailyWeather/Results'

import {weatherDataHelper} from '../dal/WeatherDataHelper'

import { hilog } from '@kit.PerformanceAnalysisKit'


@Component
export struct CityCardItemComponent{
  @Prop city:string

  @State nowWeatherModel:NowWeatherResult=new NowWeatherResult()
  @State dailyViewModel:DailyViewModel=new DailyViewModel()
  @State resItem:DailyWeatherResult=new DailyWeatherResult()
/**
 * 获取now_View_Model
 */
  @State nowViewModel:NowViewModel=new NowViewModel()
  aboutToAppear(): void {
    //httpGetNowWeather
    let httpGetNowWeather:HttpGetNowWeather=new HttpGetNowWeather()
    httpGetNowWeather.getHttp(this.city).then((res:NowWeatherResults)=>{
      this.nowWeatherModel =res.results[0]
      this.nowViewModel.temp=this.nowWeatherModel.now.temperature
    })

    let httpGetDailyWeather:HttpGetDailyWeather=new HttpGetDailyWeather()//
    httpGetDailyWeather.getHttp(this.city).then((res:DailyWeatherResults)=>{
      this.resItem=res.results[0]
      this.dailyViewModel=weatherDataHelper.getDaily(this.resItem)[0]
      this.nowViewModel.weather=this.dailyViewModel.weather
      this.nowViewModel.tempHigh=this.dailyViewModel.tempHigh
      this.nowViewModel.tempLow=this.dailyViewModel.tempLow
      hilog.debug(0x1111,'mytag11','%{public}s','实况区域的aboutToAppear处获取DailyWeather成功'+JSON.stringify(this.dailyViewModel))
    })
      .catch(()=>{
        hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather失败')
      })
  }

  build() {
    Row(){
      Column(){
        Row(){
          Text(this.resItem.location.name+'kkkkkkk')
            .fontSize($r('app.float.common_font_size'))
            .fontColor(Color.White)
        }
        Row(){
          Text(this.nowViewModel.weather)
            .fontSize($r('app.float.common_font_size'))
            .fontColor(Color.White)
          Text(this.nowViewModel.tempHigh)
            .fontSize($r('app.float.common_font_size'))
            .fontColor(Color.White)
          Text(this.nowViewModel.tempLow)
            .fontSize($r('app.float.common_font_size'))
            .fontColor(Color.White)
        }
      }
      Column(){
        Text(this.nowViewModel.temp)
          .fontSize($r('app.float.title_font_size'))
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
      }
    }
    .height('12.5%')
    .width('90%')
    .backgroundColor(Color.Brown)
    .justifyContent(FlexAlign.SpaceBetween)
    .onClick(()=>{

    })
  }
}