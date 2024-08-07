import {Location} from  '../Location'
import {Now} from './Now'

export class NowWeatherResult{
  public location:Location=new Location()
  public now:Now=new Now()
  public last_update:string=''
}

export class NowWeatherResults{
  public results:NowWeatherResult[]=[]
}

