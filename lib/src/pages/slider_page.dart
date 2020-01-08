import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.00;

  bool _checkBlock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Text('Size of the image'),
            SizedBox(
              height: 20.00,
            ),
            _createSlider(),
            _createCheckbox(),
            Expanded(
              child: _createImage(),
            )
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      value: _sliderValue,
      activeColor: Colors.indigo,
      label: 'Size of the image',
      min: 0.00,
      max: 500.00,
      onChanged: (_checkBlock)
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://images-na.ssl-images-amazon.com/images/I/71vntClRfjL._AC_SL1500_.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
      value: _checkBlock,
      title: Text('Block slider'),
      onChanged: (value) {
        setState(() {
          _checkBlock = value;
        });
      },
    );
  }
}
