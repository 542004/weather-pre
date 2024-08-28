//15日天气预报
import {Location} from  '../Location'
export class SuggestionItem{
  public date:string=''
  public text_day:string=''
  public code_day:string=''
  public text_night: string=''
  public code_night: string=''
  public high: string=''
  public low: string=''
  public rainfall:string=''
  public precip: string=''
  public wind_direction: string=''
  public wind_direction_degree: string=''
  public wind_speed: string=''
  public wind_scale: string=''
  public humidity: string=''
}
// export class DailyItemArray{
//   public dailyItemArray:Array<DailyItem>=[]
// }
export class DailyWeatherResult{
  public location:Location=new Location()
  public suggestion:Array<SuggestionItem>=[]
  public last_update:string=''
}
export class DailyWeatherResults{
  public results:DailyWeatherResult[]=[]
}