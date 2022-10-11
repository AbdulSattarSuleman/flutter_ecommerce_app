import 'package:url_launcher/url_launcher.dart';

class launchGooglemapClass {
  launchURL(url) async {
    final String encodedURl = Uri.encodeFull(url);
    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      throw 'Could not launch $url';
    }
  }
}
