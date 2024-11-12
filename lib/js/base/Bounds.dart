@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';
import 'package:js/js.dart';

// 地物对象的经纬度矩形范围。
// southWest 类型：LngLat   矩形范围的西南角经纬度坐标
// northEast 类型：LngLat   矩形范围的东北角经纬度坐标

@JS()
@anonymous
class Bounds {
  external factory Bounds(LngLat southWest, LngLat northEast);

  // contains 方法：判断指定点是否在矩形范围内
  // point 类型：LngLat   要判断的点坐标
  // 返回：Boolean   如果指定点在矩形范围内返回true，否则返回false
  external bool contains(LngLat point);

  // getCenter 方法：获取矩形范围的中心点坐标
  // 返回：LngLat   矩形范围的中心点经纬度坐标
  external LngLat getCenter();

  // getSouthWest 方法：获取矩形范围的西南角坐标
  // 返回：LngLat   矩形范围西南角的经纬度坐标
  external LngLat getSouthWest();

  // getNorthEast 方法：获取矩形范围的东北角坐标
  // 返回：LngLat   矩形范围东北角的经纬度坐标
  external LngLat getNorthEast();

  // toString 方法：返回矩形范围的字符串表示
  // 返回：String   矩形范围的字符串形式
  external String toString();
}
