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
import {HourlyAreaComponent} from '../view/HourlyAreaComponent'
import {LiveIndexComponent} from '../view/LiveIndexComponent'
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
import { router } from '@kit.ArkUI'
import {HttpGetCurrentCity} from '../util/HttpGetCurrentCity'
import CommonConstants from '../common/CommonConstants';
/**
 * fixdaily分支
 */
@Entry
@Component
struct Index {
  //viewModel
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
  @State cities:string[]=[]
  @State listHeight: number = 360;
  private yStart: number = 0;
  aboutToAppear() {
    let httpGetCurrentCity:HttpGetCurrentCity=new HttpGetCurrentCity()
    httpGetCurrentCity.getHttp('').then((res:SimpleResults)=>{
      this.cities.push(res.city)
    })
      .catch(()=>{
        console.info('获取当前位置失败')
      })

  }
  build() {
    Swiper(){
      ForEach(this.cities,(city:string)=>{
        Stack({ alignContent: Alignment.TopStart }){

          RelativeContainer(){
            Column(){
              //城市管理的添加
              Row(){
                CityAreaComponent({cities:this.cities})
              }.height('5%')
              //定位
              Row(){
                AddressAreaComponent({city:city})
              }.height('5%').margin({bottom:$r('app.float.small_space_size')})

              //当前信息
              Row(){
                NowAreaComponent({city:city})
              }.height('25%')

              Row(){
                AqiAreaComponent({city:city})
              }.height('3%')
            }
            .height('100%')
            .width('100%')
            List(){
              //预警
              ListItem(){
                WarningAreaComponent({city:city})
              }
              //每天信息
              ListItem(){
                DailyAreaComponent({city:city})
              }

              //每小时信息
              ListItem(){
                HourlyAreaComponent({city:city})
                // .backgroundColor((Color.Red))
              }

              //降雨预报
              ListItem(){

              }
              //六张卡片
              ListItem(){
                // HourlyAreaComponent({city:city})
                // // .backgroundColor((Color.Red))
              }
              // .backgroundColor(Color.Green)
              //六张卡片
              ListItem(){
                LiveIndexComponent({city:city})
              }
              // .backgroundColor(Color.Yellow)

            }
            .backgroundColor('#B0E0E6')
            .height(this.listHeight)
            .alignRules(CommonConstants.LIST_ALIGN_RULES)
            .scrollBar(BarState.Off)
            .animation({
              duration: 500,
              curve: Curve.Friction,
              iterations: 1,
              playMode: PlayMode.Normal
            })
          }
        }
        .height('100%')
        .width('100%')
        .onTouch((event:TouchEvent)=>{
          if(event.type===TouchType.Down){
            this.yStart=event.touches[0].y;
          }
          else if(event.type===TouchType.Up){
            const yEnd=event.touches[0].y;
            if(yEnd<this.yStart) this.listHeight=720;
            else if(yEnd>this.yStart) this.listHeight=Math.max(360,this.listHeight-yEnd+this.yStart);
          }
          else if(event.type===TouchType.Move){
            const yEnd=event.touches[0].y;
            if(yEnd<this.yStart) this.listHeight=Math.min(720,this.listHeight+this.yStart-yEnd);
            else if(yEnd>this.yStart) this.listHeight=Math.max(360,this.listHeight-yEnd+this.yStart);
          }
        })
        // .backgroundColor('#33cccc')
      })
    }
    .backgroundColor('#B0E0E6')
    .height('100%')
    .width('100%')
    .loop(false)
  }
}