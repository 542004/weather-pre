// 导入viewModel
import {AirDetailViewModel} from '../viewmodel/AirDetailViewModel'
import {DailyDetailViewModel} from '../viewmodel/DailyDetailViewModel'
import {DailyViewModel} from '../viewmodel/DailyViewModel'
import {HourlyViewModel} from '../viewmodel/HourlyViewModel'
import {LiveCardsViewModel} from '../viewmodel/LiveCardsViewModel'
import {NowViewModel} from '../viewmodel/NowViewModel'
import {WarningViewModel} from '../viewmodel/WarningViewModel'
import {WeatherCardsViewModel} from '../viewmodel/WeatherCardsViewModel'
import {CityWeatherViewModel} from '../viewmodel/CityWeathersViewModel'

// 导入自定义组件
import {NowAreaComponent} from '../view/NowAreaComponent'
import {AqiAreaComponent} from '../view/AqiAreaComponent'
import {AddressAreaComponent} from  '../view/AddressAreaComponent'
import {CityAreaComponent} from '../view/CityAreaComponent'
import {WarningAreaComponent} from '../view/WarningAreaComponent'
import {HourlyAreaComponent} from '../view/HourlyAreaComponent'
import {LiveIndexComponent} from '../view/LiveIndexComponent'
import {WeatherCardsComponent} from '../view/WeatherCardsComponent'
// 导入bean
import {HourlyAirResult,HourlyAirResults} from '../bean/hourlyAir/Results'
import {NowWeatherResult,NowWeatherResults} from '../bean/nowWeather/Results'
import {WarningWeatherResult,WarningWeatherResults} from '../bean/warningWeather/Results'
import {SimpleResults} from '../bean/simpleData/Results'

// 导入httpGet
import { HttpGetSimpleWeather } from '../util/HttpGetSimpleWeather'
import { HttpGetNowWeather } from '../util/HttpGetNowWeather'

//导入dal
import {weatherDataHelper} from '../dal/WeatherDataHelper'

//导入其他
import { hilog } from '@kit.PerformanceAnalysisKit'
import { DailyAreaComponent } from '../view/DailyAreaComponent'
import { router } from '@kit.ArkUI'
import {HttpGetCurrentCity} from '../util/HttpGetCurrentCity'
import CommonConstants from '../common/CommonConstants';
import { preferences } from '@kit.ArkData';
import {common } from '@kit.AbilityKit';
/**
 * fixdaily分支
 */
@Entry
@Component
struct Index {
  //viewModel
  // @State nowViewModel:NowViewModel=new NowViewModel()
  // @State nowWeatherResult:NowWeatherResult=new NowWeatherResult()
  // @State citiesWeatherViewModel:Array<CityWeatherViewModel>=[]
  // //文件名+results
  // @State hourlyAirResults:HourlyAirResults=new HourlyAirResults()
  // @State nowWeatherResults:NowWeatherResults=new NowWeatherResults()
  // @State simpleResults:SimpleResults=new SimpleResults()
  //内部model 文件名+model array[0]
  // @State hourlyAirModel:HourlyAirResult=new HourlyAirResult()
  // @State nowWeatherModel:NowWeatherResult=new NowWeatherResult()
  // @State simpleModel:SimpleResults=new SimpleResults()
  //city

  @State cities:string[]=['西安']
  @State listHeight: number = 360;
  @State curCity:string=''
  private yStart: number = 0;

  context = getContext(this) as common.UIAbilityContext//获取上下文
  dataPreferences:preferences.Preferences = preferences.getPreferencesSync(this.context, {name:'myCity'});//获取实例


