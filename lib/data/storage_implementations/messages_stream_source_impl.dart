import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../core/constants.dart';
import '../data_sources/messages_stream_source.dart';
import '../entities/message_data.dart';


//реализація спілкування з сервером за допомогою веб-сокет
class MessagesStreamSourceImpl implements MessagesStreamSource{
  late WebSocketChannel _channel;
  final String websocketUrl = Constants.webSocketEndPoint; // URL WebSocket-сервера
  final _messageController = StreamController<MessageData>.broadcast();

  Stream<MessageData> get messageStream => _messageController.stream;

  void connect() {
    // подключаемся к веб сокету
    _channel = WebSocketChannel.connect(Uri.parse(websocketUrl));
    // Слушаем входящие сообщения
    _channel.stream.listen((data) {
      final decodedMessage = MessageData.fromJson(json.decode(data));
      _messageController.add(decodedMessage);
      print (decodedMessage.text);
    }, onError: (error) {
      print('WebSocket error: $error');
    }, onDone: () {
      print('WebSocket connection closed');
    });
  }

  void sendMessage(String jsonMessage) {
    _channel.sink.add(jsonMessage);
  }

  void disconnect() {
    _channel.sink.close();
    _messageController.close();
  }
}
