import 'package:flutter/material.dart';
import 'package:hyrule/domain/models/entry.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.entry}) : super(key: key);

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes"),
          centerTitle: true,
        ),
      ),
    );
  }
}
