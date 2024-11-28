@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.DragRoute 是一个拖拽路线规划服务，用于展示起点、途经点、终点的拖拽路线，并允许用户拖拽调整路径。
// 该服务支持配置地图对象、路径、驾车策略及其他个性化的选项。
@JS()
class DragRoute {
  external DragRoute(
      AMap map, List<LngLat> path, String policy, DragRouteOptions opts);

  // 开始拖拽路线的查询，并启用拖拽功能
  external search();

  // 获取所有规划路线的选择方式
  external getWays();

  // 获取规划路线的详细信息
  external getRoute();

  // 销毁当前的拖拽路线实例
  external destroy();
}

// AMap.DragRoute 的配置选项，包括路线属性、标记样式、实时路况信息等。
@JS()
@anonymous
class DragRouteOptions {
  external factory DragRouteOptions({
    PolylineOptions polyOption,
    MarkerOptions startMarkerOptions,
    MarkerOptions midMarkerOptions,
    MarkerOptions endMarkerOptions,
    bool showTraffic,
  });
}
