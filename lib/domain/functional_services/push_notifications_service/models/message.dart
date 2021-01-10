import 'package:foody_client_template/domain/functional_services/push_notifications_service/interfaces/i_message.dart';
import 'package:flutter/material.dart';

class Message implements IMessage {
  Message({
    @required this.id,
    @required this.title,
    @required this.content,
    this.imageUrl,
    this.type,
  });

  @override
  String id;
  @override
  String title;
  @override
  String content;

  String imageUrl;
  String type;
}
