import 'package:flutter/material.dart';

// ignore: camel_case_types
class Funcoes {
  void mostrarMensagenm(BuildContext context, String titulo, String texto) {
    showDialog(context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(texto),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }
}
