import {BackComponent} from '../view/BackComponent'
import {DailyDetailViewModel} from '../viewmodel/DailyDetailViewModel'
import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit'
@Entry
@Component
struct DailyDetailPage {
  @State title: string = '15天趋势预报';
  readonly dailyDeyailViewModel_Array:DailyDetailViewModel[]=router.getParams() as DailyDetailViewModel[]
  build() {
    Column() {
      Row(){
        BackComponent()
      }
      .height('8%')
      .width('90%')
      .justifyContent(FlexAlign.Start)
      Row(){
        Text(this.title)
          .fontSize($r('app.float.title_font_size'))
      }
      .height('12%')
      .width('90%')
      .justifyContent(FlexAlign.Start)
      Row(){
        List(){
          ForEach(this.dailyDeyailViewModel_Array,(item:DailyDetailViewModel)=>{
            ListItem(){
              Column(){
                Text(item.week.slice(5))
                Image('picture/white/'+item.dayImg.toString()+'@1x.png')
                  .width(20)
                Text(item.text_day)
                Text(item.tempHigh)
                Blank()
                  .height(40)
                Text(item.tempLow)
                Image('picture/white/'+item.nightImg.toString()+'@1x.png')
                  .width(20)
                Text(item.text_night)
                Text(item.windSpeed)
                Text(item.quality)
              }
              .width('20%')
              .height('90%')
              .justifyContent(FlexAlign.SpaceAround)
            }
          })
        }
        .listDirection(Axis.Horizontal)
      }
      .height('80%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .alignItems(VerticalAlign.Center)
      .backgroundColor(Color.Green)
    }
    .height('85%')
    .width('100%')
    .justifyContent(FlexAlign.Start)
  }
}