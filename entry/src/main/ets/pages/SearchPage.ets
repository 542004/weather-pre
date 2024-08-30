import { router } from '@kit.ArkUI';
import CommonConstants from '../common/CommonConstants';
@Entry
@Component
struct SearchPage {

  build() {
    Column({space:5}){
      Row(){
        Column(){
          Search();
        }
        .width('70%')
        Column(){
          Text('取消')
            .fontColor(Color.Blue)
            .onClick(()=>{
              router.back();
            })
        }
        .width('20%')
      }
      .width('90%')
      // .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.SpaceBetween)

      Row(){
        Text('当前定位')
      }
      .width('90%')
      .justifyContent(FlexAlign.Start)

      Row(){

      }
      .height('10%')

      Row(){
        Text('热门城市')
      }
      .width('90%')
      .justifyContent(FlexAlign.Start)


      Row(){
        Button('北京')
          .onClick(()=>{
            CommonConstants.CITIES.push('北京')
          })
        Button('南昌')
          .onClick(()=>{
            CommonConstants.CITIES.push('南昌')
          })
      }
      .height('55%')
    }
    .height('100%')
    .width('100%')
  }
}