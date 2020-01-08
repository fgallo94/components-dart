import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _numberList = new List();

  ScrollController _scrollController = new ScrollController();

  int _lastIndex = 0;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTenImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        _fetchData();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: Stack(children: <Widget>[_createList(), _createLoading()]),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _pullToRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final _index = _numberList[index];
          return Container(
            child: FadeInImage(
              image: NetworkImage(
                  'https://i.picsum.photos/id/$_index/500/600.jpg'),
              fit: BoxFit.fill,
              placeholder: AssetImage('assets/jar-loading.gif'),
            ),
          );
        },
      ),
    );
  }

  void _addTenImages() {
    for (var i = 0; i < 10; i++) {
      _lastIndex++;
      _numberList.add(_lastIndex);
    }
    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    return new Timer(Duration(seconds: 4), responseHttp);
  }

  void responseHttp() {
    _isLoading = false;
    _addTenImages();
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(backgroundColor: Colors.white)
              ],
            ),
            SizedBox(
              height: 15.00,
            )
          ]);
    } else {
      return Container();
    }
  }

  Future<Null> _pullToRefresh() async {
    final Duration duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastIndex++;
      _addTenImages();
    });

    return Future.delayed(duration);
  }
}
