import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Component
export struct BackComponent{
  build() {
    Row(){
      Image($r('app.media.back'))
        .height($r('app.float.small_pic_size'))
        .width($r('app.float.small_pic_size'))
        .onClick(()=>{
          router.back()
        })
    }
  }
}