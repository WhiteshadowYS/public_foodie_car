import 'package:flutter/material.dart';
import 'package:base_project_template/theme/custom_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:base_project_template/ui/shared/cashed_network_image.dart';

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
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: InkWell(
            key: Key(widget.keyValue),
            borderRadius: BorderRadius.circular(18.0),
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
                 SizedBox(height: 8.sp),
                SizedBox(
                  height: 40.sp,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      widget.title,
                      style: CustomTheme.textStyles.titleTextStyle(size: 12.sp),
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
