@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.CitySearch 根据IP返回对应城市信息，提供根据输入IP或自动获取IP获取对应城市信息功能。
// 用户可以通过自定义回调函数取回并显示查询结果。若服务请求失败，系统将返回错误信息。
@JS()
class CitySearch {
  external CitySearch();

  // 自动获取用户IP，回调返回当前用户所在城市。
  // 当 status 为 complete 时，result 为 CitySearchResult；
  // 当 status 为 error 时，result 为错误信息 info；
  // 当 status 为 no_data 时，代表检索返回 0 结果。
  external void getLocalCity(ResultCallback<CitySearchResult> callback);

  // 根据输入IP地址返回对应城市信息，status 同上。
  external void getCityByIp(String ip, ResultCallback<CitySearchResult> callback);
}

// 查询结果
// status (String): 查询状态 (complete, error, no_data)
// result (info | CitySearchResult): 查询结果对象
@JS()
@anonymous
class CitySearchResult {
  external factory CitySearchResult({
    String info, // 成功状态说明
    String city, // 城市名称
    String province, // 省份名称
    String adcode, // 城市对应的行政区划代码
    String rectangle, // 城市边界范围
  });
}
