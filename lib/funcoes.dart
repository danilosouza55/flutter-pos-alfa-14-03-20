import 'package:flutter/material.dart';

// ignore: camel_case_types
class Funcoes {
  void mostrarMensagenm(BuildContext context, String titulo, String texto) {
    showDialog(
        context: context,
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
        });
  }

  void mostrarPergunta(BuildContext context, String titulo, String texto,
      String textoSim, String texteNao, Function funcSim, Function funcNao) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(texto),
            actions: <Widget>[
              FlatButton(
                child: Text(textoSim),
                onPressed: () {
                  funcSim();
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(texteNao),
                onPressed: () {
                  funcNao();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }
}
