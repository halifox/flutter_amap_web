@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.DistrictSearch 类：行政区查询服务，用于根据关键字查询行政区或商圈信息，支持设置查询级别、返回下级行政区等功能。

@JS()
@anonymous
class DistrictSearch {
  external factory DistrictSearch({DistrictSearchOptions opts});

  // 根据关键字查询行政区或商圈信息
  // keywords 类型：String - 查询的关键字，支持行政区名、citycode、adcode、商圈名
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（DistrictSearchResult 或 错误信息）
  // opts 类型：DistrictSearchOptions - 额外的查询配置选项
  external void search(
      String keywords,
      ResultCallback<DistrictSearchResult> callback,
      DistrictSearchOptions opts);

  // 设置关键字对应的行政区级别或商圈
  // level 类型：String - 可选值：'country'（国家），'province'（省/直辖市），'city'（市），'district'（区/县），'biz_area'（商圈）
  external void setLevel(String level);

  // 设置下级行政区级数
  // district 类型：Number - 可选值：0（不返回下级行政区），1（返回下一级行政区），2（返回下两级行政区），3（返回下三级行政区）
  external void setSubdistrict(int district);
}

// level 类型：string	关键字对应的行政区级别或商圈，可选值：
// country：国家
// province：省/直辖市
// city：市
// district：区/县
// biz_area：商圈
// showbiz 类型：boolean	是否显示商圈，默认值true
// extensions 类型：string	default 'base'	是否返回行政区边界坐标点，取值：all（返回完整行政区边界坐标点）
// subdistrict 类型：number	显示下级行政区级数，默认值1
@JS()
@anonymous
class DistrictSearchOptions {
  external factory DistrictSearchOptions({
    String level,
    bool showbiz,
    String extensions,
    int subdistrict,
  });
}

// info 类型：string	成功状态文字描述
// districtList 类型：List<District>	根据查询条件返回行政区划列表
// District 对象:
// name 类型：string	行政区名称
// center 类型：LngLat	城市中心点经纬度坐标
// citycode 类型：string	城市编码
// adcode 类型：string	区域编码
// level 类型：string	行政区划级别
// boundaries 类型：List<LngLat>	行政区的边界坐标集合
// districtList 类型：List<District>	下级行政区信息列表，subdistrict 为0时不返回该对象
@JS()
@anonymous
class DistrictSearchResult {
  external String info;
  external List<District> districtList;
}

@JS()
@anonymous
class District {
  external String name;
  external LngLat center;
  external String citycode;
  external String adcode;
  external String level;
  external List<LngLat> boundaries;
  external List<District> districtList;
}
