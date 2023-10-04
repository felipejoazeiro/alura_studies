import 'package:flutter/material.dart';
import 'package:layout_responsivos/cardapio.dart';
import 'package:layout_responsivos/components/highlight_item.dart';

class Highlight extends StatelessWidget {
  const Highlight({Key? key}) : super(key: key);

  final List items = destaques;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                'Destaques do dia',
                style: TextStyle(
                  fontFamily: "Caveat",
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return HighlightItem(
                    imageURI: items[index]["image"],
                    itemTitle: items[index]["name"],
                    itemPrice: items[index]["price"],
                    itemDescription: items[index]["description"]);
              },
              childCount: items.length,
            ),
          )
        ],
      ),
    );
  }
}
