@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

//点标记
@JS()
class Marker {
  external Marker(MarkerOptions opts);
}

// map 类型：Map	要显示该marker的地图对象
// position 类型：(Vector2 | LngLat)	点标记在地图上显示的位置
// icon 类型：(Icon | string)	在点标记中显示的图标。可以传一个图标地址，也可以传Icon对象。有合法的content内容设置时，此属性无效。
// content 类型：(string | HTMLElement)	点标记显示内容。可以是HTML要素字符串或者HTML DOM对象。content有效时，icon属性将被覆盖。
// title 类型：string	鼠标滑过点标记时的文字提示。不设置则鼠标滑过点标无文字提示。
// visible 类型：boolean	点标记是否可见，默认值：true
// zIndex 类型：number	点标记的叠加顺序。地图上存在多个点标记叠加时，通过该属性使级别较高的点标记在上层显示，默认zIndex：12
// offset 类型：(Vector2 | Pixel)	点标记显示位置偏移量，默认值为 [0,0] 。Marker指定position后，默认以marker左上角位置为基准点（若设置了anchor，则以anchor设置位置为基准点），对准所给定的position位置，若需使marker指定位置对准在position处，需根据marker的尺寸设置一定的偏移量。
// anchor 类型：(string | Vector2)	设置点标记锚点，可选值：'top-left','top-center','top-right', 'middle-left', 'center', 'middle-right', 'bottom-left', 'bottom-center', 'bottom-right' 相关示例
// angle 类型：number	点标记的旋转角度，，广泛用于改变车辆行驶方向。默认值：0
// clickable 类型：boolean	点标记是否可点击，默认值: true
// draggable 类型：boolean	设置点标记是否可拖拽移动，默认值：false
// bubble 类型：boolean	事件是否冒泡，默认为 false
// zooms 类型：Vector2	点标记显示的层级范围，超过范围不显示。默认值：zooms: [2, 20]
// cursor 类型：string	指定鼠标悬停时的鼠，默认值：'pointer'
// topWhenClick 类型：boolean	鼠标点击时marker是否置顶，默认false ，不置顶
// height 类型：number	设置Marker点是否离地绘制，默认值为0，等于0时贴地绘制。大于0时离地绘制，此时Marker点高度等于height值加Marker点高程值（JSAPI v2.1新增属性目前只适用于v2.1版本）。
// label 类型：object	添加文本标注
// extData 类型：any	用户自定义属性 ，支持JavaScript API任意数据类型，如 Marker的id等。可将自定义数据保存在该属性上，方便后续操作使用。
@JS()
@anonymous
class MarkerOptions {
  external factory MarkerOptions({
    AMap map,
    LngLat position,
    AMapIcon icon,
    String content,
    String title,
    bool visible,
    int zIndex,
    Pixel offset,
    String anchor,
    int angle,
    bool clickable,
    bool draggable,
    bool bubble,
    List<int> zooms,
    String cursor,
    bool topWhenClick,
    int height,
    Label label,
    dynamic extData,
  });
}

// content 类型：string	文本标注的内容
// offset 类型：(Pixel | Vector2 | Array<number>)	为偏移量。如设置了 direction，以 direction 方位为基准点进行偏移。
// direction 类型：string	文本标注方位 可选值：'top'|'right'|'bottom'|'left'|'center'，默认值: 'right'。
@JS()
@anonymous
class Label {
  external factory Label({
    String content,
    List<int> offset,
    String direction,
  });
}
