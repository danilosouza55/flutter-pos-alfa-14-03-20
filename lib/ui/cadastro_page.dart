import 'package:aula140320/funcoes.dart';
import 'package:aula140320/helper/livro_helper.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  final Livro _livroData;

  CadastroPage(this._livroData);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  LivroHelper livroHelper = LivroHelper();

  final nomeController = TextEditingController();
  final editoraController = TextEditingController();
  final anoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget._livroData != null) {
      nomeController.text = widget._livroData.nome;
      editoraController.text = widget._livroData.editora;
      anoController.text =
      widget._livroData.ano == null ? "" : widget._livroData.ano.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget._livroData == null ? "Cadastro de Livros" : "Editar o Livro",
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
                "Salvar", Colors.green, Icons.save, Colors.white, salvarLivro),
            criarBotaoExcluir(),
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

  Widget criarBotaoExcluir() {
    if (widget._livroData != null) {
      return criarBotao(
          "Excluir", Colors.red[900], Icons.delete_outline, Colors.white,
          excluirLivro);
    }
    else {
      return Container();
    }
  }

  void excluirLivro() {
    Funcoes().mostrarPergunta(
        context,
        "Atenção",
        "Deseja realmente excluir o livro?",
        "Sim",
        "Não",
        confirmarExclusaoLivro, () {});
  }

  void confirmarExclusaoLivro() {
    livroHelper.apagar(widget._livroData.codigo);
    Navigator.pop(context);
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
    livro.ano =
    anoController.text.isNotEmpty ? int.parse(anoController.text) : null;

    if (widget._livroData != null) {
      livro.codigo = widget._livroData.codigo;
      livroHelper.alterar(livro);
    } else {
      livroHelper.inserir(livro);
    }

    Navigator.pop(context);
  }
}
