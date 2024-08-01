import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/appbar.dart';

class DismissItemScreen extends StatefulWidget {
  const DismissItemScreen({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<DismissItemScreen> {
  final List<String> items = List<String>.generate(20, (i) => 'Item ${i + 1}');
  String? recentlyDeletedItem;
  int? recentlyDeletedItemIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Dismissing Items',
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                recentlyDeletedItem = items[index];
                recentlyDeletedItemIndex = index;
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$item dismissed'),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      setState(() {
                        if (recentlyDeletedItem != null &&
                            recentlyDeletedItemIndex != null) {
                          items.insert(
                              recentlyDeletedItemIndex!, recentlyDeletedItem!);
                        }
                      });
                    },
                  ),
                ),
              );
            },
            movementDuration: const Duration(seconds: 1),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}
