import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'listdata.dart';
import 'websocket.dart';

class CustomScrollViewTestRoute extends StatefulWidget {
  CustomScrollViewTestRoute({Key key, @required this.mt}) : super(key: key);
  final String mt;

  @override
  _CustomScrollViewTestRoute createState() {
    return new _CustomScrollViewTestRoute();
  }
}

class _CustomScrollViewTestRoute extends State<CustomScrollViewTestRoute> {
  List listData = [];
  var jsonStrdata = [
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0',
    '0'
  ];

  @override
  void initState() {
    super.initState();
    print("initState");
    listData = decodeJson(jsonStrdata);
    eventBus.on<String>().listen((event) {
      listData = decodeJson(event);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('设备实时数据'),
              background: Image.asset(
                "images/tongye2pro.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 60.0, //高度
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * ((index) % 11)],
                  child: ListTile(
                    title: Text(listData[index]['title'] +
                        ' :  ' +
                        listData[index]['data'] +
                        listData[index]['unit']),
                    leading: Image.asset(
                      listData[index]['imageUrl'],
                      width: 30,
                      height: 30,
                    ),
                  ));
            }, childCount: 12 //列表项
                    ),
          ),
        ],
      ),
    );
  }
}
