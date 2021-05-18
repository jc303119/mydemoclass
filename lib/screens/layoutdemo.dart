import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LayoutDemo extends StatefulWidget {
  @override
  _LayoutDemoState createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  launchApp(String url) async {
    if(await canLaunch(url)){
      await launch(url);
    }else {
      throw 'Could no Launch $url';
    }
  }

  _toggleFavorite(){
    setState(() {
      if(_isFavorited){
        _favoriteCount -= 1;
        _isFavorited = false;
      }
      else{
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    String image =
        'https://shepherdtraveller.com/wp-content/uploads/2020/04/oeschinensee-camping-Lakes-in-Switzerland-720x480.jpg';

    Widget titlesection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
//          Icon(
//            Icons.star,
//            color: Colors.red[500],
//          ),
          Container(
            child: IconButton(
              icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: (){
                 _toggleFavorite();
              },
            ),
          ),
          //Text('41')
          SizedBox(
            width: 18,
            child: Container(
              child: Text('$_favoriteCount'),
            ),
          )
        ],
      ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Widget buttonsection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, 'CALL', ),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        // softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FLutter Layout Demo'),
      ),
      body: ListView(
        children: <Widget>[
//          Image.asset(
//            'images/lake.jpg',
//            width: 600,
//            height: 240,
//            fit: BoxFit.cover,
//          ),
          Image.network(
            image,
            width: 6000,
            height: 240,
            fit: BoxFit.cover,
          ),
          titlesection,
          buttonsection,
          textSection,
        ],
      ),
    );
  }
}
