import 'package:pedantic/pedantic.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openMapWithAddress(String address) async {
  await launchBrowser('https://www.google.com/maps/search/?api=1&query=$address');
}

Future<void> launchBrowser(String url) async {
  try {
    unawaited(launch(
      url,
    ));
  } catch (e) {
    print('launchBrowser => could not launch $url, error: $e');
  }
}
