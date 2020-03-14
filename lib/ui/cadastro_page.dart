import 'package:aula140320/funcoes.dart';
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
            criarCampo("Nome", nomeController, TextInputType.text),
            criarCampo("Editora", editoraController, TextInputType.text),
            criarCampo("Ano", anoController, TextInputType.number),
            criarBotao(
                "Salvar", Colors.green, Icons.save, Colors.white, salvarLivro)
          ],
        ),
      ),
    );
  }

  Widget criarCampo(String texto, TextEditingController c, TextInputType ty) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: c,
        keyboardType: ty,
        style: TextStyle(color: Colors.black, fontSize: 16),
        decoration: InputDecoration(
            labelText: texto,
            labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder()),
      ),
    );
  }

  Widget criarBotao(String texto, Color corBotao, IconData icone,
      Color corTexto, Function f) {
    return Padding(
      padding: EdgeInsets.fromLTRB(60, 10, 60, 0),
      child: RaisedButton(
        color: corBotao,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icone,
              size: 26,
              color: corTexto,
            ),
            Text(
              texto,
              style: TextStyle(fontSize: 22, color: corTexto),
            )
          ],
        ),
        onPressed: f,
      ),
    );
  }

  void salvarLivro() {
    if (nomeController.text.isEmpty) {
      Funcoes()
          .mostrarMensagenm(context, "Atenção", "Digite o nome do Livro!!!");
      return;
    }

    Livro livro = Livro();
    livro.nome = nomeController.text;
    livro.editora = editoraController.text;
    livro.ano = anoController.text.isNotEmpty ? int.parse(anoController.text) : null;

    livroHelper.inserir(livro);

    Navigator.pop(context);
  }
}
