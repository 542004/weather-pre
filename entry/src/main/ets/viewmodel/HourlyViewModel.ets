export class HourlyViewModel{
  public time:string
  public Img:string
  public temp:string
  public windSpeed:string//风力等级
  constructor(time:string='',Img:string='',temp:string='',windSpeed:string='') {
    this.time=time
    this.Img=Img
    this.temp=temp
    this.windSpeed=windSpeed
  }
}