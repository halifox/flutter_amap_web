@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

//公交换乘服务，提供起始点公交路线规划服务，目前公交换乘仅支持同一城市的公交路线规划，跨城市出行规划请参考驾车导航查询。
// 公交换乘查询返回结果整合步行信息，若换乘路段（Segment）换乘类型为地铁 “SUBWAY”，则至少包含一条地铁口信息（SubwayEntrance）。
// 用户可以通过自定义回调函数取回并显示查询结果。若服务请求失败，系统将返回错误信息。
@JS()
class Transfer {
  external Transfer(TransferOptions opts);

  //根据起点和终点坐标，进行公交换乘查询
  external search(LngLat origin, LngLat destination,
      ResultCallback<TransferResult> callback);
}

// map 类型：：Map	AMap.Map对象, 展现结果的地图实例。当指定此参数后，搜索结果的标注、线路等均会自动添加到此地图上。可选
// city 类型：：string	公交换乘的城市，支持城市名称、城市区号、电话区号，此项为必填
// policy 类型：：number	公交换乘策略strategy
// nightflag 类型：：boolean default false	是否计算夜班车，默认为不计算。true：计算，false：不计算
// extensions 类型：：string default 'base'	默认值：base，返回基本地址信息\n当取值为：all，返回DriveStep基本信息+DriveStep详细信息
// panel 类型：：(string | HTMLElement)?	结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
// hideMarkers 类型：：boolean default false	设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标\n默认值为：false
// isOutline 类型：：boolean?	使用map属性时，绘制的规划线路是否显示描边。缺省为true
// outlineColor 类型：：string?	使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
// autoFitView 类型：：boolean?	用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
@JS()
@anonymous
class TransferOptions {
  external factory TransferOptions({
    AMap map,
    String city,
    int policy,
    bool nightflag,
    String extensions,
    String panel,
    bool hideMarkers,
    bool isOutline,
    String outlineColor,
    bool autoFitView,
  });
}

// info 类型：String   成功状态说明，描述返回结果的状态信息
// origin 类型：LngLat   公交换乘起点坐标，表示起点的经纬度位置
// destination 类型：LngLat   公交换乘终点坐标，表示终点的经纬度位置
// start 类型：Poi   公交换乘起点，表示起点的详细信息（如名称、位置等）
// end 类型：Poi   公交换乘终点，表示终点的详细信息（如名称、位置等）
// taxi_cost 类型：Number   出租车费用，单位为元，表示从起点到终点的出租车费用
// plans 类型：Array.<TransferPlan>   换乘方案列表，包含一系列的公交换乘方案信息

@JS()
@anonymous
class TransferResult {
  external factory TransferResult({
    String info,
    LngLat origin,
    LngLat destination,
    Poi start,
    Poi end,
    int taxiCost,
    List<TransferPlan> plans,
  });
}

// cost 类型：Number   换乘方案价格，单位为元
// time 类型：Number   预期时间，单位为秒
// distance 类型：Number   此换乘方案全程距离，单位：米
// nightLine 类型：Boolean   是否夜间线路
// walking_distance 类型：Number   此方案总步行距离，单位：米
// transit_distance 类型：Number   此方案公交行驶距离，单位：米
// railway_distance 类型：Number   此方案火车行驶距离，单位：米
// taxi_distance 类型：Number   此方案出租车行驶距离，单位：米
// path 类型：Array.<LngLat>   此换乘方案的路径坐标集合
// segments 类型：Array.<Segment>   换乘路段列表，将整个换乘方案分隔成若干 Segment（换乘路段）

@JS()
@anonymous
class TransferPlan {
  external factory TransferPlan({
    int cost,
    int time,
    int distance,
    bool nightLine,
    int walkingDistance,
    int transitDistance,
    int railwayDistance,
    int taxiDistance,
    List<LngLat> path,
    List<Segment> segments,
  });
}

// instruction 类型：String   换乘段的文字描述
// transit_mode 类型：String   换乘动作类型（BUS、SUBWAY、WALK、METRO_RAIL、RAILWAY、TAXI）
// time 类型：Number   换乘段预期用时，单位：秒
// transit 类型：TransitDetails | WalkDetails   换乘段导航信息，根据 transit_mode 的不同返回相应的详细信息
// distance 类型：Number   换乘段距离，单位：米

@JS()
@anonymous
class Segment {
  external factory Segment({
    String instruction,
    String transitMode,
    int time,
    dynamic transit,
    int distance,
  });
}

// origin 类型：LngLat   步行起点坐标
// destination 类型：LngLat   步行终点坐标
// steps 类型：Array.<WalkStep>   步行子路段WalkStep列表
// path 类型：Array.<LngLat>   步行坐标集合

@JS()
@anonymous
class WalkDetails {
  external factory WalkDetails({
    LngLat origin,
    LngLat destination,
    List<WalkStep> steps,
    List<LngLat> path,
  });
}

