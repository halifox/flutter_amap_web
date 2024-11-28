@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 可拖拽货车路径规划
@JS()
class DragRouteTruck {
  external DragRouteTruck(DragRouteTruckOptions opts);

  // 根据指定的起点和终点位置，执行货车路径规划
  external search(List<LngLat> locations);

  // 更新拖拽后的路径
  external updatePath();

  // 获取规划的路径
  external getRoute();

  // 获取路线方式
  external getWays();

  // 销毁拖拽路径规划
  external destroy();

  // 设置避免区域
  external setAvoidPolygons(List<Polygon> areas);

  // 清除避免区域
  external clearAvoidPolygons();

  // 获取避免区域
  external getAvoidPolygons();

  // 设置配置选项
  external setOption(DragRouteTruckOptions opts);
}

// 配置项：提供拖拽路径规划的设置
@JS()
@anonymous
class DragRouteTruckOptions {
  external factory DragRouteTruckOptions({
    Map map, // 指定的地图对象
    PolylineOptions polyOption, // 设置拖拽路线插件的路线属性对象，包括线样式、宽度、颜色等，参考 PolylineOptions 列表
    MarkerOptions startMarkerOptions, // 设置起点点标记属性对象，包括点标记样式、大小等
    MarkerOptions midMarkerOptions, // 设置途经点标记属性对象，包括点标记样式、大小等
    MarkerOptions endMarkerOptions, // 设置终点点标记属性对象，包括点标记样式、大小等
    bool showTraffic, // 设置显示实时路况信息，true表示显示，false表示不显示
    int policy, // 设置驾车路线规划策略，具体值如下：
    // 1：躲避拥堵；2：不走高速；3：避免收费；4：躲避拥堵且不走高速；5：避免收费且不走高速；
    // 6：躲避拥堵且避免收费；7：躲避拥堵且避免收费且不走高速；8：高速优先；9：躲避拥堵且高速优先
    double size, // 车型大小，必填，1-4分别对应小型至大型
    double width, // 宽度，缺省2.5米
    double height, // 高度，缺省1.6米
    double load, // 载重，缺省0.9t
    double weight, // 自重，缺省10t
    int axlesNum, // 轴数，缺省2轴
    String extensions, // 默认返回基本地址信息，取值为"all"时返回DriveStep详细信息
    String panel, // 结果列表的HTML容器id或容器元素，可选
    bool hideMarkers, // 设置隐藏起始点图标，默认false
    String province, // 车牌省份的汉字缩写，用于判断是否限行
    String number, // 车牌的字母和数字，用于判断限行
    bool isOutline, // 绘制的规划线路是否显示描边，缺省为true
    String outlineColor, // 规划线路的描边颜色，缺省为'white'
    bool autoFitView, // 控制是否自动调整地图视野使绘制的路线处于视口的可见范围
    int cartype, // 车辆类型，0为普通货车（默认值），1为纯电动货车，2为插电混动货车
    int showpolyline, // 是否返回路线数据，1时返回polyline数据，0时返回为空
    int nosteps, // 是否返回steps字段内容，0时返回正常，1时返回为空
    bool autoRefresh, // 拖拽后是否自动更新轨迹，默认true
    int refreshTime, // 拖拽后自动更新的延迟时间
    String apiVersion, // 支持接口版本，'v4'和'v5'
    String showFields, // 指定返回的字段，多个字段间用","分隔，具体值如下：'toll_gate'，'cameras'，'general'，'incident'
  });
}

// 路径规划信息
@JS()
@anonymous
class Route {
  external factory Route({
    double distance, // 起点到终点的总距离，单位：米
    double time, // 步行时间，单位：秒
    List<Step> steps, // 路段列表
  });
}

// 路段
@JS()
@anonymous
class Step {
  external factory Step({
    String instruction, // 路段描述，例如"沿道路走500米"
    double distance, // 步行子路段的距离，单位：米
    double time, // 步行子路段预计使用时间，单位：秒
    List<LngLat> path, // 步行子路段坐标集合
    String road, // 道路名称
    String action, // 本步行子路段完成后动作
    String assistAction, // 步行子路段完成后辅助动作
  });
}
