import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/appbar.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Drawer',
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        width: 200,
        child: ListView(
          padding: const EdgeInsets.only(top: 100),
          children: [
            Column(
              children: drawerItems.asMap().entries.map((entry) {
                int index = entry.key;
                String item = entry.value;
                return ListTile(
                  title: Text(item),
                  selected: _selectedIndex == index,
                  onTap: () {
                    _onItemTapped(index);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> drawerItems = [
  "Home",
  "Business",
  "About",
  "Blog",
  "Contact",
];

const List<Widget> _widgetOptions = [
  Text('Home Page'),
  Text('Business Page'),
  Text('About Page'),
  Text('Blog Page'),
  Text('Contact Page'),
];
