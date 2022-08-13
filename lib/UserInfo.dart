import 'package:flutter/material.dart';
import 'User.dart';

class UserInfo extends StatelessWidget {
  // const UserInfo({Key? key}) : super(key: key);
  // final Data data;
  final List<Data> data;

  const UserInfo(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes dos Usuarios'),
        ),
        body: Container(
            child: Column(
          children: data.map(
            (e) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Image.network(e.avatar.toString()),
                    ListTile(
                      title: Text('${e.firstName} ${e.lastName}',
                          textAlign: TextAlign.center),
                      subtitle: Text(
                        e.email.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '${e.firstName} é Legal.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        )));
  }
}
