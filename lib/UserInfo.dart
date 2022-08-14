import 'package:flutter/material.dart';
import 'User.dart';

class UserInfo extends StatelessWidget {
  final Data user;

  // ignore: use_key_in_widget_constructors
  const UserInfo(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes dos Usuarios'),
      ),
      body: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(children: [
              ClipRRect(
                child: Image.network(user.avatar.toString()),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              ListTile(
                title: Text('${user.firstName} ${user.lastName}',
                    textAlign: TextAlign.center),
                subtitle: Text(
                  user.email.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              Text(
                  'Nome: ${user.firstName}.\n Sobrenome ${user.lastName} \n Email: ${user.email}')
            ]),
          )
        ],
      ),
    );
  }
}
