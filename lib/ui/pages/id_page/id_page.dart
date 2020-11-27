import 'package:base_project_template/models/pages/models/id_page_data.dart';
import 'package:base_project_template/services/route_service/models/routes.dart';
import 'package:base_project_template/theme/custom_theme.dart';
import 'package:base_project_template/ui/layouts/main_layout/main_layout.dart';
import 'package:base_project_template/ui/pages/id_page/id_page_vm.dart';
import 'package:flutter/material.dart';

class IdPage extends StatefulWidget {
  final IdPageData idPageData;

  IdPage({
    @required this.idPageData,
  }) : super(key: Key('${idPageData}${idPageData.pageNumber}'));

  @override
  _IdPageState createState() => _IdPageState();
}

class _IdPageState extends State<IdPage> {

  @override
  void initState() {
    super.initState();
    CustomTheme.instance.setDefaultTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout<IdPageVM>(
      key: Key('${widget.idPageData}${widget.idPageData.pageNumber}Key'),
      converter: IdPageVM.fromStore,
      appBarWidget: AppBar(
        title: Text(widget.idPageData.pageNumber.toString()),
      ),
      builder: (BuildContext context, PageData<IdPageVM> pageData, Widget child) {
        return RaisedButton(
          onPressed: () {
            pageData.viewModel.route(
              IdPageData(
                id: 'IdPage',
                pageNumber: widget.idPageData.pageNumber + 1,
              ),
              Routes.idPage,
            );
          },
        );
      },
    );
  }
}
