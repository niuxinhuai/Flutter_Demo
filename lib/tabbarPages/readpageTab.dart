import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/Const/API.dart';
import 'package:flutter_app/flutter_util/FontUtil.dart';
import 'package:flutter_app/flutter_util/StringUtil.dart';
// ignore: uri_does_not_exist
import 'package:http/http.dart' as http;
//import './flutter_util/FontUtil.dart';

void main() {
  runApp(readpageTab());
}

class readpageTab extends StatefulWidget {
  readpageTab({Key key}) : super(key: key);

  @override
  _FirstTabState createState() => _FirstTabState();

}

class _FirstTabState extends State<readpageTab> {

  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(StringUtil.welcomeMessage);
    loadSyncData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('阅读'),
      ),
      body: getBody()
    );
  }

  showLoadingDialog() {
    return widgets.length == 0;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  ListView getListView() => ListView.builder(
    itemCount: widgets.length,
    itemBuilder: (BuildContext context, int position) {
      return getRow(position);
    });

  getProgressDialog() {
    return Center(child: CircularProgressIndicator());
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                "Row ${widgets[i]["title"]}",
                style: TextStyle(fontFamily: FontUtil.sxslst),
              ),
            ),
          ),

      ),
      onTap: () { print(i); },
    );

    /*
    * setState(() {
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
    *
    *  Tapping
onTapDown — 在特定位置轻触手势接触了屏幕。
onTapUp — 在特定位置产生了一个轻触手势，并停止接触屏幕。
onTap — 产生了一个轻触手势。
onTapCancel — 触发了 onTapDown 但没能触发 tap。
Double tapping
onDoubleTap — 用户在同一个位置快速点击了两下屏幕。
Long pressing
onLongPress — 用户在同一个位置长时间接触屏幕。
Vertical dragging
onVerticalDragStart — 接触了屏幕，并且可能会垂直移动。
onVerticalDragUpdate — 接触了屏幕，并继续在垂直方向移动。
onVerticalDragEnd — 之前接触了屏幕并垂直移动，并在停止接触屏幕前以某个垂直的速度移动。
Horizontal dragging
onHorizontalDragStart — 接触了屏幕，并且可能会水平移动。
onHorizontalDragUpdate — 接触了屏幕，并继续在水平方向移动。
onHorizontalDragEnd — 之前接触屏幕并水平移动的触摸点与屏幕分离
    * */
  }

  loadSyncData() async {
    String url = API.posts;
    http.Response response = await http.get(url);
    setState(() {
      print(response.body.length);
      widgets = json.decode(response.body);
    });
  }
}