// // instruction 类型：String   步行子路段描述
// // distance 类型：Number   步行子路段距离，单位：米
// // time 类型：Number   步行子路段预计使用时间，单位：秒
// // path 类型：Array.<LngLat>   步行子路段坐标集合
// // road 类型：String   步行的道路名称
// // action 类型：String   步行子路段完成后的动作
// // assist_action 类型：String   步行子路段完成后的辅助动作
//
// @JS()
// @anonymous
// class WalkStep {
//   external factory WalkStep({
//     String instruction,
//     int distance,
//     int time,
//     List<LngLat> path,
//     String road,
//     String action,
//     String assistAction,
//   });
// }

// on_station 类型：Stop   此换乘段的上车站
// off_station 类型：Stop   此换乘段的下车站
// lines 类型：Array.<TransitLine>   此换乘段公交路线
// via_num 类型：Number   途径公交站点数（不包括上车站和下车站）
// via_stops 类型：Array.<Stop>   途径公交站点集合（不包括上车站和下车站）
// path 类型：Array.<LngLat>   此换乘段公交部分（上车站-下车站）坐标集合
// entrance 类型：SubwayEntrance   地铁站入口
// exit 类型：SubwayEntrance   地铁站出口

@JS()
@anonymous
class TransitDetails {
  external factory TransitDetails({
    Stop onStation,
    Stop offStation,
    List<TransitLine> lines,
    int viaNum,
    List<Stop> viaStops,
    List<LngLat> path,
    SubwayEntrance entrance,
    SubwayEntrance exit,
  });
}

// name 类型：String   线路名称
// id 类型：String   线路id编码
// type 类型：String   线路车次类型，参考火车路线类型列表
// trip 类型：Number   线路车次号
// time 类型：Number   该线路车段耗时
// departure_stop 类型：Rail_Stop   火车始发站信息
// alters 类型：Array.<Alter>   聚合的备选方案，extensions=all时返回
// arrival_stop 类型：Rail_Stop   火车到站信息
// via_stops 类型：Array.<Via_Stop>   途经站点信息，extensions=all时返回
// spaces 类型：Array.<Space>   仓位及价格信息
// distance 类型：Number   该换乘段的行车总距离

@JS()
@anonymous
class RailwayDetails {
  external factory RailwayDetails({
    String name,
    String id,
    String type,
    int trip,
    int time,
    Rail_Stop departureStop,
    List<Alter> alters,
    Rail_Stop arrivalStop,
    List<Via_Stop> viaStops,
    List<Space> spaces,
    int distance,
  });
}

// origin 类型：LngLat   打车起点坐标
// destination 类型：LngLat   打车终点坐标
// distance 类型：Number   总距离，单位：米
// time 类型：Number   耗时，单位：秒
// sname 类型：String   起点名称
// tname 类型：String   终点名称

@JS()
@anonymous
class TaxiDetails {
  external factory TaxiDetails({
    LngLat origin,
    LngLat destination,
    int distance,
    int time,
    String sname,
    String tname,
  });
}

// name 类型：String   公交路线名
// id 类型：String   公交路线ID
// type 类型：String   公交类型，参考公交类型列表
// stime 类型：String   公交路线首班车时间
// etime 类型：String   公交路线末班车时间

@JS()
@anonymous
class TransitLine {
  external factory TransitLine({
    String name,
    String id,
    String type,
    String stime,
    String etime,
  });
}

// name 类型：String   地铁口名称
// location 类型：LngLat   地铁口经纬度坐标

@JS()
@anonymous
class SubwayEntrance {
  external factory SubwayEntrance({
    String name,
    LngLat location,
  });
}

// name 类型：String   公交站点名称
// id 类型：String   公交站点ID
// location 类型：LngLat   站点经纬度信息

@JS()
@anonymous
class Stop {
  external factory Stop({
    String name,
    String id,
    LngLat location,
  });
}

// name 类型：String   途径车站点名称
// id 类型：String   途经车站点ID
// location 类型：LngLat   站点经纬度信息
// wait 类型：Number   途径站点停靠时间，单位：分钟
// time 类型：Number   进站时间，若大于24:00，表示跨天

@JS()
@anonymous
class Via_Stop {
  external factory Via_Stop({
    String name,
    String id,
    LngLat location,
    int wait,
    int time,
  });
}

// name 类型：String   上、下车站点名称
// id 类型：String   上、下车站点ID
// location 类型：LngLat   上、下站点经纬度信息
// adcode 类型：Number   上、下车站点所在城市的adcode
// time 类型：Number   上下车点发车时间

@JS()
@anonymous
class Rail_Stop {
  external factory Rail_Stop({
    String name,
    String id,
    LngLat location,
    int adcode,
    int time,
  });
}

// type 类型：Number   仓位编码，参考仓位级别表
// cost 类型：Number   仓位费用

@JS()
@anonymous
class Space {
  external factory Space({
    int type,
    int cost,
  });
}

// id 类型：Number   备选方案ID
// name 类型：String   备选线路名称

@JS()
@anonymous
class Alter {
  external factory Alter({
    int id,
    String name,
  });
}
