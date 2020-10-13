import 'package:flutter/material.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class CategoryItem extends StatefulWidget {
  final int index;

  // TODO(Daniil): Change type to category model
  final ProductModel category;
  final void Function(String) onTap;

  CategoryItem({
    @required String key,
    @required this.category,
    @required this.index,
    @required this.onTap,
  }) : super(key: Key(key));

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    _animationController.addListener(_updateState);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(_updateState);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500 + (100 * widget.index % 10)),
      opacity: _animationController.value > 0.1 ? 1 : 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18.0),
          splashColor: CustomTheme.colors.primaryColor.withOpacity(0.3),
          highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
          onTap: () => widget.onTap(widget.category.id.toString()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FadeInImage(
                  height: 190,
                  placeholder: AssetImage(ImageAssets.LOGO_PNG),
                  image: NetworkImage(widget.category.imageLink),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.category.languages[FlutterDictionaryDelegate.getCurrentLocale.toUpperCase()][NAME],
                style: CustomTheme.textStyles.titleTextStyle(size: 15.0),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateState() => setState(() {});
}
