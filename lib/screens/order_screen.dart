import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final String orderId;

  const OrderScreen(this.orderId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedido Realizado'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
              size: 80,
            ),
            const Text(
              'Pedido Realizado com Sucesso!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Código do Pedido: $orderId',
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
