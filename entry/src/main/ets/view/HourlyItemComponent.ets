import {HourlyViewModel} from '../viewmodel/HourlyViewModel'

@Component
export struct HourlyItemComponent{
  @Prop hourlyViewModel:HourlyViewModel
  @Prop index:number
  build() {
    Column(){
      Blank()
        .height('10%')
      Text(this.hourlyViewModel.temp+'°')
      Image('/picture/black/'+this.hourlyViewModel.Img.toString()+'@1x.png')
        .width(20)
      Text(this.hourlyViewModel.windSpeed+'km/h')
        .fontSize(12)
      Text((this.index==0)?'现在':this.hourlyViewModel.time.slice(11,16))
        .fontSize(14)
        .fontWeight(FontWeight.Normal)
    }
    .width('14%')
    .height('90%')
    // .backgroundColor(Color.Green)
    .justifyContent(FlexAlign.SpaceBetween)
  }

}