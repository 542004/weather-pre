//逐小时天气预报
import {Location} from  '../Location'
class HourlyWeatherItem{
  public time:string=''
  public text:string=''
  public code:string=''
  public temperature: string=''
  public humidity: string=''
  public wind_direction: string=''
  public wind_speed: string=''
}
export class HourlyWeatherResult{
  public location:Location=new Location()
  public hourly:HourlyWeatherItem[]=[]
}
export class HourlyWeatherResults{
  public results:HourlyWeatherResult[]=[]
}

