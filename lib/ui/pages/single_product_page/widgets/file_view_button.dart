import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/data/data/file_model.dart';
import 'package:my_catalog/res/app_styles/app_shadows.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class FileViewButton extends StatefulWidget {
  final String keyValue;
  final String locale;
  final FileModel file;
  final void Function() onTap;

  FileViewButton({
    @required this.keyValue,
    @required this.locale,
    @required this.file,
    @required this.onTap,
  }) : super(key: Key(keyValue + 'FileViewButton'));

  @override
  _FileViewButtonState createState() => _FileViewButtonState();
}

class _FileViewButtonState extends State<FileViewButton> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  bool _isDisposed = false;
  CurvedAnimation _animation;
  AnimationController _animationController;

  @override
  void initState() {
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
  void dispose() {
    _isDisposed = true;
    _animationController.removeListener(_updateListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: InkWell(
          key: Key(widget.keyValue),
          onTap: () {
            isOpen = true;
            setState(() {});
            widget.onTap();
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 5.0),
                    if (widget.file.type == FileTypes.VIDEO_TYPE)
                      ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundColor: CustomTheme.colors.primaryColor,
                          child: Icon(Icons.videocam, color: CustomTheme.colors.background, size: 28),
                        ),
                        title: Text(
                          'Watch video "${widget.file.nameForLanguage(widget.locale)}"',
                          style: CustomTheme.textStyles.titleTextStyle(size: 14),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, color: CustomTheme.colors.accentColor, size: 14),
                      ),
                    if (widget.file.type == FileTypes.IMAGE_TYPE)
                      ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundColor: CustomTheme.colors.primaryColor,
                          child: Icon(Icons.image, color: CustomTheme.colors.background, size: 28),
                        ),
                        title: Text(
                          'See pictures "${widget.file.nameForLanguage(widget.locale)}"',
                          style: CustomTheme.textStyles.titleTextStyle(size: 14),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, color: CustomTheme.colors.accentColor, size: 14),
                      ),
                    if (widget.file.type == FileTypes.PDF_TYPE)
                      ListTile(
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundColor: CustomTheme.colors.primaryColor,
                          child: Icon(Icons.picture_as_pdf, color: CustomTheme.colors.background, size: 28),
                        ),
                        title: Text(
                          'Check documents "${widget.file.nameForLanguage(widget.locale)}"',
                          style: CustomTheme.textStyles.titleTextStyle(size: 14),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, color: CustomTheme.colors.accentColor, size: 14),
                      ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 0.5,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
              if (!isOpen)
                ClipRRect(
                  child: Container(
                    height: 72,
                    alignment: Alignment((_animation.value - 0.5) * 2.5, 0),
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
        ),
      ),
    );
  }

  void _updateListener() {
    setState(() {});
    if (_animation.value == 0) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        if (_isDisposed) return;
        _animationController?.forward();
      });
    }
    if (_animation.value == 1) {
      Future.delayed(Duration(seconds: 1)).then((_) {
        if (_isDisposed) return;
        _animationController?.value = 0;
        _animationController?.forward();
      });
    }
  }
}
