import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/home_page/home_page_vm.dart';
import 'package:foodie_client_template/ui/pages/home_page/widgets/cafe_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: StoreConnector<AppState, HomePageVM>(
        converter: HomePageVM.init,
        onInitialBuild: (vm) => vm.getCafeList(),
        builder: (BuildContext context, HomePageVM vm) {
          return MainLayout(
            key: Key('[HomePage]'),
            child: _buildContent(vm),
          );
        },
      ),
    );
  }

  Widget _buildContent(HomePageVM vm) {
    if (vm.isLoading && vm.cafeList == null || vm.cafeList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: vm.cafeList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return CafeWidget(
            index: index,
            gotoCafe: (Cafe cafe) {
              vm.selectCafe(cafe);
              vm.gotoCategories();
            },
            cafe: vm.cafeList[index],
          );
        },
      ),
    );
  }
}
