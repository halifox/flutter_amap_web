@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

//步行路线规划服务，提供起、终点坐标的驾车导航路线查询功能。AMap. Driving构造函数的参数为 DrivingOptions 对象。DrivingOptions 允许设置驾车策略和返回信息详略。用户可以通过自定义回调函数取回并显示查询结果。若服务请求失败，系统将返回错误信息
@JS()
class Walking {
  external Walking(WalkingOptions opts);

  //根据起点、终点坐标，实现步行路线规划
  external search(LngLat origin, LngLat destination,
      ResultCallback<WalkingResult> callback);
}

// map 类型：Map	AMap.Map对象, 展现结果的地图实例。当指定此参数后，搜索结果的标注、线路等均会自动添加到此地图上。可选
// panel 类型：(string | HTMLElement)?	结果列表的HTML容器id或容器元素，提供此参数后，结果列表将在此容器中进行展示。可选
// hideMarkers 类型：boolean default false	设置隐藏路径规划的起始点图标 设置为true：隐藏图标；设置false：显示图标\n默认值为：false 显示绿色代表畅通，黄色代表轻微拥堵，红色代表比较拥堵，灰色表示无路况信息。
// isOutline 类型：boolean?	使用map属性时，绘制的规划线路是否显示描边。缺省为true
// outlineColor 类型：string?	使用map属性时，绘制的规划线路的描边颜色。缺省为'white'
// autoFitView 类型：boolean?	用于控制在路径规划结束后，是否自动调整地图视野使绘制的路线处于视口的可见范围
@JS()
@anonymous
class WalkingOptions {
  external factory WalkingOptions({
    AMap map,
    String panel,
    bool hideMarkers,
    bool isOutline,
    String outlineColor,
    bool autoFitView,
  });
}

// info (string) : 成功状态说明
// origin (LngLat) : 步行规划起点坐标
// destination (LngLat) : 步行规划终点坐标
// start (Poi) : 步行规划起点
// end (Poi) : 步行规划终点
// count (number) : 步行导航路段数目
// routes (Array<WalkRoute>) : 步行规划路线列表
@JS()
@anonymous
class WalkingResult {
  external factory WalkingResult({
    String info,
    LngLat origin,
    LngLat destination,
    Poi start,
    Poi end,
    int count,
    List<WalkRoute> routes,
  });
}

// 步行规划路线
// distance 类型：number	起点到终点总步行距离，单位：米
// time 类型：number	步行时间预计，单位：秒
// steps 类型：Array<WalkStep>	路段列表，以道路名称作为分段依据，将整个步行导航方案分隔成若干路段
@JS()
@anonymous
class WalkRoute {
  external factory WalkRoute({
    int distance,
    int time,
    List<WalkStep> steps,
  });
}

// 路段
// instruction 类型：string	步行子路段描述,规则：沿 road步行 distance 米 action，例：”沿北京站街步行351米”
// distance 类型：number	步行子路段距离，单位：米
// time 类型：number	步行子路段预计使用时间，单位：秒
// path 类型：Array<LngLat>	步行子路段坐标集合
// road 类型：string	道路
// action 类型：string	本步行子路段完成后动作
// assist_action 类型：string	步行子路段完成后辅助动作，一般为到达某个公交站点或目的地时返回
@JS()
@anonymous
class WalkStep {
  external factory WalkStep({
    String instruction,
    double distance,
    double time,
    List<LngLat> path,
    String road,
    String action,
    String assistAction,
  });
}
