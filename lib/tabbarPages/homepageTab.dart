
import 'package:flutter/material.dart';

class homepageTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<homepageTab> {

  String _timeText = '1';

  /* 获取当前时间方法 */
  void _getCurrentTime() {
    setState(() {
      // ignore: invalid_assignment
      print(DateTime.now().toIso8601String());

      _timeText = DateTime.now().toIso8601String();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('主页'),
      ),
      body: new ListView(

        children: <Widget>[
          // add custom code
          new Text('$_timeText', style: new TextStyle(fontSize: 30),textAlign: TextAlign.center,),
          new Image.asset('flutterAssetImageFile/flutterSwiftImage.png', width: 200.0,height: 200.0,fit: BoxFit.scaleDown,),
          new Image.asset('flutterAssetImageFile/Untitled2.gif', width: 200.0,height: 200.0,fit: BoxFit.scaleDown,),

        ],
      ),
      // ignore: duplicate_named_argument
//      body: Center(
//
//        child: Column(
//
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'Hello World',
//
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//            Text(
//              'I Have A Girl Friend',
//            ),
//            Text(
//              '$_timeText',
//              style: Theme.of(context).primaryTextTheme.body2,
//            ),
//          ],
//        ),
//      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentTime,
        tooltip: 'Increment',
        child: Icon(Icons.add_alarm),
      ),
    );
  }
}