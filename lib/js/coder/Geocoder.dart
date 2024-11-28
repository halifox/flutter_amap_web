@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.Geocoder 地理编码与逆地理编码类，用于地址描述与经纬度坐标之间的转换。
// 用户可以通过回调函数获取查询结果。
@JS()
class Geocoder {
  external Geocoder(GeocoderOptions opts);

  // 获取地理编码位置
  // 获取与给定地址相关的经纬度信息
  external getLocation(String keyword, ResultCallback<GeocodeResult> callback);

  // 设置地理编码查询的城市
  external setCity(String city);

  // 获取逆地理编码结果
  // 根据给定的坐标，返回对应的地址信息
  external getAddress(LngLat location, ResultCallback<GeocodeResult> callback);
}

// GeocoderOptions 配置项
// opts.city 类型：string：城市，地理编码时，设置地址描述所在城市
// 可选值：城市名（中文或中文全拼）、citycode、adcode，默认值：“全国”
//
// opts.radius 类型：number：逆地理编码时，以给定坐标为中心点，单位：米。
// 取值范围：0 - 3000，默认值：1000
//
// opts.lang 类型：string：设置语言类型，
// 可选值：zh_cn（中文）、en(英文)，默认值：zh_cn（中文）
//
// opts.batch 类型：boolean：是否批量查询，
// batch 设置为 false 时，只返回第一条记录
//
// opts.extensions 类型：string：逆地理编码时，返回信息的详略，
// 默认值：base，返回基本地址信息，取值为：all，返回地址信息及附近poi、道路、道路交叉口等信息
@JS()
@anonymous
class GeocoderOptions {
  external factory GeocoderOptions({
    String city,
    int radius,
    String lang,
    bool batch,
    String extensions,
  });
}

// GeocodeResult 地理编码查询结果
// status 类型：string：当status为complete时，result为GeocodeResult；当status为error时，result为错误信息info；
// 当status为no_data时，代表检索返回0结果。
@JS()
@anonymous
class GeocodeResult {
  external factory GeocodeResult({
    String info,
    List<Poi> pois,
    LngLat location,
  });
}

// ReGeocodeResult 逆地理编码查询结果
// status 类型：string：当status为complete时，result为ReGeocodeResult；当status为error时，result为错误信息info；
// 当status为no_data时，代表检索返回0结果。
@JS()
@anonymous
class ReGeocodeResult {
  external factory ReGeocodeResult({
    String info,
    dynamic addressComponent,
    List<Poi> pois,
  });
}

// AMap.convertFrom 用于将坐标从一种坐标系转换为另一种坐标系。
// 国内目前常见的坐标系主要分为三种：
// 1. 地球坐标系——WGS84：常见于 GPS 设备，Google 地图等国际标准的坐标体系。
// 2. 火星坐标系——GCJ-02：中国国内使用的被强制加密后的坐标体系，高德坐标就属于该种坐标体系。
// 3. 百度坐标系——BD-09：百度地图所使用的坐标体系，是在火星坐标系的基础上又进行了一次加密处理。
// 因此在使用不同坐标系前，需要使用 AMap.convertFrom() 方法将这些非高德坐标系进行转换。
@JS()
external convertFrom(LngLat lnglat, String type, ResultCallback<List<dynamic>> callback);