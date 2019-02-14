// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';



class _PageSelector extends StatelessWidget {
  const _PageSelector({ this.icons });

  final List<Icon> icons;

  void _handleArrowButtonPress(BuildContext context, int delta) {
    final TabController controller = DefaultTabController.of(context);
    if (!controller.indexIsChanging)
      controller.animateTo((controller.index + delta).clamp(0, icons.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    final Color color = Theme.of(context).accentColor;
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: <Widget>[

          Expanded(
            child: IconTheme(
              data: IconThemeData(
                size: 128.0,
                color: color,
              ),
              child: TabBarView(
                  children: icons.map<Widget>((Icon icon) {
                    return Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        child: Center(
                          child: icon,
                        ),
                      ),
                    );
                  }).toList()
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageSelectorDemo extends StatelessWidget {
  static const String routeName = '/material/page-selector';
  static final List<Icon> icons = <Icon>[
    const Icon(Icons.event, semanticLabel: 'Event'),
    const Icon(Icons.home, semanticLabel: 'Home'),
    const Icon(Icons.android, semanticLabel: 'Android'),
    const Icon(Icons.alarm, semanticLabel: 'Alarm'),
    const Icon(Icons.face, semanticLabel: 'Face'),
    const Icon(Icons.language, semanticLabel: 'Language'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page selector'),
        //actions: <Widget>[MaterialDemoDocumentationButton(routeName)],
      ),
      body: DefaultTabController(
        length: icons.length,
        child: _PageSelector(icons: icons),
      ),
    );
  }
}