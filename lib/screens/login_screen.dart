import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:loja_virtual/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Entrar'),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: const Text(
                'CRIAR CONTA',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
            )
          ],
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text != null) {
                        if (text.isEmpty || text.contains('@'))
                          return 'E-mail inválido';
                      } else
                        return 'E-mail inválido';
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Senha',
                    ),
                    obscureText: true,
                    validator: (text) {
                      if (text != null) {
                        if (text.isEmpty || text.length < 6)
                          return 'Senha inválida!';
                      } else
                        return 'Senha inválida!';
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueci minha senha',
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RaisedButton(
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}

                      model.signIn();
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}
