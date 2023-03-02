import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/screens/account_page.dart';
import 'package:nm_recommender/screens/favorite_page.dart';
import 'package:nm_recommender/screens/movie_page.dart';
import 'package:nm_recommender/screens/novel_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  static const List<String> labels = [
    "movies",
    "novels",
    "favorite",
    "account"
  ];
  static const List<IconData> icon = [
    Icons.local_movies_outlined,
    Icons.menu_book_rounded,
    Icons.favorite,
    Icons.person
  ];

  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    MoviePage(),
    NovelPage(),
    FavoritePage(),
    AccountPage(),
  ];

  final List<String> _titles = const [
    "Movies",
    "Novels",
    "My Favorite",
    "",
  ];

  final List<Widget?> _actions = const [
    null,
    null,
    Icon(Icons.search, color: ThemeColor.black),
    Icon(Icons.search, color: ThemeColor.black),
  ];

  AppBar _buildAppBar(int index) {
    return AppBar(
      backgroundColor: ThemeColor.primaryBg,
      elevation: 0,
      title: header(_titles[index]),
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back_ios,
          color: ThemeColor.black,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        if (_actions[index] != null)
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(right: 15),
              child: _actions[index],
            ),
            onTap: () {},
          )
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: ThemeColor.primary,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: List<BottomNavigationBarItem>.generate(
        4,
        (index) => BottomNavigationBarItem(
          icon: Icon(icon[index]),
          label: labels[index],
        ),
      ),
      onTap: ((index) {
        setState(() {
          _currentIndex = index;
        });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primaryBg,
      appBar: _buildAppBar(_currentIndex),
      body: _tabs[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
