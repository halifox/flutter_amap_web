@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 用于加载OGC标准的WMS地图服务的一种图层类，仅支持EPSG3857坐标系统的WMS图层。
// 查看WMS的OGC标准。
@JS('TileLayer.WMS')
class WMS extends TileLayer {
  external WMS(WMSLayerOptions opts);

  // 设置WMS图层的参数
  external setParams(Object params);

  // 获取WMS图层的参数
  external Object getParams();

  // 设置WMS图层的url
  external setUrl(String url);

  // 获取WMS图层的url
  external String getUrl();

  // 获取WMS图层的选项
  external WMSLayerOptions getOptions();

  // 获取图层的zIndex
  external int getzIndex();

  // 设置图层的zIndex
  external setzIndex(int zIndex);

  // 获取图层的透明度
  external double getOpacity();

  // 设置图层的透明度
  external setOpacity(double opacity);

  // 获取图层支持的缩放级别
  external List<int> getZooms();

  // 设置图层支持的缩放级别
  external setZooms(List<int> zooms);

  // 显示图层
  external show();

  // 隐藏图层
  external hide();
}

// WMS图层的选项类
@JS()
@anonymous
class WMSLayerOptions {
  external factory WMSLayerOptions({
    String url,
    bool blend,
    Object params,
    List<int> zooms,
    double opacity,
    bool visible,
    int zIndex,
  });
}
