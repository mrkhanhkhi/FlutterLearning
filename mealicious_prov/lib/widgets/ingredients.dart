import 'package:flutter/material.dart';
import 'package:mealicious_prov/providers/shopping_cart_provider.dart';
import 'package:provider/provider.dart';

class Ingredients extends StatelessWidget {
  final String ingredient;
  const Ingredients({Key key, this.ingredient}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingCartProvider>(builder: (BuildContext context,
        ShoppingCartProvider cartProvider, Widget child) {
      return Container(
        width: 400,
        height: 60,
        child: Column(
          children: <Widget>[
            new CheckboxListTile(
                value: cartProvider.added,
                title: Text(ingredient),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool val) {
                  if (cartProvider.added) {
                    cartProvider.removeFromCart();
                  } else {
                    cartProvider.addToCart();
                  }
                })
          ],
        ),
      );
    });
  }
}
