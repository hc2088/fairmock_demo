import 'package:fair/fair.dart';
import 'package:flutter/material.dart';

@FairPatch()
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.fairProps}) : super(key: key);

  // 通常习惯上，我们将变量名定义为 fairProps
  dynamic fairProps;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// 定义与 JS 侧交互的参数，只支持 Map 类型的数据
  ///
  /// 需要用 @FairProps() 注解标记
  /// 变量名可以自定义，习惯上命名为 fairProps
  @FairProps()
  var fairProps;

  int _counter = 0;

  // Map<String,dynamic>dataMap = {};

  var dataMap;

  var dataList = [];

  var dataList2 = [];
  var dataMap2;

  @override
  // ///native界面执行initState
  // void initState() {
  //   super.initState();
  //
  //   /// 需要将 widget.fairProps 赋值给 fairProps
  //   fairProps = widget.fairProps;
  //
  //   onLoad();
  // }

  ///如果是动态界面将改用onLoad方法，fair运行时将会加载onLoad初始化
  void onLoad() {
    dataMap = {'name': '老毕', 'age': 19};

    dataList = [
      {'name': '老毕1', 'age': 19},
      {'name': '老毕2', 'age': 19},
      {'name': '老毕3', 'age': 19}
    ];

    dataMap2 = fairProps['dataMap2'];
    dataList2 = fairProps['dataList2'];
  }

  String getName() {
    return dataMap['name'];
  }

  String getName2() {
    return dataMap2['name'];
  }

  String getTitle() {
    return fairProps['title'];
  }

  String getItemName(int index) {
    return dataList[index]['name'];
  }

  String getItemName2(int index) {
    return dataList2[index].name;
  }

  int getLength() {
    return dataList.length;
  }

  int getLength2() {
    return dataList2.length;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(getName2()),
            Text(getName()),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // 暂不支持 style: Theme.of(context).textTheme.headline4,
              // 可替换成:
              style: const TextStyle(
                  fontSize: 40, color: Color(0xffeb4237), wordSpacing: 0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getLength(),
                itemBuilder: Sugar.indexedWidgetBuilder(
                  (context, index) => Text(
                    getItemName(index),
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getLength2(),
                itemBuilder: Sugar.indexedWidgetBuilder(
                  (context, index) => Text(
                    getItemName2(index),
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
