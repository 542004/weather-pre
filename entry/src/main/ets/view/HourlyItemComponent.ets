import {HourlyViewModel} from '../viewmodel/HourlyViewModel'

@Component
export struct HourlyItemComponent{
  @Prop hourlyViewModel:HourlyViewModel
  @Prop index:number
  build() {
    Column(){
      Text(this.hourlyViewModel.temp+'°')
      Image('/picture/white/'+this.hourlyViewModel.Img.toString()+'@1x.png')
        .width(20)
      Text(this.hourlyViewModel.windSpeed+'km/h')
        .fontSize($r('app.float.common_font_size'))
      Text((this.index==0)?'现在':this.hourlyViewModel.time.slice(11,16))
        .fontSize($r('app.float.common_font_size'))
        .fontWeight(FontWeight.Normal)
    }
    .width('14%')
    .height('90%')
    .justifyContent(FlexAlign.SpaceBetween)
  }

}