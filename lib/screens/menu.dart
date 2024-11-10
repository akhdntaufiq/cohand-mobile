import 'package:flutter/material.dart';
import 'package:cohand_mobile/widgets/left_drawer.dart';
import 'package:cohand_mobile/widgets/product_card.dart';

void main() => runApp(const CohandApp());

class CohandApp extends StatelessWidget {
  const CohandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cohand',
      theme: ThemeData(
        primaryColor: const Color(0xFF1e1e1e),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list, const Color(0xFF99a485)),
    ItemHomepage("Tambah Produk", Icons.add, const Color(0xFF525D42)),
    ItemHomepage("Logout", Icons.logout, const Color(0xFFe44747)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFFF9F5E8),
        ),
        title: const Text(
          'Cohand',
          style: TextStyle(
            color: Color(0xFFF9F5E8),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const LeftDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade100, Colors.grey.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 24.0),
              child: Text(
                'Welcome to Cohand',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                  color: Color(0xFF5B5247),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ItemCard(items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}