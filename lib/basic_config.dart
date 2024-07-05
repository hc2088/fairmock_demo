
class BasicConfig {
  static BasicConfig? _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  BasicConfig._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory BasicConfig.getInstance() => _getInstance();

  /// 获取单例内部方法
  static BasicConfig _getInstance() {
    // 只能有一个实例
    _instance ??= BasicConfig._internal();
    return _instance!;
  }

  String? phoneBrandName;
  bool appIsDebug = false;

}
