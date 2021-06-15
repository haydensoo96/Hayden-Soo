import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app_1/screens/home/components/binder.dart';
import 'package:flutter_app_1/screens/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> tabs = <Widget> [
    Center(child: Body()),
    Center(child: Binder()),
    Center(child: Text('Shopping')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text("Shopping"),
              icon: Icon(Icons.add_shopping_cart),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text("Binder"),
              icon: Icon(Icons.adjust_outlined),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text("Home"),
              icon: Icon(Icons.home),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg", color: kTextColor),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                color: kTextColor,
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                color: kTextColor,
              )),
          SizedBox(width: kDefaultPadding / 2)
        ]);
  }
}
