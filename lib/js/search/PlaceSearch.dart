@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// AMap.PlaceSearch 类：地点搜索服务，提供某一特定地区的位置查询服务，支持关键字搜索、周边查询、范围查询等。

@JS()
class PlaceSearch {
  external PlaceSearch(PlaceSearchOptions opts);

  // 根据关键字进行搜索，支持中文、拼音、繁体、英文
  // keyword 类型：String - 查询的关键字
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（SearchResult 或 错误信息）
  external void search(String keyword, ResultCallback<SearchResult> callback);

  // 根据中心点经纬度、半径以及关键字进行周边查询
  // keyword 类型：String - 查询的关键字
  // center 类型：LngLat - 搜索中心点的经纬度
  // radius 类型：Number - 搜索半径，范围：0-50000米
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（SearchResult 或 错误信息）
  external void searchNearBy(String keyword, LngLat center, int radius,
      ResultCallback<SearchResult> callback);

  // 根据范围和关键词进行范围查询
  // keyword 类型：String - 查询的关键字
  // bounds 类型：Bounds 或 Polygon - 搜索范围，支持矩形或多边形范围
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（SearchResult 或 错误信息）
  external void searchInBounds(
      String keyword, dynamic bounds, ResultCallback<SearchResult> callback);

  // 根据POIID查询POI详细信息
  // POIID 类型：String - POI的ID
  // callback 类型：Function - 回调函数，接受两个参数：status（String）和result（SearchResult 或 错误信息）
  external void getDetails(String POIID, ResultCallback<SearchResult> callback);

  // 设置查询类别，多个类别用“|”分隔
  // type 类型：String - 查询类别，支持多个类别，用“|”分隔
  // 默认值：所有类别
  external void setType(String type);

  // 设置是否强制限制城市
  // cityLimit 类型：bool - 如果为true，强制限制查询结果仅在指定城市范围内
  external void setCityLimit(bool cityLimit);

  // 设置查询结果的页数
  // pageIndex 类型：Number - 查询结果页数，取值范围1-100
  // 默认值：1
  external void setPageIndex(int pageIndex);

  // 设置查询每页的结果数
  // setPageSize 类型：Number - 每页显示的查询结果数，范围1-50
  // 默认值：10
  external void setPageSize(int setPageSize);

  // 设置查询城市
  // city 类型：String - 设置查询城市，支持城市名、城市代码、行政区代码
  external void setCity(String city);

  // 设置检索语言类型
  // lang 类型：String - 检索语言，支持中文、英文等
  external void setLang(String lang);

  // 获取检索语言类型
  // 返回：String - 当前检索的语言类型
  external String getLang();

  // 清除搜索结果
  external void clear();

  // 唤起高德地图客户端marker页
  // obj 类型：Map<String, dynamic> - 参数包含：id（POIID）、name（String）、location（LngLat）
  external void poiOnAMAP(Map<String, dynamic> obj);

  // 唤起高德地图客户端POI详情页
  // obj 类型：Map<String, dynamic> - 参数包含：id（POIID）、name（String）、location（LngLat）
  external void detailOnAMAP(Map<String, dynamic> obj);
}

// city 类型：String	兴趣点城市，城市名（中文或中文全拼）、citycode、adcode
// 默认值：“全国”
// citylimit 类型：Boolean	是否强制限制在设置的城市内搜索，默认值：false
// children 类型：Number	是否按照层级展示子POI数据，children=1表示展示子节点POI数据，children=0表示不展示子节点数据
// type 类型：String	兴趣点类别，多个类别用“|”分隔，如“餐饮|酒店|电影院”
// lang 类型：String	检索语言类型，zh_cn：中文简体，en：英文
// 默认为: zh_cn
// pageSize 类型：Number	单页显示结果条数，默认值：10，取值范围：1-50
// pageIndex 类型：Number	页码，取值范围：1-100
// extensions 类型：String	此项默认值：base，返回基本地址信息，取值：all返回基本+详细信息
// map 类型：Map	AMap.Map对象，展现结果的地图实例
// panel 类型：String|HTMLElement	结果列表的HTML容器id或元素
// showCover 类型：Boolean	是否在地图上显示周边搜索的圆或范围搜索的多边形，默认true
// renderStyle 类型：String	设定UI风格，缺省为'newpc'，可选值：'newpc'或'default'
// autoFitView 类型：Boolean	是否自动调整地图视野，使绘制的Marker点都处于视口的可见范围
@JS()
@anonymous
class PlaceSearchOptions {
  external factory PlaceSearchOptions({
    String city,
    bool citylimit,
    int children,
    String type,
    String lang,
    int pageSize,
    int pageIndex,
    String extensions,
    AMap map,
    dynamic panel,
    bool showCover,
    String renderStyle,
    bool autoFitView,
  });
}

