import 'package:flutter/material.dart';

import '../../browes/views/browes_view/browes_view.dart';
import '../../home/views/home_view.dart';
import '../../search/views/search_view.dart';
import '../../watchlist/views/watchlist_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeView(),
    SearchView(),
    BrowesView(),
    WatchListView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/home_icon.png")),
              label: "HOME"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/search_icon.png")),
              label: "SEARCH"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/browes_icon.png")),
              label: "BROWES"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/watchlist_icon.png")),
              label: "WATCHLIST"),
        ],
      ),
    );
  }
}
