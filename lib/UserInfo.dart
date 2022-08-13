import 'package:flutter/material.dart';
import 'User.dart';

class UserInfo extends StatelessWidget {
  // const UserInfo({Key? key}) : super(key: key);
  // final Data data;
  final Data user;

  const UserInfo(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes dos Usuarios'),
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(children: [
                Image.network(user.avatar.toString()),
                ListTile(
                  title: Text('${user.firstName} ${user.lastName}',
                      textAlign: TextAlign.center),
                  subtitle: Text(
                    user.email.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(padding: EdgeInsets.all(16.0)),
                Text(
                    'Nome: ${user.firstName}.\n Sobrenome ${user.lastName} \n Email: ${user.email}')
              ]),
            )
          ],
        ),
      ),
    );
  }
}
