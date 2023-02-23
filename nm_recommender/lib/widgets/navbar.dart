import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/screens/account_page.dart';
import 'package:nm_recommender/screens/favorite_page.dart';
import 'package:nm_recommender/screens/movie_page.dart';
import 'package:nm_recommender/screens/novel_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  static List<String> labels = ["movies", "novels", "favorite", "account"];
  static List<IconData> icon = [
    Icons.local_movies_outlined,
    Icons.menu_book_rounded,
    Icons.favorite,
    Icons.person
  ];

  int _currentIndex = 0;

  final tap = [
    const MoviePage(),
    const NovelPage(),
    const FavoritePage(),
    const AccountPage(),
  ];

  final title = [
    "Movies",
    "Novels",
    "My Favorite",
    "",
  ];

  final action = [
    null,
    null,
    const Icon(Icons.search, color: ThemeColor.black),
    const Icon(Icons.search, color: ThemeColor.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: List<AppBar>.generate(
            4,
            (index) => AppBar(
                  backgroundColor: ThemeColor.primaryBg,
                  elevation: 0,
                  title: header(title[index]),
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
                    if (index >= 2)
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.only(right: 15),
                          child: action[index],
                        ),
                        onTap: () {},
                      )
                  ],
                ))[_currentIndex],
        body: tap[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: ThemeColor.primary,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: List<BottomNavigationBarItem>.generate(
              4,
              (index) => BottomNavigationBarItem(
                  icon: Icon(icon[index]), label: labels[index])),
          onTap: ((index) {
            setState(() {
              _currentIndex = index;
            });
          }),
        ));
  }
}
