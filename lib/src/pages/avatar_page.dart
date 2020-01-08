import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(7.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://dam.menshealthlatam.com/wp-content/uploads/2018/11/STANLEE.jpg'),
              radius: 20.0,
            ),
          ),
          SizedBox(),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('FG'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            fadeInDuration: Duration(milliseconds: 200),
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://s.france24.com/media/display/cb8f406c-1f48-11e9-8238-005056bff430/w:1240/p:16x9/stan_lee.jpg')),
      ),
    );
  }
}
