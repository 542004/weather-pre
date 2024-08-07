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
  @State dailyDetailViewModel_Array:DailyDetailViewModel[]=[]//
  @State dailyViewModel_Array:DailyViewModel[]=[]//
  // @State item:DailyWeatherResult=new DailyWeatherResult()
  // @State arr:Array<DailyItem>=[]
  // @State resItem:DailyWeatherResult=new DailyWeatherResult()
  //文件名+results  array

  //内部model 文件名+model array[0]
  aboutToAppear(): void {
    let httpGetDailyWeather:HttpGetDailyWeather=new HttpGetDailyWeather()//
    httpGetDailyWeather.getHttp(this.city).then((res:DailyWeatherResults)=>{
      let resItem=res.results[0]
      // hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeath成功'+JSON.stringify(resItem))
      // this.arr=this.resItem.daily
      // this.array=this.arr.dailyItemArray
      // this.arr=weatherDataHelper.getDailyDetail(a);
      //  this.dailyDetailViewModelArray=weatherDataHelper.getDailyDetail(a) //15天的详细数据

      this.dailyViewModel_Array=weatherDataHelper.getDaily(resItem)
      hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather成功'+JSON.stringify(this.dailyViewModel_Array))
    })
      .catch(()=>{
        hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather失败')
      })
  }

  build() {
    Column(){
      Row(){
        Column(){
          // Text(this.a?.daily?.length?.toString())
          //   .fontSize(40)
          ForEach(this.dailyViewModel_Array,(item:DailyViewModel,index:number)=>{
            Row(){
              Text(item.week)
                .margin($r('app.float.small_space_size'))
              Text(item.weather)
                .margin($r('app.float.small_space_size'))
              // Image()
              Text(item.tempHigh)
                .margin($r('app.float.small_space_size'))
              Text(item.tempLow)
                .margin($r('app.float.small_space_size'))
            }
            // .width('100%')
            // .height('100%')
            // .justifyContent(FlexAlign.SpaceBetween)
            // if(index<2){
            //   Divider();
            // }
          })
        }
      }
      .height('70%')
      Row(){
        Text('查看近15日天气')
      }
      // .margin($r('app.float.common_space_size'))
      .height('30%')
      .opacity(0.8)
    }
    // .backgroundColor(Color.Orange)
    .width('90%')
    .height('100%')
    .opacity(0.5)
    .margin($r('app.float.common_space_size'))
  }
}