import {CityCardItemComponent} from '../view/CityCardItemComponent'
import {BackComponent} from '../view/BackComponent'
import { router } from '@kit.ArkUI'
import CommonConstants from '../common/CommonConstants';
@Entry
@Component
struct CityMangerPage {
  @Prop curCity:string='';
  @State cities: string[] =[];
  onPageShow(): void {
    this.curCity=router.getParams() as string
    // this.cities=[this.curCity];
    this.cities=[CommonConstants.CURRENT_CITY];//用CommonConstants.CURRENT_CIT可以，传参就不行
    for(let i=0;i<CommonConstants.CITIES.length;i++){
      this.cities.push(CommonConstants.CITIES[i])
    }
    console.info('CityMangerPage测试我的城市：'+JSON.stringify(this.cities)+' '+CommonConstants.CITIES)
  }

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


      //城市卡片
      RelativeContainer(){
        List({space:10}){
          ForEach(this.cities,(city:string,index:number)=>{
            ListItem(){
              CityCardItemComponent({city:city})
            }
            .swipeAction({end:this.DeleteButton(index)})
          })
        }
        .alignListItem(ListItemAlign.Start)

      }
      .height('80%')
      .width('90%')
      .alignRules({
        top:{anchor:'__container__',align:VerticalAlign.Top}
      })
      // .justifyContent(FlexAlign.Center)

    }
    .height('100%')
    .width('100%')


  }
  @Builder DeleteButton(index: number) {
    Button() {
      Image($r('app.media.delete'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(() => {
      this.cities.splice(index, 1)
      CommonConstants.CITIES.splice(index-1,1);
    })
  }
}