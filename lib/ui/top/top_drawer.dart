import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:u1tramarinet/util/res_utils.dart';
import 'package:url_launcher/link.dart';

import '../link_text_button.dart';

class TopDrawer extends StatelessWidget {
  const TopDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _contentList(),
            ),
            const Divider(),
            _contact(context),
          ],
        ),
      ),
    );
  }

  Widget _contentList() {
    final List<_LinkInfo> contents = [
      _LinkInfo(
        label: 'Home',
        link: 'https://u1tramarinet.github.io/',
        linkForDebug: 'http://localhost:59105/',
      ),
      _LinkInfo(
        label: 'News',
        link: 'https://u1tramarinet.github.io/',
        linkForDebug: 'http://localhost:59105/',
      ),
      _LinkInfo(
        label: 'Character',
        link: 'https://u1tramarinet.github.io/',
        linkForDebug: 'http://localhost:59105/',
      ),
      _LinkInfo(
        label: 'Schedule',
        link: 'https://u1tramarinet.github.io/',
        linkForDebug: 'http://localhost:59105/',
      ),
      _LinkInfo(
        label: 'Ticket',
        link: 'https://u1tramarinet.github.io/',
        linkForDebug: 'http://localhost:59105/',
      ),
    ];

    return Column(
      children: [
        for (final content in contents)...{
          linkElevatedButton(
            url: content.getLink(kReleaseMode),
            label: content.label,
            target: LinkTarget.self,
          ),
          Container(height: 16,)
        },
      ],
    );
  }

  Widget _contact(BuildContext context) {
    final List<_LinkInfo> contacts = [
      _LinkInfo(
        label: 'GitHub',
        link: 'https://github.com/u1tramarinet/',
      ),
      _LinkInfo(
        label: 'X (Former Twitter)',
        link: 'https://twitter.com/u1tramarinet/',
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          title: Text(ResUtils.getString(context).contact),
        ),
        for (final contact in contacts) ...{
          linkElevatedButton(
            url: contact.getLink(kReleaseMode),
            label: contact.label,
            target: LinkTarget.blank,
          ),
          Container(height: 8,),
        }
      ],
    );
  }
}

class _LinkInfo {
  _LinkInfo({
    required this.label,
    required this.link,
    this.linkForDebug,
  });

  String label;
  String link;
  String? linkForDebug;

  String getLink(bool isRelease) {
    if (!isRelease && linkForDebug != null) {
      return linkForDebug!;
    }
    return link;
  }
}
