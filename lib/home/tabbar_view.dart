import 'package:flutter/material.dart';

import 'home_view.dart';
import 'search_view.dart';

class TwitterTabbarView extends StatefulWidget {
  const TwitterTabbarView({super.key});

  @override
  State<TwitterTabbarView> createState() => _TwitterTabbarViewState();
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  bool isHeaderClose = false;
  double lastOffset = 0;
  late ScrollController scrollController;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {
      print(scrollController.offset);
      print(lastOffset);

      if (scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (scrollController.offset >= scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = scrollController.offset > lastOffset ? true : false;
      }
      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: _bottomAppBar,
        body: Column(
          children: [
            _sizedboxAppbar(),
            Expanded(
              child: TabBarView(children: [
                HomeView(scrollController: scrollController),
                SearchView(scrollController: scrollController),
                const Text("data"),
                const Text("data"),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _bottomAppBar => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: _tabbarItems(),
      );

  TabBar _tabbarItems() => TabBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        isScrollable: false,
        tabs: const [
          Tab(icon: Icon(Icons.dashboard)),
          Tab(icon: Icon(Icons.radio)),
          Tab(icon: Icon(Icons.satellite)),
          Tab(icon: Icon(Icons.verified_user)),
        ],
      );

  AppBar _appbar() => AppBar(
        elevation: 0,
        title: _appbarItems(),
        centerTitle: false,
      );

  Wrap _appbarItems() => Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          _centerAppBarWidget(),
          const CircleAvatar(
            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/57899051?v=4'),
          ),
        ],
      );

  Widget _centerAppBarWidget() {
    return currentIndex == 2
        ? const SizedBox(
            height: 50,
            child: TextField(),
          )
        : const Text(
            'Home',
            style: titleTextStyle,
          );
  }

  AnimatedContainer _sizedboxAppbar() => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: isHeaderClose ? 0 : 50,
        child: _appbar(),
      );
}
