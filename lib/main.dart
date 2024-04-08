import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u1tramarinet/ui/colors.dart';
import 'package:u1tramarinet/ui/top/top_page.dart';

void main() {
  usePathUrlStrategy();
  runApp(const UltramarineApp());
}

class UltramarineApp extends StatelessWidget {
  const UltramarineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'u1tlamarinet',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: _buildTheme(
        // colorSchemeSeed: ultramarine,
        primarySwatch: ultramarinePrimarySwatch,
        brightness: Brightness.light,
      ),
      darkTheme: _buildTheme(
        colorSchemeSeed: ultramarine,
        // primarySwatch: ultramarinePrimarySwatch,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const TopPage(),
    );
  }

  ThemeData _buildTheme(
      {required Brightness brightness,
      MaterialColor? primarySwatch,
      Color? colorSchemeSeed}) {
    return ThemeData(
      brightness: brightness,
      primarySwatch: primarySwatch,
      colorSchemeSeed: colorSchemeSeed,
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontFamilyFallback: [GoogleFonts.notoSansJp().fontFamily ?? 'Roboto'],
    );
  }
}
