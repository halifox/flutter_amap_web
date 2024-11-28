@JS('AMap')
library amap;

import 'package:flutter_web_amap/amap.dart';

// 云数据检索服务类
// 提供云数据检索的功能，支持对已建立文本索引和排序筛选索引的字段进行检索和筛选。
// 用户可以根据检索关键字、筛选条件、排序规则等信息获取指定的数据结果。
@JS()
class CloudDataSearch {
  // 构造函数，接受 tableid 和 CloudDataSearchOptions 参数
  // tableid：云数据表的唯一标识符
  // opts：云数据检索的选项
  external CloudDataSearch(String tableid, CloudDataSearchOptions opts);

  // 设置新的选项
  external setOptions(CloudDataSearchOptions opts);

  // 清除当前查询条件
  external clear();

  // 在指定的中心点和半径范围内进行周边检索
  external searchNearBy(LngLat center, double radius, ResultCallback<CloudDataSearchResult> callback);

  // 根据 ID 检索数据
  external searchById(String id, ResultCallback<CloudDataSearchResult> callback);

  // 根据行政区划名称进行检索
  external searchByDistrict(String district, ResultCallback<CloudDataSearchResult> callback);

  // 根据多边形区域进行检索
  external searchInPolygon(List<LngLat> path, ResultCallback<CloudDataSearchResult> callback);
}

// 云数据检索的选项
// 包含了检索相关的各种配置，如地图实例、检索关键字、筛选条件、排序规则、结果分页等。
@JS()
@anonymous
class CloudDataSearchOptions {
  external factory CloudDataSearchOptions({
    AMap map,          // AMap.Map对象，用于展示结果的地图实例。可选
    String keywords,    // 云检索的关键字，仅支持对建立了文本索引的字段进行模糊检索。可选
    String filter,      // 云检索的筛选条件，仅支持对建立了排序筛选索引的字段进行筛选。可选
    String orderBy,     // 返回数据的排序规则。可选
    int pageSize,       // 每页显示的结果数量，默认值为 20，最大值为 100。可选
    int pageIndex,      // 当前页码，默认值为 1。可选
    dynamic panel,      // 结果列表的HTML容器id或元素，结果将在此容器中展示。可选
    bool autoFitView,   // 搜索结束后是否自动调整地图视野，使得所有Marker点都在视口中。可选
  });
}



// 云数据检索结果对象
// 包含了检索结果的详细信息。根据查询条件，返回数据、结果信息和额外字段。
@JS()
@anonymous
class CloudDataSearchResult {
  external factory CloudDataSearchResult({
    String info,               // 成功状态文字描述
    int count,                 // 查询结果总数
    List<CloudData> datas,     // 云数据数组，包含查询结果的数据
    String id,                // 数据的唯一标识
    String name,              // 数据的名称
    LngLat location,          // 数据的坐标
    String address,           // 数据的地址
    String updatetime,        // 数据的更新时间
    double distance,          // 距离中心点的距离（仅在周边查询时有效）
    dynamic custom_field1,     // 用户自定义字段1
    List<Image> image,        // 图片信息
  });
}

// 云数据项
// 包含了单个数据项的信息，包括数据的ID、名称、位置、地址、图片等。
@JS()
@anonymous
class CloudData {
  external factory CloudData({
    String id,                // 数据项的唯一标识符
    String name,              // 数据项名称
    LngLat location,          // 数据项坐标
    String address,           // 数据项地址
    String updatetime,        // 数据项更新时间
    double distance,          // 距离中心点的距离
    dynamic custom_field1,     // 用户自定义字段1
    List<Image> image,        // 图片信息
  });
}

// 图片信息
// 包含与云数据项相关联的图片，包含图片的ID、预压缩地址、原始地址等。
@JS()
@anonymous
class Image {
  external factory Image({
    String id,           // 图片的ID标识
    String preurl,       // 经过压缩处理的图片地址（尺寸：400*400）
    String url,          // 图片的原始地址，最大限制为1024*1024
  });
}