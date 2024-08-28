// 导入viewModel
import {DailyDetailViewModel} from '../viewmodel/DailyDetailViewModel'
import {DailyViewModel} from '../viewmodel/DailyViewModel'
// 导入bean

import {DailyWeatherResult,DailyWeatherResults,DailyItem} from '../bean/dailyWeather/Results'

//导入dal
import {weatherDataHelper} from '../dal/WeatherDataHelper'

//util
import { HttpGetDailyWeather } from '../util/HttpGetDailyWeather'
import { hilog } from '@kit.PerformanceAnalysisKit'

import { ButtonOptions, router } from '@kit.ArkUI';

@Component
export struct DailyAreaComponent{//
  @Prop city:string;
  //viewModel
  @State dailyDetailViewModel_Array:DailyDetailViewModel[]=[]//
  @State dailyViewModel_Array:DailyViewModel[]=[]//

  //内部model 文件名+model array[0]
  aboutToAppear(): void {
    let httpGetDailyWeather:HttpGetDailyWeather=new HttpGetDailyWeather()//
    httpGetDailyWeather.getHttp(this.city).then((res:DailyWeatherResults)=>{
      let resItem=res.results[0]
      this.dailyDetailViewModel_Array=weatherDataHelper.getDailyDetail(resItem) //15天的详细数据
      this.dailyViewModel_Array=weatherDataHelper.getDaily(resItem)
      hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather成功')
    })
      .catch(()=>{
        hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather失败')
      })
  }

  build() {
    Column(){
      Row(){
        Column(){
          ForEach(this.dailyViewModel_Array,(item:DailyViewModel,index:number)=>{
            Row(){
              Text(item.week.slice(5))
                .fontColor(Color.White)
                .margin($r('app.float.small_space_size'))
              Text(item.weather)
                .fontColor(Color.White)
                .margin($r('app.float.small_space_size'))
              Image('picture/white/'+item.Img+'@1x.png')
                .width(20)
              Text(item.tempHigh+'°')
                .fontColor(Color.White)
                .margin($r('app.float.small_space_size'))
              Text(item.tempLow+'°')
                .fontColor(Color.White)
                .margin($r('app.float.small_space_size'))
            }
            .height('30%')
            .alignItems(VerticalAlign.Center)
            if(index<2){
              Divider()
            }
          })
        }
      }
      .width('90%')
      .height('70%')
      Row(){
        Button('查看近15日天气',{type:ButtonType.Normal})
          .fontColor(Color.White)
          .width(320)
          .height(40)
          .borderRadius(15)
          // .opacity(2)
          .onClick(()=>{
              router.pushUrl({
                url:"pages/DailyDetailPage",
                params:this.dailyDetailViewModel_Array
              })
          })
      }
      .width('90%')
      .height('30%')
      .opacity(0.8)
    }
    .height(160)
    .width('90%')
    .borderRadius(15)
    .backgroundColor(Color.Gray)
    // .opacity(0.5)
    .margin({bottom:10,left:18,right:18})
  }
}