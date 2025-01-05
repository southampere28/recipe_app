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
      const HomePage(),
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
            DrawerHeader(
              decoration: const BoxDecoration(color: primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_sharp,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    'Pramudya Putra',
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ),
            ListTile(
              selectedTileColor: liteblueColor,
              selected: pageProvider.currentPageIndex == 0,
              title: Text(
                'Homepage',
                style: blackTextStyle.copyWith(
                    fontWeight:
                        pageProvider.currentPageIndex == 0 ? bold : medium),
              ),
              onTap: () {
                pageProvider.setPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              selectedTileColor: liteblueColor,
              selected: pageProvider.currentPageIndex == 1,
              title: Text(
                'Bookmark',
                style: blackTextStyle.copyWith(
                    fontWeight:
                        pageProvider.currentPageIndex == 1 ? bold : medium),
              ),
              onTap: () {
                pageProvider.setPage(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
