import 'package:flutter/material.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';

class CategoryItem extends StatefulWidget {
  final int index;
  final String imageUrl;
  final String categoryName;
  final void Function() onTap;

  CategoryItem({
    @required this.index,
    @required this.imageUrl,
    @required this.categoryName,
    @required this.onTap,
  });

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
      child: InkWell(
        borderRadius: BorderRadius.circular(18.0),
        splashColor: CustomTheme.colors.primaryColor.withOpacity(0.3),
        highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
        onTap: widget.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FadeInImage(
                height: 190,
                placeholder: AssetImage(ImageAssets.LOGO_PNG),
                image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              widget.categoryName,
              style: CustomTheme.textStyles.titleTextStyle(size: 15.0),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  void _updateState () => setState(() {});
}
