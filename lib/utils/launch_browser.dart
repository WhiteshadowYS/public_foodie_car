import 'package:pedantic/pedantic.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchBrowser(String url) async {
  try {
    unawaited(launch(
      url,
    ));
  } catch (e) {
    print('launchBrowser => could not launch $url, error: $e');
  }
}
