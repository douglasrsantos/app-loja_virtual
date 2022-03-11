import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen(this.product, {Key? key}) : super(key: key);

  final ProductData product;

  @override
  State<ProductScreen> createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;

  _ProductScreenState(this.product);

  String? size;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              dotSize: 6,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Tamanho',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 34,
                  child: GridView(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.5,
                    ),
                    children: product.sizes.map((s) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            size = s;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                color: s == size ? primaryColor : Colors.grey,
                                width: 3,
                              )),
                          width: 50,
                          alignment: Alignment.center,
                          child: Text(s),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: size != null ? () {} : null,
                    child: const Text(
                      'Adicionar ao Carrinho',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Descrição',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
