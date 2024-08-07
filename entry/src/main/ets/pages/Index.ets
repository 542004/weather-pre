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

// 导入自定义组件
import {NowAreaComponent} from '../view/NowAreaComponent'
import {AqiAreaComponent} from '../view/AqiAreaComponent'
import {AddressAreaComponent} from  '../view/AddressAreaComponent'
import {CityAreaComponent} from '../view/CityAreaComponent'
import {WarningAreaComponent} from '../view/WarningAreaComponent'

// 导入bean
import {HourlyAirResult,HourlyAirResults} from '../bean/hourlyAir/Results'
import {NowWeatherResult,NowWeatherResults} from '../bean/nowWeather/Results'
import {WarningWeatherResult,WarningWeatherResults} from '../bean/warningWeather/Results'
import {SimpleResults} from '../bean/simpleData/Results'

// 导入httpGet
import { HttpGetSimpleWeather } from '../util/HttpGetSimpleWeather'
import { HttpGetNowWeather } from '../util/HttpGetNowWeather'

//导入dal
import {weatherDataHelper} from '../dal/WeatherDataHelper'

//导入其他
import { hilog } from '@kit.PerformanceAnalysisKit'
import { DailyAreaComponent } from '../view/DailyAreaComponent'
/**
 * Geo分支
 */

@Entry
@Component
struct Index {
  // @State nowViewModel:NowViewModel=new NowViewModel()
  // @State nowWeatherResult:NowWeatherResult=new NowWeatherResult()
  // @State citiesWeatherViewModel:Array<CityWeatherViewModel>=[]
  // //文件名+results
  // @State hourlyAirResults:HourlyAirResults=new HourlyAirResults()
  // @State nowWeatherResults:NowWeatherResults=new NowWeatherResults()
  // @State simpleResults:SimpleResults=new SimpleResults()
  //内部model 文件名+model array[0]
  // @State hourlyAirModel:HourlyAirResult=new HourlyAirResult()
  // @State nowWeatherModel:NowWeatherResult=new NowWeatherResult()
  // @State simpleModel:SimpleResults=new SimpleResults()
  //city
  @State cities:string[]=['南昌','西安']

  aboutToAppear() {

  }
  build() {
    Swiper(){
      ForEach(this.cities,(city:string)=>{
        Column(){
          //城市管理的添加
          Row(){
            CityAreaComponent()
          }.height('5%')
          //定位
          Row(){
            AddressAreaComponent({city:city})
          }.height('5%').margin({bottom:$r('app.float.small_space_size')})

          //当前信息
          Row(){
            NowAreaComponent({city:city})
          }.height('25%')

          //aqi信息
          Row(){
            AqiAreaComponent({city:city})
          }.height('3%')

          //预警
          Row(){
            WarningAreaComponent({city:city})
          }.height('17%')
          //每天信息
          Row(){
            // DailyAreaComponent({city:city})
          }.height('20%')

          //每小时信息
          Row(){

          }.height('25%')
        }
        .height('100%')
        .width('100%')
        // .backgroundColor('#33cccc')
      })
    }
    .backgroundColor('#B0E0E6')
    .height('100%')
    .width('100%')
    .loop(false)
  }
}