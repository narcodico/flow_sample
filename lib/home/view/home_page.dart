import 'package:flow_sample/items/view/items_flow.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage._({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage._());

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            ItemsFlow(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicator: UnderlineTabIndicator(
            insets: EdgeInsets.fromLTRB(30, 0, 30, 40),
          ),
          tabs: [
            Tab(icon: Icon(Icons.list)),
            Tab(icon: Icon(Icons.list_alt)),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
