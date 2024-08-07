//逐小时空气质量预报
import {Location} from  '../Location'
class HourlyItem{
  public aqi:string=''
  public pm25:string=''
  public pm10:string=''
  public so2: string=''
  public no2: string=''
  public co: string=''
  public o3: string=''
  public time:string=''
  public quality: string=''
}
export class HourlyAirResult{
  public location:Location=new Location()
  public hourly:HourlyItem[]=[]
  public last_update:string=''
}
export class HourlyAirResults{
  public results:HourlyAirResult[]=[]
}

