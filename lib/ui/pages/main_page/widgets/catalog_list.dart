import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/ui/pages/main_page/main_page_vm.dart';
import 'package:my_catalog/widgets/main_list_view.dart';

import 'catalogs_list_item.dart';

class StoresList extends StatefulWidget {
  final List<InfoCatalogModel> stores;
  final Function(int) setId;

  StoresList({
    @required String key,
    @required this.stores,
    this.setId,
  }) : super(key: Key(key));

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<StoresList> {
  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: itemHeight,
  );
  static const itemHeight = 60.0;

  @override
  void initState() {
    _scrollController.addListener(_updateState);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateState);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainListView(
      scrollController: _scrollController,
      itemCount: widget.stores.length + 1,
      itemHeight: itemHeight,
      height: 180.0,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0 || index == widget.stores.length) {
          return SizedBox(
            height: itemHeight,
          );
        }

        return CatalogsListItem(
          key: '${widget.key.toString()}Item$index',
          onTap: () {
            widget.setId(widget.stores[index].id);
            _scrollController.animateTo(
              itemHeight * (index - 1),
              duration: MILLISECONDS_400,
              curve: Curves.easeOut,
            );
          },
          title: widget.stores[index].id.toString(),
          isSelected: _checkSelect(index, widget.stores),
        );
      },
    );
  }

  bool _checkSelect(int index, List<InfoCatalogModel> catalogs) {
    final double _itemMinHeight = itemHeight * index;
    final double _itemMaxHeight = _itemMinHeight + itemHeight;

    if (_scrollController.offset + itemHeight >= _itemMinHeight && _scrollController.offset + itemHeight < _itemMaxHeight) {
      return true;
    }

    return false;
  }

  void _updateState() => setState(() {});
}
