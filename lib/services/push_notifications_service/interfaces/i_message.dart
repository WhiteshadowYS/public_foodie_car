import 'package:flutter/cupertino.dart';

abstract class IMessage {
  String title;
  String content;
}

class Message implements IMessage {
  Message({
    @required this.title,
    @required this.content,
    this.imageUrl,
    this.type,
  });

  @override
  String title;
  @override
  String content;

  String imageUrl;
  String type;
}