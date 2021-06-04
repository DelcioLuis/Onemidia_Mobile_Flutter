import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../newprod/new_produt_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage>{

  Future<List<User>> _getUsers() async {

    var url = Uri.parse('http://localhost:3333/produtos');

    var data = await http.get(url);

    var jsonData = json.decode(data.body); 

    List<User> users = [];

    for(var u in jsonData){


      User user = User(u["_id"], u["nome_produto"], u["preco_extenso"], u["imagem_url"]);

      users.add(user);
    }

    
    return users;
  }


  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            
            if(snapshot.data == null){
              return Container(
                child: Center(
                  child: Text("Loading..."),
                )
              );
            }else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int _id){

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      snapshot.data[_id].imagem_url
                    ),  
                  ),
                  title: Text(snapshot.data[_id].nome_produto),
                  subtitle: Text(snapshot.data[_id].preco_extenso),
                );
              },
            );
            }
          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Increment',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewProduts()),
          );
        },
        child: Icon(Icons.add),
      )
      
    );
  }
  
}

class User {
  final String _id;
  final String nome_produto;
  final String preco_extenso;
  final String imagem_url;



  User(this._id, this.nome_produto, this.preco_extenso, this.imagem_url);
}






     /*  floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        tooltip: 'Increment',
        onPressed: () {  },
        child: Icon(Icons.add),
      ),  */