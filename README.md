# 高德地图 Flutter Web 端插件

本插件是一个基于高德地图的 Flutter Web 专用插件，**专为仅在 Web 平台运行的 Flutter 项目设计。** 通过此插件，可轻松在 Flutter Web 应用中嵌入和控制高德地图功能。

## 使用方法

### 1. 在 `web/index.html` 中引入高德地图 JavaScript SDK

在项目的 `web/index.html` 文件中添加以下代码，以引入高德地图 SDK 和安全配置：

```html
<script src="https://webapi.amap.com/loader.js"></script>
```

### 2. 创建并初始化地图控件

在 Flutter 项目中使用 `AMapView` 组件来创建和初始化地图视图。以下是一个简单的示例：

```dart
import 'package:flutter/material.dart';
import 'package:flutter_web_amap/amap.dart';

void main() {
  setAMapSecurityConfig('********************************');// 替换为你的高德地图 API 密钥
  runApp(const MyApp());
}
```

```dart
AMapView(
  loaderOptions: LoaderOptions(
    key: "********************************",// 替换为你的高德地图 API Key
    version: '2.0',
    plugins: [
      PLUGIN_GEO_LOCATION,
      PLUGIN_PLACE_SEARCH,
      PLUGIN_SCALE,
      PLUGIN_TOOL_BAR,
      PLUGIN_AUTO_COMPLETE,
    ],
  ),
  onAMapViewCreated: (AMapController controller) async {
    Scale scale = Scale(ControlConfig());
    controller.addControl(scale);

    Geolocation geolocation = Geolocation(GeolocationOptions());
    controller.addControl(geolocation);

    GeolocationResult result = await executeAsync<GeolocationResult>((callback) => geolocation.getCurrentPosition(callback));
    print("当前位置:${result.position.getLat()} ${result.position.getLng()}");
  },
)
```

[示例代码](example/lib/main.dart)

## 文档

[高德开放平台-参考手册](https://lbs.amap.com/api/javascript-api-v2/documentation)

## 工具函数

1. `Future<T> executeAsync<T>(Function(ResultCallback<T> callback) operation)`

高德地图 JavaScript API 主要通过回调的方式返回结果，`executeAsync` 函数可以将这些回调封装为异步方法，使代码更符合 Dart 的异步编程风格。这对于需要等待回调结果的操作（例如定位获取、路径规划）尤为方便。

```dart
Geolocation geolocation = Geolocation(GeolocationOptions());

GeolocationResult result = await executeAsync<GeolocationResult>((callback) => 
  geolocation.getCurrentPosition(callback)
);

print("Latitude: ${result.position.getLat()}, Longitude: ${result.position.getLng()}");
```

## 注意事项

- **安全配置**：确保 `securityJsCode` 和 `key` 值为您在高德平台申请的合法凭证。
- **Web 支持**：该插件仅支持 Web 端使用，确保项目的 `index.html` 文件正确加载高德地图的 JavaScript SDK。

## 相关文档

- [Creating a Dart-to-Javascript interop library](https://medium.com/@thebosz/creating-a-dart-to-javascript-interop-library-c97da204c34a)

- [History of JS interop in Dart](https://medium.com/dartlang/history-of-js-interop-in-dart-98b06991158f)

## 笔记

- 使用魔法注解`@JS()`允许我们声明 API 签名
    - @JS 注解用于将 Dart 类、函数或变量暴露给 JavaScript，或者访问 JavaScript 中的对象。
    - 它可以指定一个 JavaScript 的命名空间，或者直接绑定一个全局 JavaScript 对象。

- 在 Dart 中，使用 @JS 访问 JavaScript 函数或对象时，需要用 `external` 关键字声明属性或方法，这意味着它们的具体实现位于 JavaScript，而非 Dart。
    - `external` 标记的方法或属性不会在 Dart 中生成实现体，而是直接链接到 JavaScript。

- 在 Dart 调用 JavaScript 时，有时需要传递 Dart 函数作为回调函数给 JavaScript，这时可以使用 `allowInterop` 或 `allowInteropCaptureThis`：
    - `allowInterop`：将 Dart 函数转换为 JavaScript 可调用的函数。
    - `allowInteropCaptureThis`：用于处理需要捕获 this 上下文的情况。

- Map 不能直接转化为 Javascript 对象，为了绕过这个限制，我们需要使用`@anonymous`创建一个 "匿名"类。

- 来自JavaScript的数组实例总是List<dynamic>JavaScript数组没有具体的元素类型，因此JavaScript函数返回的数组不能在不检查每个元素的情况下保证其元素类型。

## 实现

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
  - [x] GeocoderCallback
  - [x] ReGeocoderCallback
  - [x] convertFrom
- [x] 路线规划
  - [x] Driving
  - [x] DrivingCallback
  - [x] DrivingResult
  - [x] DriveStepBasic
  - [x] DriveStepDetail
  - [x] TruckDriving
  - [x] Walking
  - [x] WalkingCallback
  - [x] WalkingResult
  - [x] Transfer
  - [x] TransferCallback
  - [x] TransferResult
  - [x] Riding
  - [x] RidingCallback
  - [x] RidingResult
  - [x] DragRoute
  - [x] DragRouteTruck
  - [x] GraspRoad
  - [x] GraspRoadCallback
- [x] 其他服务
  - [x] DistrictSearch
  - [x] Weather
  - [x] WeatherLiveResult
  - [x] WeatherForecastResult
  - [x] StationSearch
  - [x] LineSearch
- [x] 定位
  - [x] Geolocation
  - [x] GeolocationCallBack
  - [x] GeolocationResult
  - [x] CitySearch
- [ ] 通用库
  - [ ] GeometryUtil
  - [ ] DomUtil
  - [ ] Browser
  - [ ] Util 
