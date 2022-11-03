import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ListView(),
    );
  }
}

class ListView extends StatefulWidget {
  const ListView({Key? key,}) : super(key: key);
  @override
  State<ListView> createState() => _ListViewState();
}

class _ListViewState extends State<ListView> {
  final items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Widget'),
        centerTitle: true,
      ),
      body: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (newIndex > oldIndex) newIndex--;
              final item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          },
          children: [
            for (final item in items)
              Card(
                  key: ValueKey(item),
                  elevation: 5,
                  child: ListTile(title: Text(item)))
          ]),
    );
  }
}
