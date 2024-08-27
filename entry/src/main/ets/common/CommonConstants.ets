export default class CommonConstants{
  //天气实况
  static readonly NOW_URL:string='https://api.seniverse.com/v3/weather/now.json?key=S402rOCSb6OqG5IVH'
  //简陋版API
  static readonly SIMPLE_URL:string='https://api.vvhan.com/api/weather?city='
  //逐小时空气质量
  static readonly HOURLY_AIR_URL:string='https://api.seniverse.com/v3/air/hourly.json?key=S402rOCSb6OqG5IVH&language=zh-Hans&location='
  //气象灾害预警
  static readonly WARNING_URL:string='https://api.seniverse.com/v3/weather/alarm.json?key=S402rOCSb6OqG5IVH&location='
  //未来15日天气预报
  static readonly DAILY_URL:string='https://api.seniverse.com/v3/weather/daily.json?key=S402rOCSb6OqG5IVH&location='
  //24小时逐小时天气预报
  static readonly HOUTLY_URL:string='https://api.seniverse.com/v3/weather/hourly.json?key=S402rOCSb6OqG5IVH&location='
  //3天生活指数
  static readonly LIVE_INDEX_URL:string='https://api.seniverse.com/v3/life/suggestion.json?key=S402rOCSb6OqG5IVH&location=shanghai&language=zh-Hans&days=3'
  //自动识别
  static readonly CURRENT_CITY_URL:string='https://api.vvhan.com/api/weather'
}