// 导入viewModel
import {WarningViewModel,WarningViewModelItem} from '../viewmodel/WarningViewModel'

// 导入bean
import {WarningWeatherResult,WarningWeatherResults} from '../bean/warningWeather/Results'

// 导入httpGet
import { HttpGetWarning } from '../util/HttpGetWarning'

//导入dal
import {weatherDataHelper} from '../dal/WeatherDataHelper'

//导入其他
import { hilog } from '@kit.PerformanceAnalysisKit'
import { router } from '@kit.ArkUI'


@Component
export struct WarningAreaComponent{
  @Prop city:string;
  //viewModel
  @State warningViewModel:WarningViewModel=new WarningViewModel()

  //文件名+results  array
  //内部model 文件名+model array[0]

  aboutToAppear(): void {    let httpGetWarning:HttpGetWarning=new HttpGetWarning()
    httpGetWarning.getHttp(this.city).then((res:WarningWeatherResults)=>{
      let item=res.results[0]
      this.warningViewModel=weatherDataHelper.getWarning(item)
    })
  }
  build() {
    Row(){
      if(this.warningViewModel.WarningViewModelItemArray.length)
      Row(){
        Swiper(){
          ForEach(this.warningViewModel.WarningViewModelItemArray,(item:WarningViewModelItem)=>{
            Column(){
              Row(){
                Text(item.title)
                  .fontColor(Color.White)
                  .fontSize($r('app.float.common_font_size'))
                  .fontWeight(FontWeight.Bold)
              }
              .layoutWeight(2)
              Row(){
                Text(item.pub_date)
                  .fontColor(Color.White)
                  .fontSize($r('app.float.common_font_size'))
                  .fontWeight(FontWeight.Regular)
              }
              .layoutWeight(1)
              Row(){
                Text(item.description)
                  .fontColor(Color.White)
                  .fontSize($r('app.float.common_font_size'))
                  .fontWeight(FontWeight.Normal)
                  .maxLines(2)
                  .textOverflow({overflow:TextOverflow.Ellipsis})
              }
              .layoutWeight(3)
              //
            }
            .margin($r('app.float.common_space_size'))
            .alignItems(HorizontalAlign.Start)
            .justifyContent(FlexAlign.Start)
          })
        }
        .loop(false)
      }
      // .opacity(1)
      .backgroundColor('#C0C0C0')
      .height('100%')
      .width('100%')
      .borderRadius(15)
      .onClick(()=>{
        router.pushUrl({
          url:"pages/WarningDetailPage",
          params:this.warningViewModel
        })
          .then(()=>{
              hilog.info(0x1111,'mytag','%{public}s','跳转预警详情页面成功')
          })
          .catch(()=>{
            hilog.info(0x1111,'mytag','%{public}s','跳转预警详情页面失败')
          })

      })
    }
    .height('90%')
    .width('90%')

  }
}