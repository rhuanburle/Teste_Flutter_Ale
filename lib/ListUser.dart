import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ListUser extends StatelessWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    listUserApp() {
      return Column(
        children: listUser.map((tr) {
          return Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                          onPressed: () {},
                          // onPressed: () => _selectUser(users),
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
  }
}
