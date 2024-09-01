/**
 * viewModel的导入
 */
import {AirDetailViewModel} from '../viewmodel/AirDetailViewModel'
import {DailyViewModel} from '../viewmodel/DailyViewModel'
import {HourlyViewModel} from  '../viewmodel/HourlyViewModel'
import {DailyDetailViewModel} from '../viewmodel/DailyDetailViewModel'
import {NowViewModel} from '../viewmodel/NowViewModel'
import {WarningViewModel} from '../viewmodel/WarningViewModel'
import {LiveCardsViewModel} from '../viewmodel/LiveCardsViewModel'
import {WeatherCardsViewModel} from '../viewmodel/WeatherCardsViewModel'
import {SearchCityViewModel} from '../viewmodel/SearchCityViewModel'
/**
 * bean的导入
 */
import {HourlyAirResult,HourlyAirResults} from '../bean/hourlyAir/Results'
import {NowWeatherResult,NowWeatherResults} from '../bean/nowWeather/Results'
import {WarningWeatherResult,WarningWeatherResults} from '../bean/warningWeather/Results'
import {HourlyWeatherResult,HourlyWeatherResults} from '../bean/hourlyWeather/Results'
import {DailyWeatherResult,DailyWeatherResults,DailyItem} from '../bean/dailyWeather/Results'
import {SimpleResults} from '../bean/simpleData/Results'
import {LiveIndexResults,LiveIndexResult} from '../bean/liveIndex/Results'
import {searchCityResult,searchCityResults} from '../bean/searchCity/Results'

class WeatherDataHelper{
  //AqiViewModel
  public getAqi(model:HourlyAirResult):AirDetailViewModel{
    let ans:AirDetailViewModel=new AirDetailViewModel()
    ans.quality=model.hourly[0].quality.length<=1?'空气'+model.hourly[0].quality:model.hourly[0].quality
    ans.aqi=model.hourly[0].aqi
    return ans;
  }

  // DailyDetailViewModel 返回15天
  public getDailyDetail(model:DailyWeatherResult):DailyDetailViewModel[]{
    let ans:DailyDetailViewModel[]=[]
    for(let i=0;i<model.daily.length;i++){
      let item=model.daily[i]
      ans.push(new DailyDetailViewModel(
        item.text_day,
        item.text_night,
        item.date,
        item.code_day,
        item.code_night,
        item.high,
        item.low,
        item.wind_scale,
        item.humidity))
    }
    return ans;
  }

  //DailyViewModel 返回3天
  public getDaily(model:DailyWeatherResult):DailyViewModel[]{
    let ans:DailyViewModel[]=[]
    for(let i=0;i<3;i++){
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
  public getHourly(model:HourlyWeatherResult):HourlyViewModel[]{
    let ans:HourlyViewModel[]=[]
    for(let i=0;i<model.hourly.length;i++){
      ans.push(
        new HourlyViewModel(model.hourly[i].time,model.hourly[i].text,model.hourly[i].code,
          model.hourly[i].temperature, model.hourly[i].wind_speed)
      )
    }
    return ans;
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

  //
  public getWeatherCards(model:NowWeatherResult):WeatherCardsViewModel{
    let ans:WeatherCardsViewModel=new WeatherCardsViewModel();
    ans.pressure=model.now.pressure
    ans.feels_like=model.now.feels_like
    ans.humidity=model.now.humidity
    ans.wind_direction=model.now.wind_direction
    ans.wind_speed=model.now.wind_speed
    ans.pressure=model.now.pressure
    ans.clouds=model.now.clouds
    ans.visibility=model.now.visibility
    return ans;
  }
  //LiveIndex
  public getLiveIndex(model:LiveIndexResult):LiveCardsViewModel{
    let ans:LiveCardsViewModel=new LiveCardsViewModel()
    ans.dress.brief=model.suggestion[0].dressing.brief
    ans.dress.details=model.suggestion[0].dressing.details
    ans.uv.brief=model.suggestion[0].uv.brief
    ans.uv.details=model.suggestion[0].uv.details
    ans.sport.brief=model.suggestion[0].sport.brief
    ans.sport.details=model.suggestion[0].sport.details
    ans.car_washing.brief=model.suggestion[0].car_washing.brief
    ans.car_washing.details=model.suggestion[0].car_washing.details
    ans.umbrella.brief=model.suggestion[0].umbrella.brief
    ans.umbrella.details=model.suggestion[0].umbrella.details
    ans.flu.brief=model.suggestion[0].flu.brief
    ans.flu.details=model.suggestion[0].flu.details
    ans.sport
    return ans;
  }
  //搜索城市
  public getSearchCity(model:searchCityResults):SearchCityViewModel[]{
    let ans:SearchCityViewModel[]=[];
    for(let i=0;i<model.results.length;i++){
      let temp:SearchCityViewModel=new SearchCityViewModel();
      temp.name=model.results[i].name
      temp.path=model.results[i].path
      ans.push(temp);
    }
    return ans;
  }
}
export let weatherDataHelper:WeatherDataHelper=new WeatherDataHelper()