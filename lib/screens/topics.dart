import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
        backgroundColor: Colors.purple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.graduationCap),
            title: Text('Topics'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bolt),
            title: Text('About'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userCircle),
            title: Text('Profile'),
          ),
        ].toList(),
        fixedColor: Colors.deepPurple[200],
        onTap: (int idx) {
          switch (idx) {
            case 0:
              break;
            case 1:
              Navigator.pushNamed(context, '/about');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
