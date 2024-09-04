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
         Image($r('app.media.location'))
           .width(20)
           .height(20)
          Text(CommonConstants.CURRENT_CITY)
            .fontColor(Color.Blue)
            .fontSize(24)
       }
       .height('10%')
       .width('90%')
       .justifyContent(FlexAlign.Center)
       .backgroundColor(CommonConstants.BACKGROUND)
       .borderRadius(15);

       Row(){
         Text('热门城市')
       }
       .width('90%')
       .justifyContent(FlexAlign.Start)

       Row(){
         Grid(){
           ForEach(CommonConstants.POPULAR_CITY,(item:string)=>{
             if(CommonConstants.CITIES.indexOf(item)===-1&&item!='西安'){
               GridItem(){
                 Button(item)
                   .onClick(()=>{
                     CommonConstants.CITIES.push(item)
                   })
                   .fontColor(Color.Black)
                   .backgroundColor(CommonConstants.BACKGROUND)
               }
               .borderRadius(8)
               .backgroundColor(CommonConstants.BACKGROUND)
             }
             else{
               GridItem(){
                 Button(item)
                   .fontColor(Color.Black)
                   .backgroundColor(Color.Blue)
               }
               .borderRadius(8)
               .backgroundColor(Color.Blue)
             }
           })
         }
         .columnsTemplate('1fr 1fr 1fr')
         .rowsTemplate('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr')
         .columnsGap(10)
         .rowsGap(10)

       }
       .height('55%')
     }
    }
    .height('100%')
    .width('100%')
  }
}