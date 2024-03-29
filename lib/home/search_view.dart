import 'package:flutter/material.dart';

import '../model/trend_topic.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final double _padding = 20;
  late TrendTopic _trendTopic;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _trendTopic = TrendTopic(
      hashtag: "#Champions League",
      location: "Trending in United States",
      tweet: "1.2M Tweets",
    );
  }

  Future<void> tempFuture() async {
    print("object");
    await Future.delayed(const Duration(seconds: 1));
    print("asdf ");
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: tempFuture,
      child: ListView(
        controller: widget.scrollController,
        children: [_downIconWidget, _emptySpace, _trendTitleWidget, _listHashView()],
      ),
    );
  }

  ListView _listHashView() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => cardListMethod(context),
        separatorBuilder: (context, index) => _divider(),
        itemCount: 5);
  }

  Card cardListMethod(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: const RoundedRectangleBorder(
        side: BorderSide(style: BorderStyle.none, color: Colors.transparent, width: 0.5),
      ),
      child: _listpadding(context),
    );
  }

  Padding _listpadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _padding, vertical: 10),
      child: row(context),
    );
  }

  Row row(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          spacing: 5,
          children: [
            Text(
              _trendTopic.location ?? "",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              _trendTopic.hashtag ?? "",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 15),
            ),
            Text(
              _trendTopic.tweet ?? "",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        )),
        const Icon(Icons.arrow_drop_down),
      ],
    );
  }

  Divider _divider() {
    return const Divider(
      height: 0,
      color: Colors.grey,
    );
  }

  Widget get _emptySpace => const SizedBox(height: 10);

  Widget get _downIconWidget => Container(
        child: const Icon(
          Icons.arrow_downward,
          color: Colors.grey,
        ),
      );

  Widget get _trendTitleWidget => Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _padding),
          alignment: Alignment.centerLeft,
          height: 50,
          child: Text("Trends for you ", style: Theme.of(context).textTheme.headlineMedium),
        ),
      );
}
