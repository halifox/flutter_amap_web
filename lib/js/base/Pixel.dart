@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 像素坐标，确定地图上的一个像素点。
// x 类型：Number   像素坐标的X方向坐标
// y 类型：Number   像素坐标的Y方向坐标

@JS()
@anonymous
class Pixel {
  external factory Pixel({num x, num y});

  // getX 方法：获取像素坐标的X方向坐标
  // 返回：Number   像素坐标的X方向坐标
  external num getX();

  // getY 方法：获取像素坐标的Y方向坐标
  // 返回：Number   像素坐标的Y方向坐标
  external num getY();

  // equals 方法：判断当前像素坐标是否与传入的像素坐标相等
  // point 类型：Pixel   要比较的另一个像素坐标对象
  // 返回：Boolean   如果当前像素坐标与传入坐标相等则返回true，否则返回false
  external bool equals(Pixel point);

  // toString 方法：返回像素坐标的字符串表示
  // 返回：String   像素坐标对象的字符串表示
  external String toString();
}
