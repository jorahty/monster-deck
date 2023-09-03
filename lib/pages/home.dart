import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../components/monster/list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var monsters = context.watch<ViewModel>().monsters;

    return MonsterList(monsters: monsters);
  }
}
