import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/ui/pages/main_page/main_page_vm.dart';
import 'package:my_catalog/widgets/main_list_view.dart';

import 'catalogs_list_item.dart';

class CatalogList extends StatefulWidget {
  final MainPageVM vm;

  CatalogList({@required this.vm});

  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  final ScrollController _scrollController = ScrollController();

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
      itemCount: widget.vm.catalogs.length,
      itemHeight: 60.0,
      height: 200.0,
      itemBuilder: (BuildContext context, int index) => CatalogsListItem(
        onTap: () {},
        title: widget.vm.catalogs[index].id.toString(),
        select: _checkSelect(index, widget.vm.catalogs),
      ),
    );
  }

  bool _checkSelect(int index, List<InfoCatalogModel> catalogs) {
    if (_scrollController.offset == 0) {
      return 0 == index;
    }
    if (_scrollController.offset + 200 >= (catalogs.length) * 62.0) {
      return catalogs.length - 1 == index;
    }
    return (_scrollController.offset / 60.0).round() + 1 == index;
  }

  void _updateState() => setState(() {});
}
