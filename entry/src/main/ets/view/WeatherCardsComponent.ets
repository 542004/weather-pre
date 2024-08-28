import {WeatherCardsViewModel} from '../viewmodel/WeatherCardsViewModel';

import { HttpGetDailyWeather} from '../util/HttpGetDailyWeather'
import { HttpGetNowWeather } from '../util/HttpGetNowWeather'

import {NowWeatherResult,NowWeatherResults} from '../bean/nowWeather/Results'
import {DailyWeatherResults,DailyWeatherResult} from '../bean/dailyWeather/Results'

import {weatherDataHelper} from '../dal/WeatherDataHelper'

import { hilog } from '@kit.PerformanceAnalysisKit'

@Component
export
struct WeatherCardsComponent{
  @Prop city:string
  @State weatherCardsViewModel:WeatherCardsViewModel=new WeatherCardsViewModel()
  // @State nowWeatherModel:NowWeatherResult=new NowWeatherResult()
  // @State dailyViewModel:DailyViewModel=new DailyViewModel()
  aboutToAppear(): void {
    //httpGetNowWeather
    let httpGetNowWeather:HttpGetNowWeather=new HttpGetNowWeather()
    httpGetNowWeather.getHttp(this.city).then((res:NowWeatherResults)=>{
      let item=res.results[0]
      this.weatherCardsViewModel=weatherDataHelper.getWeatherCards(item);
      console.info("0828   "+JSON.stringify(item))
      console.info("0828   "+JSON.stringify(this.weatherCardsViewModel))
    })

    // let httpGetDailyWeather:HttpGetDailyWeather=new HttpGetDailyWeather()//
    // httpGetDailyWeather.getHttp(this.city).then((res:DailyWeatherResults)=>{
    //   let resItem=res.results[0]
    //   this.dailyViewModel=weatherDataHelper.getDaily(resItem)[0]
    //   this.nowViewModel.weather=this.dailyViewModel.weather
    //   this.nowViewModel.tempHigh=this.dailyViewModel.tempHigh
    //   this.nowViewModel.tempLow=this.dailyViewModel.tempLow
    //   hilog.debug(0x1111,'mytag11','%{public}s','实况区域的aboutToAppear处获取DailyWeather成功'+JSON.stringify(this.dailyViewModel))
    // })
    //   .catch(()=>{
    //     hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather失败')
    //   })
  }

  build() {
    Grid(){
      GridItem(){Text(this.weatherCardsViewModel.uv)}
      .height(65)
      .width('90%')
      .borderRadius(15)
      .backgroundColor(Color.Gray)
      .margin({bottom:5,left:18,right:9})
      GridItem(){Text(this.weatherCardsViewModel.humidity)}
      .height(65)
      .width('90%')
      .borderRadius(15)
      .backgroundColor(Color.Gray)
      .margin({bottom:5,left:9,right:18})
      GridItem(){Text(this.weatherCardsViewModel.feels_like)}
      .height(65)
      .width('90%')
      .borderRadius(15)
      .backgroundColor(Color.Gray)
      .margin({bottom:5,left:18,right:9})
      GridItem(){Text(this.weatherCardsViewModel.wind_direction+'  '+this.weatherCardsViewModel.wind_speed)}
      .height(65)
      .width('90%')
      .borderRadius(15)
      .backgroundColor(Color.Gray)
      .margin({bottom:5,left:9,right:18})
      GridItem(){Text(this.weatherCardsViewModel.sunrise+'  '+this.weatherCardsViewModel.sunset)}
      .height(65)
      .width('90%')
      .borderRadius(15)
      .backgroundColor(Color.Gray)
      .margin({bottom:5,left:18,right:9})
      GridItem(){Text(this.weatherCardsViewModel.pressure)}
      .height(65)
      .width('90%')
      .borderRadius(15)
      .backgroundColor(Color.Gray)
      .margin({bottom:5,left:9,right:18})
    }
    .rowsTemplate('1fr 1fr 1fr')
    .columnsTemplate('1fr  1fr')
    .height(210)
    // .width('90%')
    // .borderRadius(15)
    // .backgroundColor(Color.Gray)
    // .margin({bottom:10,left:18,right:18})
  }

}
