@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.Autocomplete 类：根据输入关键字提供匹配提示，支持设置Poi类型和城市作为输入提示的限制条件。

@JS()
class Autocomplete {
  external Autocomplete(AutocompleteOptions opts);

  // 根据输入关键字提示匹配信息，支持中文、拼音
  // keyword 类型：String - 输入的查询关键字
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（AutocompleteResult 或 错误信息）
  external void search(
      String keyword, ResultCallback<AutocompleteResult> callback);

  // 设置提示POI类型，多个类型用“|”分隔
  // type 类型：String - POI类型编码，例如“050000”
  // 默认值：所有类别
  external void setType(String type);

  // 设置城市
  // city 类型：String - 城市名称，用于限制提示结果
  external void setCity(String city);

  // 设置是否强制限制城市
  // cityLimit 类型：bool - 如果为true，强制限制查询结果仅在指定城市范围内
  external void setCityLimit(bool cityLimit);
}

// type 类型：String	输入提示时限定POI类型，多个类型用“|”分隔，POI相关类型请在网站“相关下载”处下载
// 默认值：所有类别
// city 类型：String	输入提示时限定城市，城市名（中文或中文全拼）、citycode、adcode
// 默认值：“全国”
// datatype 类型：String	返回的数据类型，可选值：all、poi、bus、busline
// citylimit 类型：Boolean	是否强制限制在设置的城市内搜索，默认值：false
// input 类型：String/HTMLInputElement	指定一个input输入框，传入DOM对象或id
// output 类型：String/HTMLDivElement	指定显示提示结果的容器
// outPutDirAuto 类型：Boolean	是否自动调整提示面板位置，默认true
@JS()
@anonymous
class AutocompleteOptions {
  external factory AutocompleteOptions({
    String type,
    String city,
    String datatype,
    bool citylimit,
    String input,
    String output,
    bool outPutDirAuto,
  });
}

// info 类型：string	查询状态说明 "OK"
// count 类型：number	输入提示条数
// tips 类型：Array<Tip>	输入提示列表
@JS()
@anonymous
class AutocompleteResult {
  external String get info;

  external int get count;

  external List<dynamic /*Tip*/ > get tips;
}

// name 类型：string	名称
// district 类型：string	所属区域
// adcode 类型：string	区域编码
@JS()
@anonymous
class Tip {
  external String get name;

  external String get district;

  external String get adcode;
}
