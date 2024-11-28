@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 驾车路线规划服务，提供起、终点坐标的驾车导航路线查询功能。
// AMap. Driving构造函数的参数为 DrivingOptions 对象。
// DrivingOptions 允许设置驾车策略和返回信息详略。
// 用户可以通过自定义回调函数取回并显示查询结果。
// 若服务请求失败，系统将返回错误信息。
@JS()
class TruckDriving {
  external TruckDriving(TruckDrivingOptions opts);

  // 根据起点、终点坐标，实现驾车路线规划
  external search(LngLat origin, LngLat destination,
      ResultCallback<TruckDrivingResult> callback);

  // 清除当前路线规划
  external clear();

  // 根据一组坐标点搜索驾车路线
  external searchPoints(List<LngLat> points, ResultCallback<TruckDrivingResult> callback);

  // 设置车牌省份和车牌号，以用于限行查询
  external setProvinceAndNumber(String province, String number);

  // 设置路线规划策略
  external setPolicy(int policy);
}

// opts (TruckDrivingOptions) 参数信息
@JS()
@anonymous
class TruckDrivingOptions {
  external factory TruckDrivingOptions({
    AMap map,
    int policy,
    int size,
    double width,
    double height,
    double load,
    double weight,
    int axlesNum,
    String extensions,
    String panel,
    bool hideMarkers,
    bool showTraffic,
    String province,
    String number,
    bool isOutline,
    String outlineColor,
    bool autoFitView,
  });
}

// info (string) : 成功状态说明
// origin (LngLat) : 驾车规划起点坐标
// destination (LngLat) : 驾车规划终点坐标
// start (Poi) : 驾车规划起点
// end (Poi) : 驾车规划终点
// count (number) : 驾车导航路段数目
// routes (Array<DriveRoute>) : 驾车规划路线列表
@JS()
@anonymous
class TruckDrivingResult {
  external factory TruckDrivingResult({
    String info,
    LngLat origin,
    LngLat destination,
    Poi start,
    Poi end,
    int count,
    List<DriveRoute> routes,
  });
}