
// 导入viewModel
import {SearchCityViewModel} from '../viewmodel/SearchCityViewModel'
// 导入bean

import {searchCityResult,searchCityResults} from '../bean/searchCity/Results'

//导入dal
import {weatherDataHelper} from '../dal/WeatherDataHelper'

//util
import { HttpGetSearchCity} from '../util/HttpGetSearchCity'
import { hilog } from '@kit.PerformanceAnalysisKit'

import {router } from '@kit.ArkUI';

import CommonConstants from '../common/CommonConstants';

@Component
export struct SearchCItyComponent{//
  @Prop city:string
  //viewModel
  @State searchCityViewModel_Array:SearchCityViewModel[]=[]//
  @State refresh:number=0.01;
  //内部model 文件名+model array[0]
  aboutToAppear(): void {
    let httpGetSearchCity:HttpGetSearchCity=new HttpGetSearchCity()//
    httpGetSearchCity.getHttp(this.city).then((res:searchCityResults)=>{
      let resItem=res
      // this.dailyDetailViewModel_Array=weatherDataHelper.getDailyDetail(resItem) //15天的详细数据
      this.searchCityViewModel_Array=weatherDataHelper.getSearchCity(resItem)//
      hilog.debug(0x1111,'20240901','%{public}s','aboutToAppear处获取searchCityViewModel_Array成功'+JSON.stringify(this.searchCityViewModel_Array))
    })
      .catch(()=>{
        hilog.debug(0x1111,'20240901','%{public}s','aboutToAppear处获取searchCityViewModel_Array失败')
      })
  }

  build() {
    Column(){
      List({space:10}){
        ForEach(this.searchCityViewModel_Array,(item:SearchCityViewModel,index:number)=>{
          ListItem(){
            Row(){
              Text(item.name+' - '+item.path.slice(item.name.length+1)).textAlign(TextAlign.Center).fontSize($r('app.float.medium_font_size'))
              if(CommonConstants.CITIES.indexOf(item.name)===-1){
                Image('picture/add.png').width(12).height(12)
                  .onClick(()=>{
                    CommonConstants.CITIES.push(item.name)
                    this.refresh=-1*this.refresh
                  })
              }
              else{
                Row(){
                  Text('已添加').fontSize(18).fontWeight(FontWeight.Lighter)
                  Image($r('app.media.next')).width(12).height(12).opacity(0.8)
                }
              }
            }
            .width('90%')
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({left:10,right:10})
            .onClick(()=>{

            })
          }
        })
      }

    }
  }

}