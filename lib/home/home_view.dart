// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final ScrollController scrollController;
  const HomeView({
    super.key,
    required this.scrollController,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isHeaderClose = false;
  int defaultTabLength = 4;
  final String _randomImage = "https://picsum.photos/200/300";
  final String _dummytext =
      "  lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton(),
      body: _listviewBuilder(),
    );
  }

  Expanded _listviewBuilder() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        controller: widget.scrollController,
        itemBuilder: (context, index) => _listviewCard(),
      ),
    );
  }

  FloatingActionButton _fabButton() => const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      );

  Card _listviewCard() {
    return Card(
      child: ListTile(
        title: Wrap(
          runSpacing: 5,
          direction: Axis.horizontal,
          children: [
            _listCardTitle(),
            Text(_dummytext),
            _placeHolderfield,
            _footerButtonList(),
          ],
        ),
        leading: CircleAvatar(backgroundImage: NetworkImage(_randomImage)),
      ),
    );
  }

  Row _footerButtonList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconLabelButton,
        _iconLabelButton,
        _iconLabelButton,
        _iconLabelButton,
      ],
    );
  }

  Text _listCardTitle() {
    return const Text(
      "Hello",
      style: titleTextStyle,
    );
  }

  Widget get _placeHolderfield => const SizedBox(
        height: 100,
        child: Placeholder(),
      );

  Widget _iconLabel(String text) => Wrap(
        spacing: 5,
        children: [
          const Icon(
            Icons.comment,
            size: 25,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget get _iconLabelButton => InkWell(
        onTap: () {},
        child: _iconLabel("1"),
      );
}

const titleTextStyle = TextStyle(
  letterSpacing: 1,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
