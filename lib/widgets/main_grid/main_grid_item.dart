import 'package:flutter/material.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_catalog/widgets/cashed_network_image.dart';

class MainGridItem extends StatefulWidget {
  final String keyValue;
  final int index;
  final String title;
  final String imageUrl;
  final void Function() onTap;

  MainGridItem({
    @required this.keyValue,
    @required this.imageUrl,
    @required this.title,
    @required this.index,
    @required this.onTap,
  }) : super(key: Key(keyValue + 'MainGridItem'));

  @override
  _MainGridItemState createState() => _MainGridItemState();
}

class _MainGridItemState extends State<MainGridItem> {
  bool _init = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _init = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500 + (100 * widget.index % 10)),
      opacity: _init ? 1.0 : 0.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          key: Key(widget.keyValue),
          borderRadius: BorderRadius.circular(18.0),
          splashColor: CustomTheme.colors.primaryColor.withOpacity(0.3),
          highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedImage(
                    key: Key(widget.key.toString() + 'CachedImage'),
                    imageUrl: widget.imageUrl ?? '',
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 40.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    widget.title,
                    style: CustomTheme.textStyles.titleTextStyle(size: 15.sp),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
