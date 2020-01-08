import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        children: <Widget>[
          _cardType1(),
          SizedBox(
            height: 30.0,
          ),
          _cartType2(),
        ],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Card Title'),
            subtitle: Text('In this section you need to put your description'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cartType2() {
    return Card(
        child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage(
              'https://astanatimes.com/wp-content/uploads/2018/01/Part_3.jpeg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 400.0,
          fit: BoxFit.cover,
        ),
      ],
    ));
  }
}
