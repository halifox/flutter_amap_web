@JS('AMap')
library amap;

import 'package:js/js.dart';

// 经纬度坐标，确定地图上的一个点。
// lng 类型：Number   经度值，表示地理坐标的经度部分
// lat 类型：Number   纬度值，表示地理坐标的纬度部分
// noAutofix 类型：bool   是否自动修正经度范围，默认为false，表示自动修正经度至 [-180, 180] 区间，设置为true时则不进行修正

@JS()
@anonymous
class LngLat {
  external factory LngLat(num lng, num lat, [bool noAutofix]);

  // offset 方法：经度和纬度平移
  // w 类型：Number   经度偏移量，单位：米，正值表示向东，负值表示向西
  // s 类型：Number   纬度偏移量，单位：米，正值表示向北，负值表示向南
  // 返回：LngLat   新的经纬度坐标对象
  external LngLat offset(num w, num s);

  // distance 方法：计算当前经纬度与传入经纬度之间的距离
  // lnglat 类型：LngLat | Array.<LngLat>   目标经纬度坐标或坐标数组
  // 返回：Number   当前经纬度和传入目标坐标之间的地面距离，单位为米
  external num distance(LngLat lnglat);

  // getLng 方法：获取当前经度值
  // 返回：Float   当前经度值
  external num getLng();

  // getLat 方法：获取当前纬度值
  // 返回：Float   当前纬度值
  external num getLat();

  // equals 方法：判断当前经纬度坐标是否与另一个经纬度坐标相等
  // lnglat 类型：LngLat   要比较的另一个经纬度坐标对象
  // 返回：Boolean   如果相等返回true，否则返回false
  external bool equals(LngLat lnglat);

  // toString 方法：返回当前经纬度坐标的字符串形式
  // 返回：String   经纬度对象的字符串表示
  external String toString();
}
