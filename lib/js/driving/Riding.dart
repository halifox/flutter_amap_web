@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 骑行路径规划服务，提供起始、终点骑行路线查询服务。
// 用户可以通过自定义回调函数取回并显示查询结果。
// 若服务请求失败，系统将返回错误信息。
@JS()
class Riding {
  external Riding(RidingOptions opts);

  //根据起点和终点坐标，进行公交换乘查询
  external search(
      LngLat origin, LngLat destination, ResultCallback<RidingResult> callback);
}

// map 类型：Map   AMap.Map对象, 展现结果的地图实例。当指定此参数后，搜索结果的标注、线路等均会自动添加到此地图上。可选参数
// policy 类型：Number   骑行路线规划策略；可选值为：0：推荐路线及最快路线综合；1：推荐路线；2：最快路线，默认值：0
// panel 类型：String|HTMLElement   结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选参数
// hideMarkers 类型：Boolean   设置隐藏路径规划的起始点图标，设置为true：隐藏图标；设置false：显示图标 默认值为：false
// isOutline 类型：Boolean   使用map属性时，绘制的规划线路是否显示描边。缺省为true
// outlineColor 类型：String   使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
// autoFitView 类型：Boolean   用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
@JS()
@anonymous
class RidingOptions {
  external factory RidingOptions({
    Map map,
    int policy,
    dynamic panel,
    bool hideMarkers,
    bool isOutline,
    String outlineColor,
    bool autoFitView,
  });
}

// info 类型：String   成功状态说明，描述返回结果的状态信息
// origin 类型：LngLat   骑行导航起点坐标，表示起点的经纬度位置
// destination 类型：LngLat   骑行导航终点坐标，表示终点的经纬度位置
// start 类型：Poi   骑行导航起点，表示起点的详细信息（如名称、位置等）
// end 类型：Poi   骑行导航终点，表示终点的详细信息（如名称、位置等）
// count 类型：Number   骑行导航路段数目，表示路径规划中涉及的路段数量
// routes 类型：Array.<RideRoute>   骑行规划路线列表，包含多个骑行路线信息
@JS()
@anonymous
class RidingResult {
  external factory RidingResult({
    String info,
    LngLat origin,
    LngLat destination,
    Poi start,
    Poi end,
    int count,
    List<RideRoute> routes,
  });
}

// distance 类型：Number   起点到终点总步行距离，单位：米
// time 类型：Number   步行时间预计，单位：秒
// rides 类型：Array.<RideStep>   路段列表，以道路名称作为分段依据，将整个骑行导航方案分隔成若干路段
@JS()
@anonymous
class RideRoute {
  external factory RideRoute({
    int distance,
    int time,
    List<RideStep> rides,
  });
}

// start_location 类型：LngLat   本路段的起点坐标，表示此路段的起始位置
// end_location 类型：LngLat   本路段的终点坐标，表示此路段的结束位置
// instruction 类型：String   此路段说明，描述骑行的具体动作，如“沿北京南站路骑行565米右转”
// distance 类型：Number   此路段距离，单位：米
// time 类型：Number   此路段预计使用时间，单位：秒
// path 类型：Array.<LngLat>   此路段坐标集合，表示骑行路线的各个坐标点
// action 类型：String   本骑行子路段完成后动作，描述该路段完成后的动作
// assist_action 类型：String   本骑行子路段完成后辅助动作，一般为到达某个目的地时返回
// orientation 类型：String   步行方向，描述骑行的方向
// road 类型：String   道路名称，描述此路段所在的道路
@JS()
@anonymous
class RideStep {
  external factory RideStep({
    LngLat startLocation,
    LngLat endLocation,
    String instruction,
    int distance,
    int time,
    List<LngLat> path,
    String action,
    String assistAction,
    String orientation,
    String road,
  });
}
