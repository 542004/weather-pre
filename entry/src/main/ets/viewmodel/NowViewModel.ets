export class NowViewModel{
  public temp:string
  public tempHigh:string
  public tempLow:string
  public weather:string
  constructor(temp:string='',tempHigh:string='',tempLow:string='',weather:string='') {
    this.temp=temp
    this.tempHigh=tempHigh
    this.tempLow=tempLow
    this.weather=weather
  }
}