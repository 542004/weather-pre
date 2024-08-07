export class HourlyViewModel{
  public time:string
  public Img:string
  public temp:string
  public windSpeed:number
  constructor(time:string='',Img:string='',temp:string='',windSpeed:number=0) {
    this.time=time
    this.Img=Img
    this.temp=temp
    this.windSpeed=windSpeed
  }
}