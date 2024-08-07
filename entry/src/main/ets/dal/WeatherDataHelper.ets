/**
 * viewModel的导入
 */
import {AirDetailViewModel} from '../viewmodel/AirDetailViewModel'
import {DailyViewModel} from '../viewmodel/DailyViewModel'
import {HourlyViewModel} from  '../viewmodel/HourlyViewModel'
import {DailyDetailViewModel} from '../viewmodel/DailyDetailViewModel'
import {NowViewModel} from '../viewmodel/NowViewModel'
import {WarningViewModel} from '../viewmodel/WarningViewModel'
/**
 * bean的导入
 */
import {HourlyAirResult,HourlyAirResults} from '../bean/hourlyAir/Results'
import {NowWeatherResult,NowWeatherResults} from '../bean/nowWeather/Results'
import {WarningWeatherResult,WarningWeatherResults} from '../bean/warningWeather/Results'
import {DailyWeatherResult,DailyWeatherResults,DailyItem} from '../bean/dailyWeather/Results'
import {SimpleResults} from '../bean/simpleData/Results'



class WeatherDataHelper{
  //AqiViewModel
  public getAqi(model:HourlyAirResult):AirDetailViewModel{
    let ans:AirDetailViewModel=new AirDetailViewModel()
    ans.quality=model.hourly[0].quality.length<=1?'空气'+model.hourly[0].quality:model.hourly[0].quality
    ans.aqi=model.hourly[0].aqi
    return ans;
  }

  // DailyDetailViewModel 返回15天
  public getDailyDetail(model:DailyWeatherResult):DailyItem[]{
    return model.daily
    // let ans:DailyItem[]=[]
    // for(let i=0;i<model.length;i++){
    //   let item=model[i]
    //   ans.push(new DailyDetailViewModel(item.date,
    //     item.code_day,
    //     item.code_night,
    //     item.high,
    //     item.low,
    //     item.wind_scale,
    //     item.humidity))
    //   // ans.push(new DailyDetailViewModel(model.daily[i].date,
    //   //   model.daily[i].code_day,
    //   //   model.daily[i].code_night,
    //   //   model.daily[i].high,
    //   //   model.daily[i].low,
    //   //   model.daily[i].wind_scale,
    //   //   model.daily[i].humidity))
    // }
    // return ans
  }

  //DailyViewModel 返回3天
  public getDaily(model:DailyWeatherResult):DailyViewModel[]{
    let ans:DailyViewModel[]=[]
    for(let i=0;i<model.daily.length;i++){
      ans.push({
        week:model.daily[i].date,
        weather:model.daily[i].text_day,
        Img:model.daily[i].code_day,
        tempHigh:model.daily[i].high,
        tempLow:model.daily[i].low
      })
    }
    return ans
  }
  //HourlyViewModel
  public getHourly(){

  }

  //MoreDailyViewModel
  public getMoreDaily(){

  }

  //NowViewModel
  public getNow(simpleModel:SimpleResults,model:NowWeatherResult):NowViewModel{
    let ans:NowViewModel=new NowViewModel()
    ans.temp=model.now.temperature+'℃'
    ans.weather=simpleModel.data.type
    ans.tempHigh=simpleModel.data.high
    ans.tempLow=simpleModel.data.low
    return ans
  }

  //WarningViewModel
  public getWarning(model:WarningWeatherResult){
    let ans:WarningViewModel=new WarningViewModel()
    for(let i=0;i<model.alarms.length;i++){
      ans.WarningViewModelItemArray.push({title:model.alarms[i].title,
        pub_date:model.alarms[i].pub_date,
        description:model.alarms[i].description
      })
    }
    return ans;
  }
}
export let weatherDataHelper:WeatherDataHelper=new WeatherDataHelper()