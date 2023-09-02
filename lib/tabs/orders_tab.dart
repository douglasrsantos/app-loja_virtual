import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';

import '../screens/login_screen.dart';
import '../tiles/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (UserModel.of(context).isLoggedIn()) {
      // String uid = UserModel.of(context).firebaseUser!.uid;

      return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("orders").get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: snapshot.data!.docs
                  .map((doc) => OrderTile(doc.id))
                  .toList()
                  .reversed
                  .toList(),
            );
          }
        },
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.view_list,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Faça o Login Para Acompanhar!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                child: const Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
                })
          ],
        ),
      );
    }
  }
}
