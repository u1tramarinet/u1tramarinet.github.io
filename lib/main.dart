import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u1tramarinet/colors.dart';
import 'package:u1tramarinet/scale_size.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bool _debug = false;

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = ScaleSize.textScaleFactor(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.siteName),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _section(
              title: AppLocalizations.of(context)!.whatsMe,
              body: AppLocalizations.of(context)!.whatsMeAnswer,
              textScaleFactor: textScaleFactor,
            ),
            _divider(),
            _section(
              title: AppLocalizations.of(context)!.releasedApps,
              body: AppLocalizations.of(context)!.notYet,
              textScaleFactor: textScaleFactor,
            ),
            _divider(),
            _section(
              title: AppLocalizations.of(context)!.preparingApps,
              body: AppLocalizations.of(context)!.underConstruction,
              textScaleFactor: textScaleFactor,
            ),
            _divider(),
            _section(
              title: AppLocalizations.of(context)!.contact,
              body: AppLocalizations.of(context)!.underConstruction,
              textScaleFactor: textScaleFactor,
            ),
          ],
        ),
      )),
    );
  }

  Widget _section(
      {required String title,
      required String body,
      required double textScaleFactor}) {
    return Container(
      color: _debugColor(isDebug: Colors.red),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(title, textScaleFactor),
            _body(body, textScaleFactor),
          ],
        ),
      ),
    );
  }

  Widget _title(String title, double textScaleFactor) {
    return Container(
      color: _debugColor(isDebug: Colors.blue),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.start,
            textScaler: TextScaler.linear(textScaleFactor),
          )),
    );
  }

  Widget _body(String body, double textScaleFactor) {
    return Container(
      color: _debugColor(isDebug: Colors.green),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Text(
          body,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.start,
          textScaler: TextScaler.linear(textScaleFactor),
        ),
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 32,
    );
  }

  Color _debugColor({required Color isDebug}) {
    return _debug ? isDebug : Colors.transparent;
  }
}
