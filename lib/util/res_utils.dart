import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResUtils {
  static AppLocalizations getString(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
