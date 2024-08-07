
import {BackComponent} from '../view/BackComponent'
@Entry
@Component
struct CityMangerPage {
  @State message: string = '城市管理页面';

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
        Text('城市管理')
          .fontSize($r('app.float.title_font_size'))
      }
      .height('5%')
      .width('90%')
      .justifyContent(FlexAlign.Start)

    }
    .height('100%')
    .width('100%')
  }
}