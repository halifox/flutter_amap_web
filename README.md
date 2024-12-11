# 🌍 推荐使用 [flutter_map](https://pub.dev/packages/flutter_map) 与 [高德地图](https://lbs.amap.com/) 瓦片数据集成 📍  

[flutter_map](https://pub.dev/packages/flutter_map) 是一个功能强大的 Flutter 地图插件。简单易学，同时完全可定制和配置，是 Flutter 应用中进行地图开发的最佳选择。

## 集成示例

```dart
FlutterMap(
  options: MapOptions(
    initialCenter: LatLng(39.90, 116.40),
    initialZoom: 17,
  ),
  children: [
    TileLayer(
      // 高德卫星 AmapSatellite
      // http://wprd04.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}&style=6
      // 高德地图 AmapTile
      // http://wprd04.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}&style=7
      // 高德路网含标注 AmapRoadMark
      // http://wprd04.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}&scl=1&style=8
      // 高德路网不含标注 AmapRoad
      // http://wprd04.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}&scl=2&style=8
      urlTemplate: 'http://{s}.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}&style=7',
      subdomains: ['wprd01', 'wprd02', 'wprd03', 'wprd04'],
    ),
  ],
)
```

---

# ~~高德地图 Flutter Web 插件~~

本插件为 **专为 Flutter Web 平台** 设计的高德地图插件，旨在简化在 Web 环境下使用高德地图的过程。通过此插件，用户可以轻松将高德地图集成到 Flutter Web 应用中，并进行地图操作和控制。

## 重要声明

- **核心实现**：该插件的核心基于 Dart 和 JavaScript 之间的交互，通过调用高德地图 JavaScript API 实现地图功能。此插件为简易封装库，未对高德地图 JavaScript API 的所有功能进行完整封装。因此，若您需要使用高德地图的其他功能，可能需要自行扩展或修改该插件的实现。

- **功能限制**：插件无法保证对高德地图 API 所有现有功能的完全支持，尤其在不同浏览器或版本之间，可能会遇到兼容性问题或不可预见的行为。建议在使用插件之前，先了解相关的 JavaScript API 文档，以便更好地理解其工作原理。

- **使用建议**：本插件依赖 Dart 与 JavaScript 之间的交互，若您对该过程不够熟悉，建议不要直接在正式项目中使用。如果在使用过程中遇到无法解决的问题，可能需要自行调试或修改底层的 JavaScript 调用。

- **安全配置**：请确保 `securityJsCode` 和 `key` 配置为从高德平台申请的合法 API 密钥。若 API 密钥配置错误，地图功能将无法正常显示或工作。

- **Web 支持**：本插件仅支持在 Web 平台上使用。在非 Web 环境中使用将无法正常工作，因此请确保在 `index.html` 文件中正确加载高德地图 JavaScript SDK。

## 安装与配置

### 1. 在 `web/index.html` 文件中引入高德地图 JavaScript SDK

在您的 Flutter Web 项目的 `web/index.html` 文件中添加以下代码，以加载高德地图 SDK 和相关配置：

```html
<script src="https://webapi.amap.com/loader.js"></script>
```

### 2. 创建并初始化地图视图

在 Flutter 项目中，使用 `AMapView` 组件来创建和初始化地图视图。以下是一个简单的示例：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_web_amap/amap.dart';

void main() {
  setAMapSecurityConfig('********************************'); // 替换为您的高德地图 JS API securityJsCode
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AMapView(
          loaderOptions: LoaderOptions(
            key: "********************************", // 替换为您的高德地图 JS API Key
            version: '2.0', // 指定高德地图 JS SDK 的版本， 可选：1.4、2
            plugins: [...], // 配置使用的插件
          ),
          onAMapViewCreated: (AMapController controller) async {
            // 地图创建完成后的操作
          },
        ),
      ),
    );
  }
}
```

## 官方文档

[高德开放平台参考手册](https://lbs.amap.com/api/javascript-api-v2/documentation)

## 工具方法

1. `Future<T> executeAsync<T>(Function(ResultCallback<T> callback) operation)`

由于高德地图 JavaScript API 主要通过回调机制返回结果，`executeAsync` 函数将这些回调封装为异步方法，使代码更加符合 Dart 异步编程的风格，尤其适用于需要等待回调结果的操作（如定位、路径规划等）。

```dart
Geolocation geolocation = Geolocation(GeolocationOptions());

