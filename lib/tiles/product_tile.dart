import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';

import '../screens/product_screen.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(this.type, this.product, {Key? key}) : super(key: key);

  final String type;
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductScreen(product)));
      },
      child: Card(
        child: type == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.network(
                      product.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'R\$ ${product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.network(
                product.images[0],
                fit: BoxFit.cover,
                height: 250,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'R\$ ${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
