import {Location} from  '../Location'
class alarmItem{
  public alarm_id:string=''
  public title:string=''
  public type:string=''
  public level:string=''
  public region_id:string=''
  public status:string=''
  public description:string=''
  public pub_date:string=''
}
export class WarningWeatherResult{
  public location:Location=new Location()
  public alarms:alarmItem[]=[]
}
export class WarningWeatherResults{
  public results:WarningWeatherResult[]=[]
}
