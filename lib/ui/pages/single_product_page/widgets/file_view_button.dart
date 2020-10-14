import 'package:json_annotation/json_annotation.dart';
import 'dart:math';

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/res/app_styles/app_shadows.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class FileViewButton extends StatefulWidget {
  final DummyFile dummyFile;
  final void Function() onTap;

  FileViewButton({
    @required this.dummyFile,
    @required this.onTap,
  });

  @override
  _FileViewButtonState createState() => _FileViewButtonState();
}

class _FileViewButtonState extends State<FileViewButton> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  CurvedAnimation _animation;
  bool isOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    _animation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: Tween<double>(begin: 0.0, end: 1).animate(_animationController),
    );
    _animationController.forward();
    _animationController.addListener(_updateListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: CustomTheme.colors.background.withOpacity(0.4),
      highlightColor: CustomTheme.colors.background.withOpacity(0.2),
      onTap: () {
        isOpen = true;
        setState(() {});
        widget.onTap();
      },
      child: Stack(
        children: [
          Column(
            children: [
              if (widget.dummyFile.type == FileTypes.VIDEO_TYPE)
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: CustomTheme.colors.primaryColor,
                    child: Icon(Icons.videocam, color: CustomTheme.colors.background),
                  ),
                  title: Text(
                    'Watch video "${widget.dummyFile.languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()]['name']}"',
                    style: CustomTheme.textStyles.titleTextStyle(size: 14),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: CustomTheme.colors.accentColor, size: 14),
                ),
              if (widget.dummyFile.type == FileTypes.IMAGE_TYPE)
                ListTile(
                  onTap: widget.onTap,
                  leading: CircleAvatar(
                    backgroundColor: CustomTheme.colors.primaryColor,
                    child: Icon(Icons.image, color: CustomTheme.colors.background),
                  ),
                  title: Text(
                    'See pictures "${widget.dummyFile.languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()]['name']}"',
                    style: CustomTheme.textStyles.titleTextStyle(size: 14),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: CustomTheme.colors.accentColor, size: 14),
                ),
              if (widget.dummyFile.type == FileTypes.PDF_TYPE)
                ListTile(
                  onTap: widget.onTap,
                  leading: CircleAvatar(
                    backgroundColor: CustomTheme.colors.primaryColor,
                    child: Icon(Icons.picture_as_pdf, color: CustomTheme.colors.background),
                  ),
                  title: Text(
                    'Check documents "${widget.dummyFile.languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()]['name']}"',
                    style: CustomTheme.textStyles.titleTextStyle(size: 14),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: CustomTheme.colors.accentColor, size: 14),
                ),
              Container(
                height: 0.5,
                color: Colors.grey.withOpacity(0.3),
              ),
            ],
          ),
          if(!isOpen)
          ClipRRect(
            child: Container(
              height: 56,
              alignment: Alignment((_animation.value - 0.5) * 2, 0),
              width: double.infinity,
              child: Transform.rotate(
                angle: pi / 8,
                child: Container(
                  width: 18,
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.shadowsFile(CustomTheme.colors.primaryColor.withOpacity(0.2)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateListener() {
    setState(() {});
    if (_animation.value == 0) {
      Future.delayed(Duration(milliseconds: 1500)).then((value) {
        _animationController.forward();
      });
    }
    if (_animation.value == 1) {
      Future.delayed(Duration(milliseconds: 1500)).then((value) {
        _animationController.value = 0;
        _animationController.forward();
      });
    }
  }
}
