import 'package:flutter/material.dart';
import '../Domain/User.dart';

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
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.network(user.avatar.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListTile(
                      title: Text('${user.firstName} ${user.lastName}',
                          textAlign: TextAlign.center),
                      subtitle: Text(
                        user.email.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(16.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Nome:\nSobrenome:\nEmail:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text('${user.firstName}\n${user.lastName}\n${user.email}',
                          style: const TextStyle(fontSize: 15))
                    ],
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
