@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.Icon(opt: IconOptions)	构造点覆盖物图标，通过IconOptions设置图标属性
@JS("Icon")
class Icon {
  external factory Icon(IconMarkerOptions opt);

  // 获取图标图片大小
  external Size getImageSize();

  // 设置图标图片大小
  external void setImageSize(Size size);
}

// size 类型：Size	图标尺寸，默认值(36,36)
// imageOffset 类型：Pixel	图标取图偏移量
// image 类型：String	图标的取图地址，默认为蓝色图钉图片
// imageSize 类型：Size	图标所用图片大小，根据所设置的大小拉伸或压缩图片
// getImageSize() 方法：获取图标图片大小
// setImageSize(size: Size) 方法：设置图标图片大小
@JS()
@anonymous
class IconMarkerOptions {
  external factory IconMarkerOptions({
    Size size,
    Pixel imageOffset,
    String image,
    Size imageSize,
  });
}
