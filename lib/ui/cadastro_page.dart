import 'package:aula140320/helper/livro_helper.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  LivroHelper livroHelper = LivroHelper();

  final nomeController = TextEditingController();
  final editoraController = TextEditingController();
  final anoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Cadastro de Livros",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          ],
        ),
      ),
    );
  }

  Widget criarCampo(String texto, TextEditingController c,
      TextInputType ty) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: c,
        keyboardType: ty,
        style: TextStyle(color: Colors.black, fontSize: 16),
        decoration: InputDecoration(
          labelText: texto,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder()
        ),
      ),
    );
  }
}
