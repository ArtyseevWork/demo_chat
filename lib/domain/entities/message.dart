//Модель повідомлення
class Message {
  final String id;
  final String senderId;
  final String text;
  final DateTime timestamp;
  final int status;
  final bool isIncoming;

  Message({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timestamp,
    required this.status,
    required this.isIncoming,
  });

  @override
  bool operator == (Object other) {
    if (identical(this, other)) return true;
    if (other is! Message) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
