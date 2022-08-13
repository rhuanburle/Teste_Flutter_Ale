import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_flutter/UserInfo.dart';
import '/User.dart';
import 'dart:async';
import 'UserInfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late Future<List<Data>> user;
  List<Data> listUser = [];

  // @override
  // void initState() {
  //   getUser();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuarios'),
      ),
      body: listUserApp(),
    );
  }

  Future<List<Data>> getUser() async {
    var url = Uri.parse('https://reqres.in/api/users?page=1');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> listUserJson = json.decode(response.body);
      var listJsonComplete = User.fromJson(listUserJson);
      List<Data> listUser = listJsonComplete.data!.toList();
      return listUser;
    } else {
      throw Exception('Erro');
    }
  }

  final _teste1 = [
    Data(
        id: 1,
        email: "george.bluth@reqres.in",
        firstName: "George",
        lastName: "Bluth",
        avatar: "https://reqres.in/img/faces/1-image.jpg"),
    Data(
        id: 1,
        email: "anet.weaver@reqres.in",
        firstName: "Janet",
        lastName: "Weaver",
        avatar: "https://reqres.in/img/faces/2-image.jpg")
  ];

  listUserApp() {
    return Column(
      children: _teste1.map((tr) {
        return Card(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.blueAccent,
                width: 2,
              )),
              padding: EdgeInsets.all(10),
              child: Text(tr.firstName.toString()),
            ),
            Column(
              children: [
                Text('${tr.firstName} ${tr.lastName}'),
                Text(tr.email.toString())
              ],
            ),
            Container(
              child: Column(
                children: [
                  TextButton(
                    // onPressed: () {},
                    onPressed: () => _selectUser(_teste1),
                    child: Text('+detalhes'),
                    // Icon(Icons.supervised_user_circle_rounded),
                  )
                ],
              ),
            )
          ]),
        );
      }).toList(),
    );
  }

  void _selectUser(List<Data> users) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return UserInfo(_teste1);
    }));
  }
}
