import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import 'monster.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var model = context.watch<ViewModel>();

    return ListView.builder(
      itemCount: model.monsters.length,
      itemBuilder: (context, index) {
        var monster = model.monsters[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Card(
            elevation: 3,
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onTap: () {},
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Image.network(monster.imageUrl),
              title: Text(monster.name),
              subtitle: Text(monster.planet),
            ),
          ),
        );
      },
    );
  }
}

// onPressed: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => const MonsterPage(),
//     ),
//   );
// },