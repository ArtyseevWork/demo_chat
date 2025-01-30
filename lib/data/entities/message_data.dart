import 'package:pandachat/domain/entities/message.dart';


//Модель повідомлення в такому вигляді як вона зберігається, для Data-слою
class MessageData {
  final String id;
  final String senderId;
  final String text;
  final DateTime timestamp;
  final int status;

  MessageData({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    required this.status,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) {
    try {
      return MessageData(
        id: json['id'] as String,
        senderId: json['senderId'] as String,
        text: json['text'] as String,
        timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp']as int),
        status: json['status'] as int ,
      );
    } catch (e) {
      throw FormatException('Error parsing Message: $e');
    }
  }

  Message toMessage(String currentUserId){
    return Message(
        id: id,
        senderId: senderId,
        text: text,
        timestamp: timestamp,
        status: status,
        isIncoming: currentUserId != senderId);
  }

  factory MessageData.fromMessage(Message message){
    return MessageData(
        id: message.id,
        senderId: message.senderId,
        text: message.text,
        timestamp: message.timestamp,
        status: message.status,
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'text': text,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'stataus': status,
    };
  }

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;
    if (other is! MessageData) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
