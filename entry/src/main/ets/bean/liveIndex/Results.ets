//生活指数
import {Location} from  '../Location'
export class Item{
  brief:string='';
  details:string=''
}
export class SuggestionItem{
  public date:string=''
  public ac:Item=new Item();
  public air_pollution:Item=new Item();
  public airing: Item=new Item();
  public allergy: Item=new Item();
  public beer: Item=new Item();
  public boating: Item=new Item();
  public car_washing:Item=new Item();
  public comfort: Item=new Item();
  public dressing: Item=new Item();
  public fishing: Item=new Item();
  public flu: Item=new Item();
  public kiteflying: Item=new Item();
  public makeup: Item=new Item();
  public mood: Item=new Item();
  public morning_sport: Item=new Item();
  public road_condition: Item=new Item();
  public shopping: Item=new Item();
  public sport: Item=new Item();
  public sunscreen: Item=new Item();
  public traffic: Item=new Item();
  public umbrella: Item=new Item();
  public uv: Item=new Item();
}

export class LiveIndexResult{
  public location:Location=new Location()
  public suggestion:Array<SuggestionItem>=[]
  public last_update:string=''
}
export class LiveIndexResults{
  public results:LiveIndexResult[]=[]
}