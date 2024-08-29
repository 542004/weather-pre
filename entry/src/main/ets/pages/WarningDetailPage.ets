// 导入viewModel
import {AirDetailViewModel} from '../viewmodel/AirDetailViewModel'
import {DailyDetailViewModel} from '../viewmodel/DailyDetailViewModel'
import {DailyViewModel} from '../viewmodel/DailyViewModel'
import {HourlyViewModel} from '../viewmodel/HourlyViewModel'
import {LiveCardsViewModel} from '../viewmodel/LiveCardsViewModel'
import {NowViewModel} from '../viewmodel/NowViewModel'
import {WarningViewModel,WarningViewModelItem} from '../viewmodel/WarningViewModel'
import {WeatherCardsViewModel} from '../viewmodel/WeatherCardsViewModel'
import {CityWeatherViewModel} from '../viewmodel/CityWeathersViewModel'

// 导入自定义组件
import {NowAreaComponent} from '../view/NowAreaComponent'
import {AqiAreaComponent} from '../view/AqiAreaComponent'
import {AddressAreaComponent} from  '../view/AddressAreaComponent'
import {CityAreaComponent} from '../view/CityAreaComponent'
import {WarningAreaComponent} from '../view/WarningAreaComponent'
import {BackComponent} from '../view/BackComponent'

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
import { router } from '@kit.ArkUI'


@Entry
@Component
struct Index {
  readonly  warningViewModel:WarningViewModel=router.getParams() as WarningViewModel
  build() {
    Column() {
      Row(){
        BackComponent()
      }
      .height('5%')
      .width('90%')
      .justifyContent(FlexAlign.Start)
      .margin({top:$r('app.float.small_space_size'),bottom:$r('app.float.small_space_size')})

      Row(){
        Text('预警详情')
          .fontSize($r('app.float.title_font_size'))
      }
      .height('5%')
      .width('90%')
      .justifyContent(FlexAlign.Start)
      //显示警告
      List(){
        ForEach(this.warningViewModel.WarningViewModelItemArray,(item:WarningViewModelItem)=>{
          ListItem(){
            Column(){
              Row(){
                Text(item.title).align(Alignment.TopStart).fontWeight(FontWeight.Bold)
              }
              .margin(5)
              Row(){
                Text(item.pub_date).align(Alignment.TopStart).fontWeight(FontWeight.Lighter)
              }
              .margin(5)
              Row(){
                Text(item.description)
              }
              .margin(5)
              .margin({bottom:20})
            }
          }
        })
      }
      .height('90%')
      .width('90%')
      .margin(20)
      .scrollBar(BarState.Off)
      // .justifyContent(FlexAlign.Start)
      // .alignItems(VerticalAlign.Top)
    }
    .height('100%')
    .width('100%')
  }
}