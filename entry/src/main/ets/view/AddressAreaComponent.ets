

@Component
export struct AddressAreaComponent{
  @Prop city:string;
  build() {
    Row(){
      Text(this.city)
        .fontSize($r('app.float.medium_font_size'))
    }
    .height('90%')
    .width('90%')
    .alignItems(VerticalAlign.Bottom)
    .justifyContent(FlexAlign.Start)
  }
}