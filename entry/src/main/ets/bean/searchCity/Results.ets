

export class searchCityResult{
  public id:string='';
  public name:string='';
  public country:string='';
  public path:string='';
  public timezone:string='';
  public timezone_offset:string='';
}

export class searchCityResults{
  public results:searchCityResult[]=[]
}