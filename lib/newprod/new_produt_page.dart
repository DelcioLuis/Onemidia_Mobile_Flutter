import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class NewProduts extends StatelessWidget {

  NewProduts({Key key, this.title}) : super(key: key);

  final String title;

  final  nome_produtos = new TextEditingController();
  final precoss = new TextEditingController();


  getUsers() async {

    print(nome_produtos.text);
    var url = Uri.parse('http://localhost:3333/produtos');
    var data = await http.post(url, body: {'nome_produto': '${nome_produtos.text}', 'preco': '${precoss.text}', 'preco': '${precoss.text}', "imagem_url": "http://localhost:3333/files/1617568668194-1622836907062.png"});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Produto"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: 
       Column(
        children: [
          TextField(
            controller: nome_produtos,
            decoration: InputDecoration(
              hintText: "Digite o nome do ptoduto",
              labelText: "Nome",
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: precoss,
            decoration: InputDecoration(
              hintText: "Digite o preço do produto",
              labelText: "Preço",
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
                
              ),
              border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(onPressed: () {
            getUsers();
          },child: new Text('Adionar Produto'),)
        ],
      ),
      
      )
    );
  }
}