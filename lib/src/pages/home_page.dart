import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.chargeData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createItemList(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createItemList(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
          title: Text(opt['text']),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, opt['route']);
          });
      options.add(widgetTemp);
      options.add(Divider());
    });
    return options;
  }
}
