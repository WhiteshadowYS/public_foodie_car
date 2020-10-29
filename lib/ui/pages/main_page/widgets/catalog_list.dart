import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_catalog/res/const.dart';

import 'catalogs_list_item.dart';

class StoresList extends StatefulWidget {
  final String keyValue;
  final List<String> stores;
  final Function(int) setId;

  StoresList({
    @required this.keyValue,
    @required this.stores,
    this.setId,
  }) : super(key: Key(keyValue + 'StoresList'));

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<StoresList> {
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: itemHeight,
  );
  static double itemHeight = 60.0;

  @override
  void initState() {
    _scrollController.addListener(_updateState);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo((widget.stores.length-1) * itemHeight);
    });
    super.initState();
  }

@override
  void reassemble() {
    _scrollController.jumpTo((widget.stores.length-1) * itemHeight);
    super.reassemble();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateState);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     //decoration: BoxDecoration(
     //  border: Border.symmetric(
     //    vertical: BorderSide(
     //      width: 0.5,
     //      color: CustomTheme.colors.accentColor.withOpacity(0.4),
     //    ),
     //  ),
     //),
      height: 180,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        key: Key('StoresList'),
        controller: _scrollController,
        itemCount: widget.stores.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0 || index == widget.stores.length + 1) {
            return SizedBox(
              height: itemHeight,
            );
          }
          return CatalogsListItem(
            keyValue: widget.keyValue,
            onTap: () {
              widget.setId(int.tryParse(widget.stores[index - 1]));
              _scrollController.animateTo(
                itemHeight * (index - 1),
                duration: MILLISECONDS_400,
                curve: Curves.easeOut,
              );
            },
            title: widget.stores[index - 1],
            isSelected: _checkSelect(index, widget.stores),
          );
        },
      ),
    );
  }

  bool _checkSelect(int index, List<String> stores) {
    final double _itemMinHeight = itemHeight * index;
    final double _itemMaxHeight = _itemMinHeight + itemHeight;

    return _scrollController.offset + itemHeight >= _itemMinHeight &&
        _scrollController.offset + itemHeight < _itemMaxHeight;
  }

  void _updateState() => setState(() {});
}
