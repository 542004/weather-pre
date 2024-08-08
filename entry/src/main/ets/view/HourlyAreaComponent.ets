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

@Component
export struct HourlyAreaComponent{
  @Prop city:string
  @State hourlyViewModel_Array:HourlyViewModel[]=[]
  aboutToAppear(): void {
    let httpGetHourlyWeather:HttpGetHourlyWeather=new HttpGetHourlyWeather()
    httpGetHourlyWeather.getHttp(this.city).then((res:HourlyWeatherResults)=>{
      let resItem=res.results[0];
      this.hourlyViewModel_Array=weatherDataHelper.getHourly(resItem)
      hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取resItem成功11')
      hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取hourlyViewModel成功11')
    })
      .catch(()=>{
        hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取hourlyViewModel失败')
      })
  }
  build() {
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
    .width('90%')
    .width('90%')
    .backgroundColor(Color.White)
    .borderRadius(15)
  }
}
