import { router } from '@kit.ArkUI';
import CommonConstants from '../common/CommonConstants';
import {SearchCItyComponent} from '../view/SearchCityComponent'

@Entry
@Component
struct SearchPage {
  @State city:string=''
  build() {
    Column({space:5}){
      //搜索部分
      Row(){
        Column(){
          Search()
            .onSubmit((city:string)=>{
                this.city=city;
            })
            .onChange(()=>{
              this.city=''
            })
            .searchButton('搜索')
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
      //下面
     if(this.city!=''){
       SearchCItyComponent({city:this.city})
     }
     else{
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
    }
    .height('100%')
    .width('100%')
  }
}