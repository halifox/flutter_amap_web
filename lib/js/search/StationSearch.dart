@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.StationSearch 类：公交站点查询服务，根据输入关键字或ID查询公交站点信息。

@JS()
@anonymous
class StationSearch {
  external factory StationSearch({StationSearchOptions opts});

  // 根据给定的公交站点ID进行公交站点详情检索
  // id 类型：String - 公交站点的唯一标识
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（StationSearchResult 或 错误信息）
  external void searchById(
      String id, ResultCallback<StationSearchResult> callback);

  // 根据给定的公交站点名称进行公交站点详情查询
  // keyword 类型：String - 公交站点名称，可以支持多个关键字，用"|"分隔
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（StationSearchResult 或 错误信息）
  external void search(
      String keyword, ResultCallback<StationSearchResult> callback);

  // 设置查询结果的页码
  // pageIndex 类型：Number - 查询结果页数，范围：1-100
  // 默认值：1
  external void setPageIndex(int pageIndex);

  // 设置单页显示结果的条数
  // pageSize 类型：Number - 每页显示的查询结果条数，范围：1-100
  // 默认值：20
  external void setPageSize(int pageSize);

  // 设置查询城市
  // city 类型：String - 查询城市，支持城市名称（中文或拼音）、城市代码、行政区代码
  // 默认值：“全国”
  external void setCity(String city);
}

// pageIndex 类型：number	页码，默认值1，取值范围1-100，超出按最大值返回
// pageSize 类型：number	单页显示结果条数，默认值20，取值范围1-100，超出按最大值返回
// city 类型：string	公交站点所在城市，默认值“全国”，可选值：cityname、citycode、adcode
@JS()
@anonymous
class StationSearchOptions {
  external factory StationSearchOptions({
    int pageIndex,
    int pageSize,
    String city,
  });

  external int get pageIndex;

  external int get pageSize;

  external String get city;
}

// info 类型：string	成功状态文字描述
// stationInfo 类型：List<StationInfo>	根据查询条件返回公交站点信息
// keywordList 类型：List<String>	查无此公交站时，返回的建议关键字列表
// cityList 类型：List<CityInfo>	查该城市无此公交站时，返回的建议城市列表
@JS()
@anonymous
class StationSearchResult {
  external String info;
  external List<StationInfo> stationInfo;
  external List<String> keywordList;
  external List<CityInfo> cityList;
}

// StationInfo 对象:
// id 类型：string	公交站点id，该id是唯一标识
// name 类型：string	公交站点名称
// location 类型：LngLat	公交站点经纬度
// adcode 类型：string	区域编码
// citycode 类型：string	城市编码
// buslines 类型：List<Busline>	途经此站点的公交路线列表
@JS()
@anonymous
class StationInfo {
  external String id;
  external String name;
  external LngLat location;
  external String adcode;
  external String citycode;
  external List<Busline> buslines;
}

// Busline 对象:
// id 类型：string	公交线路id，该id是唯一标识
// name 类型：string	公交线路名称
// location 类型：LngLat	公交线路途经此站的经纬度
// start_stop 类型：string	首发站
// end_stop 类型：string	终点站
@JS()
@anonymous
class Busline {
  external String id;
  external String name;
  external LngLat location;
  external String start_stop;
  external String end_stop;
}

// CityInfo 对象
// 可根据需要添加具体字段，假设是类似于 cityName 和 cityCode
@JS()
@anonymous
class CityInfo {
  external String cityName;
  external String cityCode;

  external factory CityInfo({String cityName, String cityCode});
}

@JS()
@anonymous
class LngLat {
  external double lng;
  external double lat;

  external factory LngLat({double lng, double lat});
}
