import {AirDetailViewModel} from './AirDetailViewModel'
import {DailyDetailViewModel} from './DailyDetailViewModel'
import {DailyViewModel} from './DailyViewModel'
import {HourlyViewModel} from './HourlyViewModel'
import {LiveCardsViewModel} from './LiveCardsViewModel'
import {NowViewModel} from './NowViewModel'
import {WarningViewModel} from './WarningViewModel'
import {WeatherCardsViewModel} from './WeatherCardsViewModel'

export class CityWeatherViewModel{
  public airDetailViewModel:AirDetailViewModel=new AirDetailViewModel()
  public dailyDetailViewModel:DailyDetailViewModel=new DailyDetailViewModel()
  public dailyViewModel:DailyViewModel=new DailyViewModel()
  public hourlyViewModel:HourlyViewModel=new HourlyViewModel()
  public liveCardsViewModel:LiveCardsViewModel=new LiveCardsViewModel()
  public nowViewModel:NowViewModel=new NowViewModel()
  public warningViewModel:WarningViewModel=new WarningViewModel()
  public weatherCardsViewModel:WeatherCardsViewModel=new WeatherCardsViewModel()
}
