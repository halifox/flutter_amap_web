@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';
import 'package:js/js.dart';

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
  });
}
