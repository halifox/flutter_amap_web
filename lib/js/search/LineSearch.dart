@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';
// AMap.LineSearch 类：公交线路查询服务，通过公交线路名称或ID查询公交线路信息，包括起点、终点、途经站点等。

@JS()
class LineSearch {
  external LineSearch(LineSearchOptions opts);

  // 根据给定的公交线路ID进行公交线路详情检索
  // id 类型：String - 公交线路的唯一标识
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（LineSearchResult 或 错误信息）
  external void searchById(
      String id, ResultCallback<LineSearchResult> callback);

  // 根据给定的公交线路名称进行公交线路详情查询
  // keyword 类型：String - 公交线路名称
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（LineSearchResult 或 错误信息）
  external void search(
      String keyword, ResultCallback<LineSearchResult> callback);

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
// city 类型：string	公交线路所在城市，默认值“全国”，可选值：cityname、citycode、adcode
// extensions 类型：string	此项仅公交路线查询时有效，默认值：base，返回公交路线基本信息，取值：all，返回公交路线基本信息+详细信息
@JS()
@anonymous
class LineSearchOptions {
  external factory LineSearchOptions({
    int pageIndex,
    int pageSize,
    String city,
    String extensions,
  });

  external int get pageIndex;

  external int get pageSize;

  external String get city;

  external String get extensions;
}

// info 类型：string	成功状态文字描述
// LineInfo 类型：List<LineInfo>	根据查询条件返回公交路线信息
// keywordList 类型：List<String>	查无此公交站时，返回的建议关键字列表
// cityList 类型：List<LineSearchCityInfo>	查该城市无此公交站时，返回的建议城市列表
@JS()
@anonymous
class LineSearchResult {
  external String info;
  external List<LineInfo> lineInfo;
  external List<String> keywordList;
  external List<LineSearchCityInfo> cityList;
}

// LineInfo（基础信息）对象:
// id 类型：string	公交线路id，该id是唯一标识
// name 类型：string	公交线路名称
// path 类型：List<LngLat>	公交线路经纬度
// citycode 类型：string	公交线路所在城市的城市编码
// type 类型：string	公交类型列表
// start_stop 类型：string	首发站
// end_stop 类型：string	终点站
@JS()
@anonymous
class LineInfo {
  external String id;
  external String name;
  external List<LngLat> path;
  external String citycode;
  external String type;
  external String start_stop;
  external String end_stop;

  // LineInfo（详细信息）对象附加字段
  external String stime;
  external String etime;
  external String basic_price;
  external String total_price;
  external List<String> via_stops;
  external double distance;
  external Bounds bounds;
  external String company;
}

// LineSearchCityInfo 对象
@JS()
@anonymous
class LineSearchCityInfo {
  external String cityName;
  external String cityCode;

  external factory LineSearchCityInfo({String cityName, String cityCode});
}
