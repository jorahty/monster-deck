import 'package:flutter/material.dart';

import 'monster.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FilledButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MonsterPage(),
            ),
          );
        },
        child: const Text('Buy now'),
      ),
    );
  }
}
