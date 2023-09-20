import 'package:flutter/material.dart';

class ListTileFil extends StatelessWidget {
  const ListTileFil({super.key, required this.icon, required this.head});
  final Icon icon;
  final Text head;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: head,
      onTap: () {},
    );
  }
}
