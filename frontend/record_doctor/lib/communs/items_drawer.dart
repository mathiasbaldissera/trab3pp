import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
  final String title;
  final Widget leading;
  const ListTileDrawer({this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ListTile(
          title: Text(title),
          leading: leading,
        ),
      ),
    );
  }
}
