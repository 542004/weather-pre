import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
/**
 * 城市管理的加号
 */
@Component
export struct CityAreaComponent{

  build() {
   Row(){
     Image($r('app.media.add'))
       .height($r('app.float.common_pic_size'))
       .width($r('app.float.common_pic_size'))
       .onClick(()=>{
          router.pushUrl({
            url:'pages/CityMangerPage'
          })
            .then(()=>{
              console.info('跳转城市管理页面成功')
            })
            .catch((err:BusinessError)=>{
              console.error(`跳转城市管理页面失败，code:${err.code}，message:${err.message}`)
            })

       })
   }
   .width('90%')
   .justifyContent(FlexAlign.End)
  }
}