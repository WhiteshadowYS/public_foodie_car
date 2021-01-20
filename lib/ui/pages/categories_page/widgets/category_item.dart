import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foodie_client_template/data/theme/custom_theme.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/ui/widgets/image_container.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final Category category;
  final void Function(Category) gotoProducts;

  CategoryItem({
    @required this.index,
    @required this.category,
    @required this.gotoProducts,
  }) : super(key: Key('[CategoryItem][$index]'));

  final lng = FlutterDictionary.instance.language;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12.0),
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
              key: Key(key.toString() + '[Image]'),
              imageUrl: category?.imageUrl,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () => gotoProducts(category),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(flex: 6),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: CustomTheme.colors.accentColor.withOpacity(0.24),
                              blurRadius: 4.0,
                              offset: Offset(0, 0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Text(
                          category?.name ?? lng.global.noNameText,
                          textAlign: TextAlign.center,
                          style: CustomTheme.textStyles.accentTextStyle(
                            size: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