GeolocationResult result = await executeAsync<GeolocationResult>((callback) => 
  geolocation.getCurrentPosition(callback)
);

print("Latitude: ${result.position.getLat()}, Longitude: ${result.position.getLng()}");
```

## 相关资源

- [创建 Dart 与 JavaScript 交互库](https://medium.com/@thebosz/creating-a-dart-to-javascript-interop-library-c97da204c34a)
- [Dart 中 JavaScript 互操作历史](https://medium.com/dartlang/history-of-js-interop-in-dart-98b06991158f)

## 开发笔记

- 使用 `@JS()` 注解声明 API 签名：
  - `@JS` 注解用于将 Dart 类、函数或变量暴露给 JavaScript，或访问 JavaScript 中的对象。
  - 该注解可以指定一个 JavaScript 命名空间，或者直接绑定到全局 JavaScript 对象。

- 在 Dart 中调用 JavaScript 时，使用 `external` 关键字声明属性或方法，意味着这些方法或属性的实现位于 JavaScript 中，而非 Dart。

- 在 Dart 调用 JavaScript 时，若需要传递 Dart 函数作为回调，可以使用 `allowInterop` 或 `allowInteropCaptureThis`：
  - `allowInterop`：将 Dart 函数转换为可供 JavaScript 调用的函数。
  - `allowInteropCaptureThis`：处理需要捕获 `this` 上下文的情况。

- Map 类型不能直接转换为 JavaScript 对象，需使用 `@anonymous` 注解创建“匿名”类。

- 由于 JavaScript 数组实例是 `List<dynamic>`，因此需要注意检查元素类型，避免不必要的类型错误。

## 组件实现

- [x] 基础类
  - [x] LngLat
  - [x] Bounds
  - [x] Pixel
  - [x] Size
- [ ] 事件
  - [ ] Event
- [ ] 地图
  - [x] Map
  - [ ] MapsEvent
- [x] 高德官方图层
  - [x] TileLayer
  - [x] Traffic
  - [x] Satellite
  - [x] RoadNet
  - [x] Buildings
  - [x] DistrictLayer
  - [x] IndoorMap
- [x] 行业标准图层
  - [x] WMS
  - [x] WMTS
  - [x] MapboxVectorTileLayer
- [x] 自有数据图层
  - [x] HeatMap
  - [x] VectorLayer
  - [x] LabelsLayer
  - [x] CustomLayer
  - [x] Flexible
  - [x] ImageLayer
  - [x] CanvasLayer
  - [x] GLCustomLayer
- [x] 点标记
  - [x] Marker
  - [x] Text
  - [x] Icon
  - [x] LabelMarker
  - [x] ElasticMarker
  - [x] MarkerCluster
  - [x] MassMarks
  - [x] MoveAnimation
  - [ ] AnimationCallback
  - [ ] EasingCallback
- [ ] 信息窗体
  - [ ] InfoWindow
- [ ] 右键菜单
  - [ ] ContextMenu
- [x] 矢量图形
  - [x] Polygon
  - [x] Polyline
  - [x] BezierCurve
  - [x] Circle
  - [x] CircleMarker
  - [x] Ellipse
  - [x] Rectangle
  - [x] GeoJSON
- [ ] 群组
  - [ ] LayerGroup
  - [ ] OverlayGroup
- [x] 地图控件
  - [x] Control
  - [x] Scale
  - [x] ToolBar
  - [x] ControlBar
  - [x] MapType
  - [x] HawkEye
- [ ] 工具类
  - [ ] RangingTool
  - [ ] MouseTool
  - [ ] PolygonEditor
  - [ ] PolylineEditor
  - [ ] CircleEditor
  - [ ] BezierCurveEditor
  - [ ] EllipseEditor
  - [ ] RectangleEditor
- [ ] 服务类
  - [ ] WebService
  - [ ] WebServiceCallback
- [x] 搜索
  - [x] AutoComplete
  - [x] AutoCompleteSearchCallback
  - [x] PlaceSearch
  - [x] searchCallback
  - [x] CloudDataSearch
  - [x] CloudDataSearchCallback
- [x] 地理编码
  - [x] Geocoder
