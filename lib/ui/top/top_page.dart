import 'package:flutter/material.dart';
import 'package:u1tramarinet/ui/screen_state.dart';
import 'package:u1tramarinet/ui/top/top_drawer.dart';
import 'package:u1tramarinet/util/res_utils.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    ScreenState screenState = ScreenState.from(MediaQuery.of(context).size);
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(ResUtils.getString(context).siteName)),
      ),
      drawer: (screenState == ScreenState.portrait) ? const TopDrawer() : null,
      body: Row(
        children: [
          (screenState == ScreenState.landscape)
              ? const TopDrawer()
              : Container(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: _content(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _section(
            title: ResUtils.getString(context).whatsMe,
            bodies: [
              _bulletPointListItem(
                  text: ResUtils.getString(context).whatsMeDescription01),
              _bulletPointListItem(
                  text: ResUtils.getString(context).whatsMeDescription02),
              _bulletPointListItem(
                  text: ResUtils.getString(context).whatsMeDescription03),
              _bulletPointListItem(
                  text: ResUtils.getString(context).whatsMeDescription04),
            ],
            margin: const EdgeInsets.only(bottom: 8),
          ),
          _section(
            title: ResUtils.getString(context).releasedApps,
            bodies: [
              _listItem(text: ResUtils.getString(context).androidApp),
              _bulletPointListItemSmall(
                  text: ResUtils.getString(context).preparing),
              _listItem(text: ResUtils.getString(context).webApp),
              _bulletPointListItemSmall(
                  text: ResUtils.getString(context).app01),
            ],
          ),
          _section(
            title: ResUtils.getString(context).preparingApps,
            bodies: [
              _listItem(text: ResUtils.getString(context).androidApp),
              _bulletPointListItemSmall(
                  text: ResUtils.getString(context).app02),
              _bulletPointListItemSmall(
                  text: ResUtils.getString(context).app03),
              _bulletPointListItemSmall(
                  text: ResUtils.getString(context).app04),
              _bulletPointListItemSmall(
                  text: ResUtils.getString(context).app05),
              _bulletPointListItemSmall(
                  text: ResUtils.getString(context).app06),
              _listItem(text: ResUtils.getString(context).webApp),
              _bulletPointListItemSmall(
                  text: ResUtils.getString(context).preparing),
            ],
            margin: const EdgeInsets.only(top: 8, bottom: 32),
          ),
        ],
      ),
    );
  }

  Widget _section({
    required String title,
    required List<Widget> bodies,
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(vertical: 8),
  }) {
    return Card(
      margin: margin,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            for (final body in bodies) body,
          ],
        ),
      ),
    );
  }

  Widget _listItem({required String text}) {
    return ListTile(
      title: Text(text),
      titleTextStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _bulletPointListItem({required String text, TextStyle? style}) {
    return ListTile(
      leading: const Icon(Icons.air_rounded),
      title: Text(text),
      titleTextStyle:
          (style != null) ? style : Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _bulletPointListItemSmall({required String text}) {
    return _bulletPointListItem(
        text: text, style: Theme.of(context).textTheme.bodySmall);
  }
}
