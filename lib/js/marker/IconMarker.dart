@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

//Icon类 表示点标记的图标 用于添加复杂点标记，即在普通点标记的基础上，添加Icon类，通过在Icon表示的大图上截取其中一部分作为标注的图标 构造点覆盖物图标，通过IconOptions设置图标属性
@JS("Icon")
class IconMarker {
  external IconMarker(IconMarkerOptions opts);
}

// size 类型：(Size | Vector2)	= [36,36] 图标尺寸，默认值(36,36)
// imageOffset 类型：(Pixel | Vector2)	图标取图偏移量。当image中指定了一个大图时，可通过size和imageOffset配合，显示图标的指定范围
// image 类型：string	图标的取图地址。默认为蓝色图钉图片
// imageSize 类型：(Size | Vector2)	图标所用图片大小，根据所设置的大小拉伸或压缩图片，等同于CSS中的background-size属性。可用于实现高清屏的高清效果
@JS()
@anonymous
class IconMarkerOptions {
  external factory IconMarkerOptions({
    List<int> size,
    List<int> imageOffset,
    String image,
    List<int> imageSize,
  });
}
