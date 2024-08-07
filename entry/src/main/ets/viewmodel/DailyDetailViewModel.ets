// @Observed
export class DailyDetailViewModel{
  public week:string
  public dayImg:string
  public nightImg:string
  public tempHigh:string
  public tempLow:string
  public windSpeed:string
  public quality:string
  constructor(week:string='',dayImg:string='',nightImg:string='',tempHigh:string='',tempLow:string='',windSpeed:string='',quality:string='') {
    this.week=week
    this.dayImg=dayImg
    this.nightImg=nightImg
    this.tempHigh=tempHigh
    this.tempLow=tempLow
    this.windSpeed=windSpeed
    this.quality=quality
  }
}
 // @Observed
export class DailyDetailViewModelArray{
  public dailyDetailViewModelArray:DailyDetailViewModel[]=[]
}