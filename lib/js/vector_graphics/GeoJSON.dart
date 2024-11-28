@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// GeoJSON类，继承自OverLayGroup，可实现GeoJSON对象与OverlayGroup的相互转换
@JS()
class GeoJSON {
  // 创建一个GeoJSON对象，opts为初始构造参数
  external GeoJSON(GeoJSONOptions opts);

  // 导入GeoJSON数据
  external importData(Object geoJSON);

  // 将OverlayGroup转换为GeoJSON对象
  external Object toGeoJSON();
}

// opts (GeoJSONOptions) 创建一个GeoJSON对象，ops为初始构造参数
@JS()
@anonymous
class GeoJSONOptions {
  // 要加载的标准GeoJSON对象
  external Object geoJSON;

  // 指定点要素的绘制方式，缺省时为Marker的默认样式。
  // geojson为当前要素对应的GeoJSON对象，lnglat为对应的点坐标
  external Function getMarker;

  // 指定线要素的绘制方式，缺省时为Polyline的默认样式。
  // geojson为当前要素对应的GeoJSON对象，lnglat为对应的线的路径
  external Function getPolyline;

  // 指定面要素的绘制方式，缺省时为Polygon的默认样式。
  // geojson为当前要素对应的GeoJSON对象，lnglat为对应的线的路径
  external Function getPolygon;

  // 构造GeoJSONOptions对象
  external factory GeoJSONOptions({
    Object geoJSON,
    Function getMarker,
    Function getPolyline,
    Function getPolygon,
  });
}
