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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
      ),
      body: FutureBuilder<List<Data>>(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar Usuarios'),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        NetworkImage(snapshot.data![index].avatar.toString()),
                  ),
                  onTap: () => _selectUser(snapshot.data![index]),
                  title: Text(
                      '${snapshot.data![index].firstName} ${snapshot.data![index].lastName}'),
                  subtitle: Text(snapshot.data![index].email.toString()),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
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
      throw Exception('Erro ao carregar os dados');
    }
  }

  void _selectUser(Data snapshot) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return UserInfo(snapshot);
    }));
  }
}
