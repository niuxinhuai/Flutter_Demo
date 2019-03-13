import 'package:flutter/material.dart';

void main() {

}

class mypageTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<mypageTab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    enableFlags(isB: true);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
      body: new Center(
        child: CustomPaint(

//          child: Ca,
        ),
      ),
    );
  }

  void enableFlags({bool isB, bool hid}){
    print(isB);
  }
}