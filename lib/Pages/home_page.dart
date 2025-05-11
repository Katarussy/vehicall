import 'package:flutter/material.dart';
import 'package:vehicall/Pages/favorites.dart';
import 'package:vehicall/Pages/rent_page.dart';
import 'package:vehicall/Pages/message_page.dart';
import 'package:vehicall/Pages/profile_page.dart';

import '../components/buttons_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottonBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const RentPage(),
    const FavoritePage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: MyButtonNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: (index) => navigateBottonBar(index),
      ),
      body: _pages[_selectedIndex],

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu, color: Color(0xFF123458)),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
        ),
      ),

      //drawer teh
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF123458)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashoard'),
              onTap: () {
                // Navigate to home
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
