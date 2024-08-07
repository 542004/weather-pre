export class AirDetailViewModel{
  public aqi:string=''
  public quality:string=''
  public pm25:string=''
  public pm10:string=''
  public so2:string=''
  public no2:string=''
  public o3:string=''
  public co:string=''
  public time:string=''
  constructor(quality:string='',aqi:string='') {
    this.quality=quality
    this.aqi=aqi
  }
}
