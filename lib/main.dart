import 'package:flutter/material.dart';
import './tabbarPages/homepageTab.dart';
import './tabbarPages/readpageTab.dart';
import './tabbarPages/mypageTab.dart';

void main() => runApp(
    new MaterialApp(
     title: 'Durian - Flutter',
      home: new MyHomePage(),
    )
);
/*StatefulWidget 代表动态改变，StatelessWidget 对于不再改变的界面使用 */
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController tabcontroller;
  /*生命周期方法，渲染树时调用，只调用一次*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = new TabController(
        length: 3,  // tab 页的个数
        // ignore: argument_type_not_assignable, argument_type_not_assignable
        vsync: this // 默认动画效果的异步处理
    );
  }

  // 生命周期方法构建widget时调用
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new TabBarView(
        controller: tabcontroller,
        children: <Widget>[
          // 创建之前写好的三个页面，widget
          new homepageTab(),
          new readpageTab(),
          new mypageTab(),
        ],
      ),
      bottomNavigationBar: new Material(
        // 底部栏整体的颜色
        color: Colors.cyan,
        child: new TabBar(
          controller: tabcontroller,
          tabs: <Widget>[
            new Tab(text: '首页', icon: new Icon(Icons.add_circle)),
            new Tab(text: '阅读', icon: new Icon(Icons.adb)),
            new Tab(text: '我的', icon: new Icon(Icons.add_alarm)),
          ],
          // tab 被选中时的颜色，设置之后选中的时候，icon和text都会改变
          labelColor: Colors.blue,
          // tab 未被选中的颜色
          unselectedLabelColor: Colors.black,
        ),
      ),
    );
  }

  // 组建即将被销毁时调用
  @override
  void dispose() {
    // TODO: implement dispose
    // 释放内存，节省开销
    tabcontroller.dispose();
    super.dispose();
  }

}
