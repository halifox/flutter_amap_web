@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 文本标记
@JS("Text")
class TextMarker {
  external TextMarker(TextMarkerOptions opts);
}

// map 类型：：Map	要显示该marker的地图对象
// position 类型：：LngLat	点标记在地图上显示的位置
// text 类型：：LabelOptions	标记显示的文本内容
// title 类型：：string	鼠标滑过点标记时的文字提示
// visible 类型：：boolean	点标记是否可见，默认为true
// zIndex 类型：：number	点标记的叠加顺序
// offset 类型：：Pixel	点标记显示位置偏移量，默认值 [0, 0] 。 图解说明
// anchor 类型：：string	设置点标记锚点。默认值：'center'。可选值：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
// angle 类型：：number	点标记的旋转角度。默认值：0 。注：angle属性是使用CSS3来实现的，支持IE9及以上版本
// clickable 类型：：boolean	点标记是否可点击。默认值: true
// draggable 类型：：boolean	设置点标记是否可拖拽移动。默认值：false
// bubble 类型：：boolean	事件是否冒泡，默认值：false
// zooms 类型：：Array	点标记显示的层级范围，超过范围不显示。默认值：zooms: [2, 20] 。
// cursor 类型：：string	指定鼠标悬停时的鼠标样式。
// topWhenClick 类型：：boolean	鼠标点击时marker是否置顶，默认值: false
// extData 类型：：any	用户自定义属性 ，支持JavaScript API任意数据类型，如 Marker的id等。可将自定义数据保存在该属性上，方便后续操作使用。
// style 类型：：object	设置文本样式，Object同css样式表，如:{'background-color':'red'}
@JS()
@anonymous
class TextMarkerOptions {
  external factory TextMarkerOptions({
    AMap map,
    LngLat position,
    String text,
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
    dynamic extData,
    dynamic style,
  });
}
