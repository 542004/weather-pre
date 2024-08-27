import {CityCardItemComponent} from '../view/CityCardItemComponent'
import {BackComponent} from '../view/BackComponent'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct CityMangerPage {
   readonly  cities: string[] =router.getParams() as string[];

  build() {
    Column() {
      //返回首页
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
      .margin({bottom:$r('app.float.small_space_size')})

      Row(){
        Search({placeholder:'搜索位置'})
          .onClick(()=>{
            router.pushUrl({
              url:'pages/SearchPage'
            })
          })
      }
      .height('5%')
      .width('90%')
      .justifyContent(FlexAlign.Center)
      .margin({bottom:$r('app.float.small_space_size')})



      Row(){
        List(){
          ForEach(this.cities,(city:string)=>{
            CityCardItemComponent({city:city})

          })
        }
      }
      .height('80%')
      .width('90%')
      .justifyContent(FlexAlign.Center)

    }
    .height('100%')
    .width('100%')
  }
}