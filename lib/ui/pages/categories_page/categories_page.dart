import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';
import 'package:foodie_client_template/ui/pages/categories_page/categories_page_vm.dart';
import 'package:foodie_client_template/ui/pages/categories_page/widgets/category_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_client_template/ui/widgets/image_container.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool _isShowGallery = true;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(listener);
  }

  void listener() {
    if (_controller.offset < 100.h && !_isShowGallery) {
      setState(() => _isShowGallery = true);
    } else if (_controller.offset > 100.h && _isShowGallery) {
      setState(() => _isShowGallery = false);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CategoriesPageVM>(
      converter: CategoriesPageVM.init,
      onInitialBuild: (vm) => vm.getCategories(),
      builder: (BuildContext context, CategoriesPageVM vm) {
        return MainLayout(
          key: Key('[CategoriesPage][MainLayout][Key]'),
          child: _buildContent(vm),
        );
      },
    );
  }

  Widget _buildContent(CategoriesPageVM vm) {
    if (vm.isLoading && vm.categories == null || vm.categories.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
        InkWell(
          onTap: vm.gotoGallery,
          child: AnimatedContainer(
            margin: const EdgeInsets.all(12.0),
            duration: Duration(milliseconds: 300),
            height: _isShowGallery ? 140.h : 0.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: CustomTheme.colors.background,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.24),
                  blurRadius: 8.0,
                  offset: Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 4.0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ImageContainer(
                    key: Key('[CategoriesPage][MainLayout][ImageContainer][Key]'),
                    imageUrl: 'https://i.pinimg.com/originals/9d/03/fb/9d03fb8d48a2ac51fea1b27a4101a479.png',
                  ),
                  Positioned(
                    top: 8.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Text(
                        FlutterDictionary.instance.language.galleryPage.title,
                        style: CustomTheme.textStyles.accentTextStyle(
                          fontWeight: FontWeight.bold,
                          size: 24.0,
                          color: CustomTheme.colors.buttonFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            controller: _controller,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: vm.categories?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return CategoryItem(
                index: index,
                gotoProducts: (Category category) {
                  vm.selectCategory(category);
                  vm.gotoProductsPage();
                },
                category: vm.categories[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
