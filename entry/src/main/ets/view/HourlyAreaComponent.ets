import {HourlyItemComponent} from './HourlyItemComponent'
// 导入viewModel
import {HourlyViewModel} from '../viewmodel/HourlyViewModel'
// 导入bean

import {HourlyWeatherResult,HourlyWeatherResults} from '../bean/hourlyWeather/Results'

//导入dal
import {weatherDataHelper} from '../dal/WeatherDataHelper'

//util
import { HttpGetHourlyWeather } from '../util/HttpGetHourlyWeather'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { ButtonOptions, router } from '@kit.ArkUI';

import CommonConstants from '../common/CommonConstants';
@Component
export struct HourlyAreaComponent{
  @Prop city:string
  @State hourlyViewModel_Array:HourlyViewModel[]=[]
  @State fg:number=0;
  aboutToAppear(): void {
    let httpGetHourlyWeather:HttpGetHourlyWeather=new HttpGetHourlyWeather()
    httpGetHourlyWeather.getHttp(this.city).then((res:HourlyWeatherResults)=>{
      let resItem=res.results[0];
      this.hourlyViewModel_Array=weatherDataHelper.getHourly(resItem)
      hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取resItem成功11')
      hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取hourlyViewModel成功11')
        let a=this.hourlyViewModel_Array[0].text,b=this.hourlyViewModel_Array[1].text,c=this.hourlyViewModel_Array[2].text;

        for(let i=0;i<b.length;i++) if(b[i]==='雨') this.fg=1;
        for(let i=0;i<c.length;i++) if(c[i]==='雨') this.fg=1;
        for(let i=0;i<a.length;i++) if(a[i]==='雨')  this.fg=2;
    })
      .catch(()=>{
        hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取hourlyViewModel失败')
      })
  }
  build() {
    Column(){
      //每小时降水
      Row(){
        List(){
          ForEach(this.hourlyViewModel_Array,(item:HourlyViewModel,index:number)=>{
            ListItem(){
              HourlyItemComponent({hourlyViewModel:item,index:index})
            }
          })
        }
        .listDirection(Axis.Horizontal)
      }
      .height(180)
      .width('90%')
      .backgroundColor(CommonConstants.BACKGROUND)
      // .opacity(0.8)
      .borderRadius(15)
      .margin({bottom:10,left:18,right:18})
      //降水预报
      Row(){
        RelativeContainer(){
          Row(){Text('降水预报').fontWeight(FontWeight.Normal)}
          .id('降水预报')
          .alignRules({
            top:{anchor:'__container__',align:VerticalAlign.Top},
            left:{anchor:'__container__',align:HorizontalAlign.Start}
          })
          .offset({
            x:20,
            y:20
          })

          Row(){
            if(this.fg===1){
              Text('2小时内有降雨')
              .fontWeight(FontWeight.Medium)
                .fontSize(22)
            }
            else if(this.fg===0){
              Text('2小时内无降雨')
              .fontWeight(FontWeight.Medium)
                .fontSize(22)
            }
            else if(this.fg===2){
              Text('附近正在下雨')
                .fontWeight(FontWeight.Medium)
                .fontSize(22)
            }
          }
          .id('预测')
          .alignRules({
            top:{anchor:'降水预报',align:VerticalAlign.Bottom},
            left:{anchor:'__container__',align:HorizontalAlign.Start}
          })
          .offset({
            x:20,
            y:24
          })

          Row(){Text('放心出行吧').fontWeight(FontWeight.Lighter).fontSize(16)}
          .id('出行')
          .alignRules({
            bottom:{anchor:'__container__',align:VerticalAlign.Bottom},
            left:{anchor:'__container__',align:HorizontalAlign.Start}
          })
          .offset({
            x:20,
            y:-20
          })


          Row(){Image('picture/jiangyu.jpg').height(110).height(110).borderRadius(10)}
          .id('地图')
          .alignRules({
            bottom:{anchor:'__container__',align:VerticalAlign.Bottom},
            right:{anchor:'__container__',align:HorizontalAlign.End}
          })
          .offset({
            x:-20,
            y:-25
          })
        }
      }
      .height(150)
      .width('90%')
      .backgroundColor(CommonConstants.BACKGROUND)
      // .opacity(0.8)
      .borderRadius(15)
      .margin({bottom:10,left:18,right:18})
    }

  }

}
