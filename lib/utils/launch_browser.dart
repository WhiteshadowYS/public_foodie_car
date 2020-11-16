import 'package:base_project_template/res/const.dart';
import 'package:pedantic/pedantic.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchBrowser(String url) async {
  try {
    unawaited(launch(
      url,
    ));
  } catch (e) {
    logger.e('launchBrowser => could not launch $url, error: $e');
  }
}