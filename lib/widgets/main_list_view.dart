import 'package:flutter/material.dart';

import 'clean_behavior.dart';
import 'list_overflow_borders.dart';


class MainListView extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double height;
  final double itemHeight;
  final scrollDirection;

  const MainListView({
    @required this.itemBuilder,
    @required this.itemCount,
    @required this.height,
    @required this.itemHeight,
    this.scrollDirection = Axis.vertical,
  });

  @override
  _MainListViewState createState() => _MainListViewState();
}

class _MainListViewState extends State<MainListView> {
  final ScrollController _scrollController = ScrollController();

  bool _scrollUp;
  bool _scrollDown;

  @override
  void initState() {
    setState(() {
      _scrollUp = false;
      if (widget.itemCount * widget.itemHeight > widget.height) {
        _scrollDown = true;
      } else {
        _scrollDown = false;
      }
    });
    _scrollController.addListener(_scrollUpShadow);
    _scrollController.addListener(_scrollDownShadow);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollUpShadow);
    _scrollController.removeListener(_scrollDownShadow);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ScrollConfiguration(
          behavior: CleanBehavior(),
          child: ListView.builder(
            scrollDirection: widget.scrollDirection,
            controller: _scrollController,
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder,
          ),
        ),
        ListOverflowBorders(
          scrollDirection: widget.scrollDirection,
          scrollUp: _scrollUp,
          scrollDown: _scrollDown,
          maxHeight: widget.height,
        ),
      ],
    );
  }

  void _scrollDownShadow() {
    if (_scrollController.offset + widget.height < widget.itemCount * widget.itemHeight &&
        widget.itemCount * widget.itemHeight > widget.height) {
      if (!_scrollDown) {
        setState(() {
          _scrollDown = true;
        });
      }
    } else {
      if (_scrollDown) {
        setState(() {
          _scrollDown = false;
        });
      }
    }
  }

  void _scrollUpShadow() {
    if (_scrollController.offset > 0) {
      if (!_scrollUp) {
        setState(() {
          _scrollUp = true;
        });
      }
    } else {
      if (_scrollUp) {
        setState(() {
          _scrollUp = false;
        });
      }
    }
  }
}
