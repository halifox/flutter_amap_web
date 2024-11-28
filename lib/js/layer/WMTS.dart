@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 用于加载 OGC 标准的 WMTS 地图服务的一种图层类，仅支持 EPSG3857 坐标系统的 WMTS 图层
@JS('TileLayer.WMTS')
class WMTS {
  external WMTS(WMTSLayerOptions opts);

  external setParams(Object params);

  external getParams();

  external getUrl();

  external setUrl(String url);

  external getOptions();

  external getzIndex();

  external setzIndex(int zIndex);

  external getOpacity();

  external setOpacity(double opacity);

  external getZooms();

  external setZooms(List<int> zooms);

  external show();

  external hide();
}

// WMTS 图层参数
@JS()
@anonymous
class WMTSLayerOptions {
  external factory WMTSLayerOptions({
    String url,
    bool blend,
    Object params,
    List<int> zooms,
    double opacity,
    bool visible,
    int zIndex,
  });
}
