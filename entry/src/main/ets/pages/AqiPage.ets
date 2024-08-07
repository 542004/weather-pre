import {BackComponent} from '../view/BackComponent'

@Entry
@Component
struct AqiPage {
  @State message: string = 'Aqi界面';

  build() {
    Column() {
      Row(){
        BackComponent()
      }
      .height('10%')
      .width('90%')
      .justifyContent(FlexAlign.Start)
    }
    .height('100%')
    .width('100%')
  }
}
