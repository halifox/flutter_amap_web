@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 热力图，基于第三方heatmap.js实现，以特殊高亮的形式显示数据密集程度。
// 根据密集程度的不同，图上会呈现不同的颜色，以直观的形式展现数据密度。
// API引用了heatmap.js最新版本v2.0，v2.0基于新的渲染模型，具有更高的渲染效率和更强的性能。
// 支持chrome、firefox、safari、ie9及以上浏览器。
@JS()
class HeatMap {
  external HeatMap(Map map, HeatMapOptions opts);

  // 获取当前的地图对象
  external Map getMap();

  // 设置热力图叠加的地图对象
  external setMap(Map map);

  // 获取热力图的配置选项
  external HeatMapOptions getOptions();

  // 设置热力图的配置选项
  external setOptions(HeatMapOptions options);

  // 获取热力图数据集
  external getDataSet();

  // 设置热力图数据集
  external setDataSet(DataSet dataset);

  // 添加数据点
  external addDataPoint(double longitude, double latitude, int count);

  // 获取热力图的z-index
  external getzIndex();

  // 设置热力图的z-index
  external setzIndex(int zIndex);

  // 显示热力图
  external show();

  // 隐藏热力图
  external hide();
}

// 热力图配置选项，包含以下属性：
// - radius: 热力图中单个点的半径，单位：pixel，默认值为 30
// - gradient: 热力图的渐变区间，按照设置的颜色和间隔显示，默认是 heatmap.js 标准配色方案
// - opacity: 热力图透明度区间数组，范围：[0,1]，默认值为 [0,1]
// - zooms: 支持的缩放级别范围，取值范围：[3-20]，默认值为 [3,20]
// - visible: 是否可见
// - zIndex: 热力图层在地图上的叠加顺序，默认值为 130
// - 3d: 3D 热力图的配置
@JS()
@anonymous
class HeatMapOptions {
  external factory HeatMapOptions({
    int radius,
    Map<String, String> gradient,
    List<double> opacity,
    List<int> zooms,
    bool visible,
    int zIndex,
    HeatMap3DOptions? o3d,
  });
}

// 3D 热力图的配置选项，包含以下属性：
// - heightScale: 高度缩放因子，默认为 1
// - heightBezier: 影响高度平滑度的贝塞尔曲线因子，默认为 [0.5, 0, 1, 0.5]
// - gridSize: 取样精度，越小越平滑，越大性能越高
@JS()
@anonymous
class HeatMap3DOptions {
  external factory HeatMap3DOptions({
    double heightScale,
    List<double> heightBezier,
    int gridSize,
  });
}

// 数据集，用于存储热力图的所有数据点信息
@JS()
@anonymous
class DataSet {
  external factory DataSet({
    List<DataPoint> points,
  });
}

// 数据点，包含经纬度和热力值
@JS()
@anonymous
class DataPoint {
  external factory DataPoint({
    double longitude,
    double latitude,
    int count,
  });
}
