import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/pages/bookmark_page.dart';
import 'package:recipes_app/pages/home_page.dart';
import 'package:recipes_app/provider/page_provider.dart';
import 'package:recipes_app/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    final List<Widget> pages = [
      const HomePage(), // Halaman default
      const BookmarkPage(),
    ];

    final List<String> titlePage = [
      "All Recipes",
      "Bookmarks",
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          titlePage[pageProvider.currentPageIndex],
          style: whiteTextStyle.copyWith(fontWeight: medium),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: pages[pageProvider.currentPageIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_sharp, size: 80),
                  Text('My Name'),
                ],
              ),
            ),
            ListTile(
              selectedTileColor: liteblueColor,
              selected: pageProvider.currentPageIndex == 0,
              title: Text(
                'Homepage',
                style: blackTextStyle,
              ),
              onTap: () {
                pageProvider.setPage(0);
                Navigator.pop(context); // Menutup drawer
              },
            ),
            ListTile(
              selectedTileColor: liteblueColor,
              selected: pageProvider.currentPageIndex == 1,
              title: Text(
                'Bookmark',
                style: blackTextStyle,
              ),
              onTap: () {
                pageProvider.setPage(1);
                Navigator.pop(context); // Menutup drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
