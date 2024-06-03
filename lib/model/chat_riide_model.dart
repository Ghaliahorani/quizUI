// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatRiideModel {
  String name;
  String image;
  String message;
  num unread_message_count;
  String date;
  ChatRiideModel({
    required this.name,
    required this.image,
    required this.message,
    required this.unread_message_count,
    required this.date,
  });

  ChatRiideModel copyWith({
    String? name,
    String? image,
    String? message,
    num? unread_message_count,
    String? date,
  }) {
    return ChatRiideModel(
      name: name ?? this.name,
      image: image ?? this.image,
      message: message ?? this.message,
      unread_message_count: unread_message_count ?? this.unread_message_count,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'message': message,
      'unread_message_count': unread_message_count,
      'date': date,
    };
  }

  factory ChatRiideModel.fromMap(Map<String, dynamic> map) {
    return ChatRiideModel(
      name: map['name'] as String,
      image: map['image'] as String,
      message: map['message'] as String,
      unread_message_count: map['unread_message_count'] as num,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRiideModel.fromJson(String source) =>
      ChatRiideModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatRiideModel(name: $name, image: $image, message: $message, unread_message_count: $unread_message_count, date: $date)';
  }

  @override
  bool operator ==(covariant ChatRiideModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.message == message &&
        other.unread_message_count == unread_message_count &&
        other.date == date;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        message.hashCode ^
        unread_message_count.hashCode ^
        date.hashCode;
  }
}
