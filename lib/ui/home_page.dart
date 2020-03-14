import 'package:aula140320/helper/livro_helper.dart';
import 'package:aula140320/ui/cadastro_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LivroHelper livroHelper = LivroHelper();

  Future<List<dynamic>> _getLista() async {
    return await livroHelper.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Meus Livros",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              abrirCadastroLivro(context);
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _getLista(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    strokeWidth: 5,
                  ),
                ),
              );
            default:
              if (snapshot.hasError) {
                return GestureDetector(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.error_outline,
                        size: 100,
                        color: Colors.red,
                      ),
                      Text("Não foi possivel carregar os livros"),
                    ],
                  ),
                  onTap: () {
                    setState(() {});
                  },
                );
              } else {
                return criarListagem(context, snapshot);
              }
              return Container();
          }
        },
      ),
    );
  }

  Widget criarListagem(BuildContext context, AsyncSnapshot snapshot) {
    return Card(
      color: Color(0xFFCCCCCC),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return criarItemLista(snapshot.data[index] as Livro);
          }),
    );
  }

  Widget criarItemLista(Livro livro) {
    return Card(
      color: Colors.white,
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Expanded(
                  child:
                  Text(
                    livro.nome ?? "",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    livro.editora ?? "",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  Text(
                    livro.ano == null ? "" : livro.ano.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              )
            ],
          )),
    );
  }

  void abrirCadastroLivro(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CadastroPage()));
  }
}
