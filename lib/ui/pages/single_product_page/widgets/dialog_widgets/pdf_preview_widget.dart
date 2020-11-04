import 'package:flutter/material.dart';
import 'package:my_catalog/res/image_assets.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/open_in_browser_button.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PdfPreviewWidget extends StatelessWidget {
  final String pdfUrl;

  PdfPreviewWidget({
    @required this.pdfUrl,
  })  : assert(pdfUrl != null, throw ('pdfUrl should be not null')),
        super(key: Key('PdfPreviewWidget'));

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = false;
    if (MediaQuery.of(context).size.width > 600) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }
    return Stack(
      alignment: Alignment.bottomRight,c
      children: [
        PDF.network(
          pdfUrl,
          width: isLargeScreen ? ScreenUtil.screenWidth * 0.84 : double.infinity,
          height: ScreenUtil.screenHeight * 0.4,
          placeHolder: Image.asset(ImageAssets.LOGO_PNG),
        ),
        Positioned(
          right: 20,
          child: OpenInBrowserButton(url: pdfUrl),
        ),
      ],
    );
  }
}
