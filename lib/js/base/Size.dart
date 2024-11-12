@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 地物对象的像素尺寸
// width 类型：Number   地物对象的宽度，单位：像素
// height 类型：Number   地物对象的高度，单位：像素

@JS()
@anonymous
class Size {
  external factory Size({num width, num height});

  // getWidth 方法：获取地物对象的宽度
  // 返回：Number   地物对象的宽度，单位：像素
  external num getWidth();

  // getHeight 方法：获取地物对象的高度
  // 返回：Number   地物对象的高度，单位：像素
  external num getHeight();

  // toString 方法：返回尺寸对象的字符串表示
  // 返回：String   尺寸对象的字符串表示
  external String toString();
}