// type 类型：String	事件类别
// id 类型：String	当前选中的POI的ID
// marker 类型：Marker	当前选中的POI对应的在地图中的Marker对象
// listElement 类型：HTMLLIElement	当前选中的POI在结果面板中对应的列表项
// data 类型：Poi	当前选中的POI的信息
@JS()
@anonymous
class SelectChangeEvent {
  external String get type;

  external String get id;

  external Marker get marker;

  external dynamic get listElement;

  external Poi get data;
}

// info 类型：String	成功状态说明
// poiList 类型：PoiList	发生事件时返回兴趣点列表
// keywordList 类型：Array.<keyword>	发生事件且查无此关键字时，返回建议关键字列表
// cityList 类型：Array.<CityInfo>	发生事件且查无此关键字且 city 为“全国”时，返回城市建议列表
@JS()
@anonymous
class SearchResult {
  external String get info;

  external PoiList get poiList;

  external List<String> get keywordList;

  external List<CityInfo> get cityList;
}

// name 类型：String	建议城市名称
// citycode 类型：String	城市编码
// adcode 类型：String	行政区编码
// count 类型：Number	该城市的建议结果数目
@JS()
@anonymous
class CityInfo {
  external String get name;

  external String get citycode;

  external String get adcode;

  external int get count;
}

// pois 类型：Array.<Poi>	Poi列表
// pageIndex 类型：Number	页码
// pageSize 类型：Number	单页结果数
// count 类型：Number	查询结果总数
@JS()
@anonymous
class PoiList {
  external List<Poi> get pois;

  external int get pageIndex;

  external int get pageSize;

  external int get count;
}

// Poi 基本信息
// id 类型：String	全局唯一ID
// name 类型：String	名称
// type 类型：String	兴趣点类型
// location 类型：LngLat	兴趣点经纬度
// address 类型：String	地址
// distance 类型：Number	离中心点距离，仅周边查询返回
// tel 类型：String	电话

// Poi 详细信息
// website 类型：String	网址
// pcode 类型：String	poi所在省份编码
// citycode 类型：String	poi所在城市编码
// adcode 类型：String	poi所在区域编码
// postcode 类型：String	邮编
// pname 类型：String	poi所在省份
// cityname 类型：String	poi所在城市名称
// adname 类型：String	poi所在行政区名称
// email 类型：String	电子邮箱
// entr_location 类型：LngLat	入口经纬度，POI点有出入口信息时返回，否则返回空字符串
// exit_location 类型：LngLat	出口经纬度，POI点有出入口信息时返回，否则返回空字符串
// groupbuy 类型：Boolean	poi是否有团购信息，true为存在团购信息（此字段逐渐废弃）
// discount 类型：Boolean	poi是否有优惠信息，true为存在优惠信息（此字段逐渐废弃）

// Poi 深度扩展信息
// groupbuys 类型：Array.<Groupbuy>	团购信息（此字段逐渐废弃）
// discounts 类型：Array.<Discount>	优惠信息（此字段逐渐废弃）
// deep_type 类型：String	深度信息类型（此字段逐渐废弃），返回值为以下中的一个：
// DINING：餐饮深度信息类型
// HOTEL：酒店深度信息类型
// CINEMA：影院深度信息类型
// SCENIC：景点深度信息类型
// dining 类型：Dining	餐饮类深度信息（此字段逐渐废弃）
// hotel 类型：Hotel	酒店类深度信息（此字段逐渐废弃）
// cinema 类型：Cinema	影院类深度信息（此字段逐渐废弃）
// scenic 类型：Scenic	景点类深度信息（此字段逐渐废弃）

@JS()
@anonymous
class Poi {
  external factory Poi({
    String name,
    LngLat location,
  });

  external String get id;

  external String get name;

  external String get type;

  external LngLat get location;

  external String get address;

  external int get distance;

  external String get tel;

  // Poi 详细信息
  external String get website;

