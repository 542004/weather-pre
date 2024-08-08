import {CityCardItemComponent} from '../view/CityCardItemComponent'
import {BackComponent} from '../view/BackComponent'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct CityMangerPage {
   readonly  cities: string[] =router.getParams() as string[];

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

      Row(){
        List(){
          ForEach(this.cities,(city:string)=>{
            CityCardItemComponent({city:city})
          })
        }
      }

    }
    .height('100%')
    .width('100%')
  }
}