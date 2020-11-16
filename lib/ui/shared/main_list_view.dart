import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'clean_behavior.dart';
import 'list_overflow_borders.dart';

class MainListView extends StatefulWidget {
  final String keyValue;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double height;
  final double itemHeight;
  final scrollDirection;
  final ScrollController scrollController;

  MainListView({
    @required this.keyValue,
    @required this.itemBuilder,
    @required this.itemCount,
    @required this.height,
    @required this.itemHeight,
    @required this.scrollController,
    this.scrollDirection = Axis.vertical,
  }) : super(key: Key(keyValue + 'MainListView'));

  @override
  _MainListViewState createState() => _MainListViewState();
}

class _MainListViewState extends State<MainListView> {
  ScrollController _scrollController;

  bool _scrollUp = false;
  bool _scrollDown = false;

  @override
  void initState() {
    _scrollController = widget.scrollController;

    _scrollController.addListener(scrollPositionListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(scrollPositionListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ScrollConfiguration(
            behavior: CleanBehavior(),
            child: SizedBox(
              height: widget.height ?? double.infinity,
              child: ListView.builder(
                key: Key(widget.keyValue),
                physics: ClampingScrollPhysics(),
                scrollDirection: widget.scrollDirection,
                controller: widget.scrollController,
                itemCount: widget.itemCount,
                itemBuilder: widget.itemBuilder,
              ),
            ),
          ),
          ListOverflowBorders(
            keyValue: widget.keyValue + 'ListOverflowBorders',
            scrollDirection: widget.scrollDirection,
            scrollUp: _scrollUp,
            scrollDown: _scrollDown,
            maxHeight: widget.height,
          ),
        ],
      ),
    );
  }

  void scrollPositionListener() {
    Timer lastScrollTimer;

    if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      clearScrollDirectionTimer(lastScrollTimer);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _scrollDown = true;
          _scrollUp = false;
        });
      });
    }

    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      clearScrollDirectionTimer(lastScrollTimer);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _scrollDown = false;
          _scrollUp = true;
        });
      });
    }
  }

  void clearScrollDirectionTimer(Timer timer) {
    timer = Timer(Duration(milliseconds: 300), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _scrollDown = false;
          _scrollUp = false;
        });
      });
      timer.cancel();
    });
  }
}
