import 'package:flutter/material.dart';
import 'package:my_catalog/services/push_notifications_service/interfaces/i_message.dart';

class Message implements IMessage {
  Message({
    @required this.id,
    @required this.title,
    @required this.content,
    this.imageUrl,
    this.type,
  });

  @override
  int id;
  @override
  String title;
  @override
  String content;

  String imageUrl;
  String type;
}