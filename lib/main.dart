import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/cupertino.dart';
import 'body.dart';
import 'websocket.dart';

//入口函数
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHome(
        title: 'Hello',
        channel: IOWebSocketChannel.connect('ws://echo.websocket.org'),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;
  MyHome({Key key, @required this.title, @required this.channel})
      : super(key: key);

  @override
  _MyHomeState createState() => new _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void initState() {
    super.initState();

    SocketMessage().initSocket();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App Demo'),
          centerTitle: true,
        ),
        body: TabBarView(children: <Widget>[
          CustomScrollViewTestRoute(
            mt: 'HomePage',
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    SocketMessage().dispose();
    super.dispose();
  }
}

class PlatformUtils {
  static bool _isWeb() {
    return kIsWeb == true;
  }

  static bool get isWeb => _isWeb();
}