  external String get pcode;

  external String get citycode;

  external String get adcode;

  external String get postcode;

  external String get pname;

  external String get cityname;

  external String get adname;

  external String get email;

  external LngLat get entr_location;

  external LngLat get exit_location;

  external bool get groupbuy;

  external bool get discount;

  // Poi 深度扩展信息
  external List<Groupbuy> get groupbuys;

  external List<Discount> get discounts;

  external String get deep_type;

  external Dining get dining;

  external Hotel get hotel;

  external Cinema get cinema;

  external Scenic get scenic;
}

// Discount 对象
@JS()
@anonymous
class Discount {
  external String get title; // 优惠标题
  external String get detail; // 优惠详情
  external String get start_time; // 开始时间
  external String get end_time; // 结束时间
  external int get sold_num; // 已卖出数量
  external List<Photo> get photos; // 图片信息
  external String get url; // 来源url
  external String get provider; // 来源标识
}

// Groupbuy 对象
@JS()
@anonymous
class Groupbuy {
  external String get title; // 团购标题
  external String get type_code; // 团购分类代码
  external String get type; // 团购分类
  external String get detail; // 团购详情
  external String get stime; // 团购开始时间
  external String get etime; // 团购结束时间
  external int get count; // 团购总量
  external int get sold_num; // 已卖出数量
  external double get original_price; // 原价
  external double get groupbuy_price; // 折扣价
  external double get discount; // 折扣
  external String get ticket_address; // 取票地址
  external String get ticket_tel; // 取票电话
  external List<Photo> get photos; // 图片信息
  external String get url; // 来源url
  external String get provider; // 来源标识
}

// Dining 对象
@JS()
@anonymous
class Dining {
  external String get cuisines; // 菜系
  external String get tag; // 标签
  external String get intro; // 简介
  external String get rating; // 综合评分
  external String get cp_rating; // 但数据源的评分
  external String get deep_src; // 信息来源
  external String get taste_rating; // 口味评分
  external String get environment_rating; // 环境评分
  external String get service_rating; // 服务评分
  external String get cost; // 人均消费
  external String get recommend; // 特色菜
  external String get atmosphere; // 氛围
  external String get ordering_wap_url; // 订餐wap链接
  external String get ordering_web_url; // 订餐web链接
  external String get ordering_app_url; // 订餐APP URL
  external String get opentime_GDF; // 规范格式的营业时间
  external String get opentime; // 非规范格式的营业时间
  external String get addition; // 餐厅特色
  external List<Photo> get photos; // 图片信息列表
}

// Hotel 对象
@JS()
@anonymous
class Hotel {
  external String get rating; // 综合评分
  external String get star; // 星级
  external String get intro; // 简介
  external String get lowest_price; // 最低房价
  external String get faci_rating; // 设施评分
  external String get health_rating; // 卫生评分
  external String get environment_rating; // 环境评分
  external String get service_rating; // 服务评分
  external String get traffic; // 交通提示
  external String get addition; // 特色服务
  external String get deep_src; // 信息来源
  external List<Photo> get photos; // 图片信息列表
}

// Cinema 对象
@JS()
@anonymous
class Cinema {
  external String get intro; // 简介
  external String get rating; // 综合评分
  external String get deep_src; // 信息来源
  external String get parking; // 停车场设施
  external String get opentime_GDF; // 规范格式的营业时间
  external String get openingtime; // 非规范格式的营业时间
  external List<Photo> get photos; // 图片信息列表
}

// Scenic 对象
@JS()
@anonymous
class Scenic {
  external String get intro; // 简介
  external String get rating; // 综合评分
  external String get deep_src; // 信息来源
  external String get level; // 景区国标级别
  external String get price; // 门票价格
  external String get season; // 适合游玩的季节
  external String get recommened; // 推荐景点
  external String get theme; // 景区主题
  external String get ordering_wap_url; // wap购票链接
  external String get ordering_web_url; // wab购票链接
  external String get opentime_GDF; // 规范格式的营业时间
  external String get opentime; // 非规范格式的营业时间
  external List<Photo> get photos; // 图片信息列表
}

// Photo 对象
@JS()
@anonymous
class Photo {
  external String get title; // 图片名称
  external String get url; // 图片url
}

// Content 对象
@JS()
@anonymous
class Content {
  external String get id; // POI的唯一标识
  external String get name; // POI名称
}
