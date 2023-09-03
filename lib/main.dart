import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const colorSchemeSeed = Colors.blue;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorSchemeSeed: colorSchemeSeed,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSchemeSeed,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0;

  void selectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [
      Text('Home'),
      Text('Saved'),
    ];

    var page = pages[selectedIndex];

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Column(
              children: [
                Expanded(child: page),
                const Divider(height: 1),
                BottomNavigationBar(
                  currentIndex: selectedIndex,
                  onTap: selectIndex,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.turned_in),
                      label: 'Saved',
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Row(
              children: [
                NavigationRail(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: selectIndex,
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.turned_in),
                      label: Text('Saved'),
                    ),
                  ],
                ),
                const VerticalDivider(width: 1),
                Expanded(child: page),
              ],
            );
          }
        },
      ),
    );
  }
}
