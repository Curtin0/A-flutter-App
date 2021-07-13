import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';

EventBus eventBus = new EventBus();

class SocketMessage {
  WebSocketChannel channel;
  void initSocket() {
    print('初始化 socket');
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
    sendMessage();
    channel.sink.add('');
  }

  // 将数据发送到服务器
  void sendMessage() {
    print('重连');
    channel.stream.listen(onData, onError: onError, onDone: onDone);
  }

  // socket 链接断开以后重新初始化 socket
  void onDone() async {
    debugPrint("Socket is closed");
    initSocket();
  }

  // socket err 情况的处理
  void onError(err) {
    debugPrint(err.runtimeType.toString());
    WebSocketChannelException ex = err;
    debugPrint(ex.message);
  }

  // 收到服务端推送的消息event
  void onData(event) {
    print('收到消息：$event');
    eventBus.fire(event);
  }

  // 关闭WebSocket连接
  void dispose() {
    print('关闭');
    channel.sink.close();
  }
}