  aboutToAppear() {
    //赋值
    CommonConstants.CITIES=this.dataPreferences.getSync('cities',[]) as string[]
    //获取当前位置
    // let httpGetCurrentCity:HttpGetCurrentCity=new HttpGetCurrentCity()
    // httpGetCurrentCity.getHttp('').then((res:SimpleResults)=>{
    //   this.curCity=res.city
    //   console.info('首页测试 aboutToAppear的.then完成 '+this.curCity)
    // })
    //   .catch(()=>{
    //     console.info('获取当前位置失败')
    //   })
    console.info('首页测试 aboutToAppear完成 '+this.curCity)
  }
  onPageShow(): void {
    // this.dataPreferences.putSync('cities',CommonConstants.CITIES)
    // this.dataPreferences.flush()//
    this.cities=['西安']
    //更新城市
    this.curCity=CommonConstants.CURRENT_CITY
    // this.cities=[CommonConstants.CURRENT_CITY];
    for(let i=0;i<CommonConstants.CITIES.length;i++){
      this.cities.push(CommonConstants.CITIES[i])
    }
    console.info('首页测试：'+JSON.stringify(this.cities)+'   '+JSON.stringify(CommonConstants.CITIES)+' 和 '+this.curCity)//
  }
  onPageHide(): void {
    console.info('首页onPageHide测试：'+JSON.stringify(CommonConstants.CITIES))//
  }
  aboutToDisappear(): void {
    //更新首选项
    // console.info('首页aboutToDisappear测试：'+JSON.stringify(CommonConstants.CITIES))//

    this.dataPreferences.putSync('cities',CommonConstants.CITIES)
    this.dataPreferences.flush()//
  }
  // a[10][10]
  build() {
    Swiper(){
      ForEach(this.cities,(city:string)=>{
        Stack({ alignContent: Alignment.TopStart }){

          RelativeContainer(){
            Column(){
              //城市管理的添加
              Row(){
                CityAreaComponent({cities:this.cities})
              }.height('5%')
              //定位
              Row(){
                AddressAreaComponent({city:city})
              }.height('5%').margin({bottom:$r('app.float.small_space_size')})

              //当前信息
              Row(){
                NowAreaComponent({city:city})
              }.height('25%')

              Row(){
                AqiAreaComponent({city:city})
              }.height('3%')
            }
            .height('100%')
            .width('100%')
            List(){
              //预警
              ListItem(){
                WarningAreaComponent({city:city})
              }
              //每天信息
              ListItem(){
                DailyAreaComponent({city:city})
              }

              //每小时信息 降雨预报
              ListItem(){
                HourlyAreaComponent({city:city})
              }

              //六张卡片
              ListItem(){
                WeatherCardsComponent({city:city})
              }
              //六张卡片
              ListItem(){
                LiveIndexComponent({city:city})
              }

            }
            .backgroundColor('#ff7ca7f5')
            .height(this.listHeight)
            .alignRules(CommonConstants.LIST_ALIGN_RULES)
            .scrollBar(BarState.Off)
            .animation({
              duration: 500,
              curve: Curve.Friction,
              iterations: 1,
              playMode: PlayMode.Normal
            })
          }
        }
        .height('100%')
        .width('100%')
        .onTouch((event:TouchEvent)=>{
          if(event.type===TouchType.Down){
            this.yStart=event.touches[0].y;
          }
          else if(event.type===TouchType.Up){
            const yEnd=event.touches[0].y;
            if(yEnd<this.yStart) {
              this.listHeight=720;
              // CommonConstants.BACKGROUND=Color.White
            }
            else if(yEnd>this.yStart){
              this.listHeight=Math.max(360,this.listHeight-yEnd+this.yStart);
              // CommonConstants.BACKGROUND=Color.Gray
            }
          }
          else if(event.type===TouchType.Move){
            const yEnd=event.touches[0].y;
            if(yEnd<this.yStart){
              this.listHeight=Math.min(720,this.listHeight+this.yStart-yEnd);
              // CommonConstants.BACKGROUND=Color.White
            }
            else if(yEnd>this.yStart){
              this.listHeight=Math.max(360,this.listHeight-yEnd+this.yStart);
              // CommonConstants.BACKGROUND=Color.Gray
            }
          }
        })
        // .backgroundColor('#33cccc')
      })
    }
    .backgroundColor('#d26095f3')
    .height('100%')
    .width('100%')
    .loop(false)
  }
}