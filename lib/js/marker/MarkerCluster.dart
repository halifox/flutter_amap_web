@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 用于展示大量点标记，将点标记按照距离进行聚合，以提高绘制性能。点聚合支持用户自定义样式，以插件形式调用。
@JS()
class MarkerCluster {
  external MarkerCluster(AMap map, List<Map<String, dynamic>> dataOptions, MarkerClusterOptions markerClusterOptions);

  // 添加新的点数据
  external addData(List<Map<String, dynamic>> dataOptions);

  // 设置点数据
  external setData(List<Map<String, dynamic>> dataOptions);

  // 获取聚合点的数量
  external int getClustersCount();

  // 获取网格大小
  external int getGridSize();

  // 设置网格大小
  external setGridSize(int size);

  // 获取最大聚合级别
  external int getMaxZoom();

  // 设置最大聚合级别
  external setMaxZoom(int zoom);

  // 设置聚合点样式
  external setStyles(Map<String, dynamic> styles);

  // 获取聚合点样式
  external Map<String, dynamic> getStyles();

  // 获取地图对象
  external Map getMap();

  // 设置地图对象
  external setMap(Map map);

  // 获取是否使用平均中心
  external bool isAverageCenter();

  // 设置是否使用平均中心
  external setAverageCenter(bool averageCenter);
}

// 点聚合属性设置
@JS()
@anonymous
class MarkerClusterOptions {
  external factory MarkerClusterOptions({
    int gridSize,
    int maxZoom,
    bool averageCenter,
    bool clusterByZoomChange,
    List<Map<String, dynamic>> styles,
    Function renderClusterMarker,
    Function renderMarker,
  });
}

// 图标样式的元素定义
@JS()
@anonymous
class MarkerClusterStyle {
  external factory MarkerClusterStyle({
    String url,
    AMapSize size,
    AMapPixel offset,
    AMapPixel imageOffset,
    String textColor,
    int textSize,
  });
}

// AMap的尺寸
@JS()
@anonymous
class AMapSize {
  external factory AMapSize(int width, int height);
}

// AMap的像素
@JS()
@anonymous
class AMapPixel {
  external factory AMapPixel(int x, int y);
}
