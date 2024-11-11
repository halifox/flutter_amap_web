@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

//驾车路线规划服务，提供起、终点坐标的驾车导航路线查询功能。AMap. Driving构造函数的参数为 DrivingOptions 对象。DrivingOptions 允许设置驾车策略和返回信息详略。用户可以通过自定义回调函数取回并显示查询结果。若服务请求失败，系统将返回错误信息
@JS()
class Driving {
  external Driving(DrivingOptions opts);

  //根据起点、终点和途经点（可选）坐标或名称，实现驾车路线规划，途经点通过opts设定
  //
  // 参数说明：
  // origin (LngLat) 起点经纬度
  // destination (LngLat) 终点经纬度
  // opts (Object)
  // 属性	描述
  // opts.waypoints
  // 类型：Array<LngLat>	途径点,最多支持16个
  // callback (DrivingCallback) status为complete时，result为DrivingResult；当status为error时，result为错误信息info；当status为no_data时，代表检索返回0结果。
  external search(LngLat origin, LngLat destination, DrivingSearchOptions opts,
      ResultCallback<DrivingResult> callback);

// external search(List<dynamic> points, ResultCallback<DrivingResult> callback);
}

// map 类型：Map	AMap.Map对象, 展现结果的地图实例。当指定此参数后，搜索结果的标注、线路等均会自动添加到此地图上。可选
// policy 类型：number?	驾车路线规划策略
// extensions 类型：string default 'base'	默认值：base，返回基本地址信息\n当取值为：all，返回DriveStep基本信息+DriveStep详细信息
// ferry 类型：number default 0	默认为0，表示可以使用轮渡，为1的时候表示不可以使用轮渡
// panel 类型：(string | HTMLElement)?	结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
// hideMarkers 类型：boolean default false	设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标\n默认值为：false
// showTraffic 类型：boolean?	设置是否显示实时路况信息，默认设置为true。 显示绿色代表畅通，黄色代表轻微拥堵，红色代表比较拥堵，灰色表示无路况信息。
// province 类型：string?	车牌省份的汉字缩写，用于判断是否限行，与number属性组合使用，可选。例如：京
// number 类型：string?	除省份之外车牌的字母和数字，用于判断限行相关，与province属性组合使用，可选。例如:NH1N11
// isOutline 类型：boolean?	使用map属性时，绘制的规划线路是否显示描边。缺省为true
// outlineColor 类型：string?	使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
// autoFitView 类型：boolean?	用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
@JS()
@anonymous
class DrivingOptions {
  external factory DrivingOptions({
    AMap map,
    int policy,
    String extensions,
    int ferry,
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

@JS()
@anonymous
class DrivingSearchOptions {
  external factory DrivingSearchOptions({
    List<LngLat> waypoints,
  });
}

// info (string) : 成功状态说明
// origin (LngLat) : 驾车规划起点坐标
// destination (LngLat) : 驾车规划终点坐标
// start (Poi) : 驾车规划起点
// end (Poi) : 驾车规划终点
// waypoints (Poi) : 驾车规划途经点
// taxi_cost (number) : 打车费用，仅extensions为“all”时返回. 单位: 元
// routes (Array<DriveRoute>) : 驾车规划路线列表
@JS()
@anonymous
class DrivingResult {
  external factory DrivingResult({
    String info,
    LngLat origin,
    LngLat destination,
    Poi start,
    Poi end,
    Poi waypoints,
    int taxi_cost,
    List<DriveRoute> routes,
  });

  external String get info;

  external LngLat get origin;

  external LngLat get destination;

  external Poi get start;

  external Poi get end;

  external Poi get waypoints;

  external int get taxi_cost;

  external List<DriveRoute> get routes;
}

// 	驾车规划路线列表元素
// distance类型：number	起点到终点的驾车距离，单位：米
// time类型：number	时间预计，单位：秒
// policy类型：string	驾车规划策略
// tolls类型：number	此驾车路线收费金额，单位：元
// tolls_distance类型：number	收费路段长度，单位：米
// restriction类型：number	限行结果,0 代表限行已规避或未限行，即该路线没有限行路段,1 代表限行无法规避，即该线路有限行路段
@JS()
@anonymous
class DriveRoute {
  external factory DriveRoute({
    int distance,
    int time,
    String policy,
    int tolls,
    int tolls_distance,
    int restriction,
    List<dynamic /*DriveStepBasic | DriveStepDetail*/ > steps,
  });

  external int get distance;

  external int get time;

  external String get policy;

  external int get tolls;

  external int get tolls_distance;

  external int get restriction;

  external List<dynamic /*DriveStepBasic | DriveStepDetail*/ > get steps;
}

//DriveStep 对象(基本信息)
//
// 属性说明：
// start_location (LngLat) : 此路段起点
// end_location (LngLat) : 此路段终点
// instruction (string) : 此路段说明，如“沿北京南站路行驶565米右转”
// action (string) : 本驾车子路段完成后动作
// assist_action (string) : 驾车子路段完成后辅助动作，一般为到达某个目的地时返回
// orientation (string) : 驾车方向
// road (string) : 驾车方向
// distance (number) : 此路段距离，单位：米
// tolls (number) : 此段收费，单位：元
// tolls_distance (number) : 收费路段长度，单位：米
// toll_road (string) : 主要收费道路
// time (number) : 此路段预计使用时间，单位：秒
// path (Array<LngLat>) : 此路段坐标集合
@JS()
@anonymous
class DriveStepBasic {
  external factory DriveStepBasic({
    LngLat startLocation,
    LngLat endLocation,
    String instruction,
    String action,
    String assistAction,
    String orientation,
    String road,
    double distance,
    double tolls,
    double tollsDistance,
    String tollRoad,
    double time,
    List<LngLat> path,
  });

  external LngLat get startLocation;

  external LngLat get endLocation;

  external String get instruction;

  external String get action;

  external String get assistAction;

  external String get orientation;

  external String get road;

  external double get distance;

  external double get tolls;

  external double get tollsDistance;

  external String get tollRoad;

  external double get time;

  external List<LngLat> get path;
}

// DriveStep 对象(详细信息)
// cities (Array<ViaCity>) : 途径城市列表
// tmcs (Array<TMC>) : 实时交通信息列表
@JS()
@anonymous
class DriveStepDetail {
  external factory DriveStepDetail({
    List<ViaCity> cities,
    List<TMC> tmcs,
  });

  external List<ViaCity> get cities;

  external List<TMC> get tmcs;
}

// cities.city.name
// 类型：string	途径名称
// cities.city.citycode
// 类型：string	城市编码
// cities.city.adcode
// 类型：string	区域编码
// cities.city.districts
// 类型：Array<District>	途径行政区列表
@JS()
@anonymous
class ViaCity {
  external factory ViaCity({
    String name,
    String cityCode,
    String adCode,
    List<District> districts,
  });

  external String get name;

  external String get cityCode;

  external String get adCode;

  external List<District> get districts;
}

// cities.city.districts.district.name
// 类型：string	区域名称
// cities.city.districts.district.adcode
// 类型：string	区域编码
@JS()
@anonymous
class District {
  external factory District({
    String name,
    String adCode,
  });

  external String get name;

  external String get adCode;
}

// 实时交通信息列表
// tmcs.tmc
// 类型：TMC	实时交通信息列表元素
// tmcs.tmc.lcode
// 类型：string	路况信息对应的编码 如果direction是正向 lcode返回值大于0；否则lcode，返回值小于0； 如果返回0则说明此路段无lcode
// tmcs.tmc.distance
// 类型：number	此lcode对应的路段长度，单位: 米
// tmcs.tmc.status
// 类型：string	路况状态，可能的值有：未知，畅通，缓行，拥堵
@JS()
@anonymous
class TMC {
  external factory TMC({
    String lCode,
    int distance,
    String status,
  });

  external String get lCode;

  external int get distance;

  external String get status;
}
