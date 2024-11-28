@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 轨迹纠偏服务插件。用于将一组带方向的、可能偏离道路的经纬度轨迹，纠正为准确沿着道路的一条经纬度路径。
// 比如根据间隔采集的车辆位置和朝向信息生成行驶轨迹。
@JS()
class GraspRoad {
  external GraspRoad();

  // driving 方法用于纠正经纬度轨迹，确保轨迹沿着道路。
  // 参数：
  // - OriginPath: 原始轨迹路径数据，包含一组经纬度点。
  // - callback: 纠偏完成后的回调函数，处理返回的纠偏路径。
  external driving(List<LngLat> OriginPath, GraspRoadCallback callback);
}

// GraspRoadCallback 类型：Function
// 轨迹纠偏完成后的回调函数，返回错误信息或纠偏后的路径数据。
// 参数说明：
// - err (Object): 错误信息，成功时为空。
// - GraspedPath (Object): 纠偏后的轨迹数据，详见下文。
@JS()
typedef GraspRoadCallback = void Function(Object err, GraspedPath GraspedPath);

// GraspedPath 纠偏后的轨迹数据结构。
// - distance: 总距离，单位：米。
// - data: 轨迹点数据，包括纠偏后的所有轨迹点。
@JS()
@anonymous
class GraspedPath {
  external factory GraspedPath({
    double distance,
    GraspedPathData data,
  });
}

// 轨迹点数据，包含纠偏后的经纬度信息。
// - points: 纠偏后的轨迹点列表，每个轨迹点包含经纬度。
@JS()
@anonymous
class GraspedPathData {
  external factory GraspedPathData({
    List<GraspedPoint> points,
  });
}

// 轨迹点结构。
// - x: 经度。
// - y: 纬度。
@JS()
@anonymous
class GraspedPoint {
  external factory GraspedPoint({
    double x, // 经度
    double y, // 纬度
  });
}
