// 导入viewModel
import {LiveCardsViewModel} from '../viewmodel/LiveCardsViewModel'
// import {DailyViewModel} from '../viewmodel/DailyViewModel'
// 导入bean

import {LiveIndexResult,LiveIndexResults} from '../bean/liveIndex/Results'

//导入dal
import {weatherDataHelper} from '../dal/WeatherDataHelper'

//util
import { HttpGetLiveIndex } from '../util/HttpGetLiveIndex'
import { hilog } from '@kit.PerformanceAnalysisKit'

import { ButtonOptions, router } from '@kit.ArkUI';

import CommonConstants from '../common/CommonConstants';
@Component
export struct LiveIndexComponent{//
  @Prop city:string;
  //viewModel
  // @State dailyDetailViewModel_Array:DailyDetailViewModel[]=[]//
  @State liveCardsViewModel:LiveCardsViewModel=new LiveCardsViewModel()//

  //内部model 文件名+model array[0]
  aboutToAppear(): void {
    let httpGetLiveIndex:HttpGetLiveIndex=new HttpGetLiveIndex()//
    httpGetLiveIndex.getHttp(this.city).then((res:LiveIndexResults)=>{
      let resItem=res.results[0]
      // this.dailyDetailViewModel_Array=weatherDataHelper.getDailyDetail(resItem) //15天的详细数据
      this.liveCardsViewModel=weatherDataHelper.getLiveIndex(resItem)
      hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather成功')
    })
      .catch(()=>{
        hilog.debug(0x1111,'mytag11','%{public}s','aboutToAppear处获取DailyWeather失败')
      })
  }

  build() {
    Grid() {
      GridItem(){Text(this.liveCardsViewModel.dress.brief)}
      GridItem(){Text('紫外线'+this.liveCardsViewModel.uv.brief)}
      GridItem(){Text('户外运动'+this.liveCardsViewModel.sport.brief)}
      GridItem(){Text(this.liveCardsViewModel.car_washing.brief+'洗车')}
      GridItem(){Text(this.liveCardsViewModel.umbrella.brief)}
      GridItem(){Text(this.liveCardsViewModel.flu.brief+'感冒')}
    }
    .rowsTemplate('1fr 1fr')
    .columnsTemplate('1fr 1fr 1fr')
    .height(160)
    .width('92%')
    .borderRadius(15)
    .backgroundColor(CommonConstants.BACKGROUND)
    // .opacity(0.5)
    .margin({bottom:10,left:18,right:18})
  }
}