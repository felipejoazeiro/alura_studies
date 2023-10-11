import 'package:flutter/material.dart';
import 'package:layout_responsivos/themes/app_colors.dart';

class HighlightItem extends StatelessWidget {
  const HighlightItem(
      {Key? key,
      required this.imageURI,
      required this.itemTitle,
      required this.itemPrice,
      required this.itemDescription})
      : super(key: key);
  final String imageURI;
  final String itemTitle;
  final String itemPrice;
  final String itemDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0,
      child: Column(
        children: <Widget>[
          Image(
            height: 100,
            width: double.infinity,
            image: AssetImage(imageURI),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 1.5, 8, 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  itemTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("R\$ " + itemPrice),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Text(itemDescription),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: AppColors.buttonStyle,
                    child: const Text('Pedir'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
