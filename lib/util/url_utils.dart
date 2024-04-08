import 'package:flutter/foundation.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlUtils {
  static Future<void> launchUrlInNewTab(Uri url) async {
    launchUrl(url, LinkTarget.blank);
  }

  static Future<void> launchUrlInCurrentTab(Uri url) async {
    launchUrl(url, LinkTarget.self);
  }

  static Future<void> launchUrl(Uri url, LinkTarget linkTarget) async {
    String webOnlyWindowName =
        (linkTarget == LinkTarget.blank) ? '_blank' : '_self';
    if (await url_launcher.canLaunchUrl(url)) {
      url_launcher.launchUrl(url, webOnlyWindowName: webOnlyWindowName);
    } else {
      if (kDebugMode) {
        print('Can\'t launch url: $url');
      }
    }
  }
}
