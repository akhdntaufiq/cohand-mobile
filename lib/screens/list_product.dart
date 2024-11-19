import 'package:flutter/material.dart';
import 'package:cohand_mobile/models/product.dart';
import 'package:cohand_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchMood(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');

    var data = response;

    List<Product> listProduk = [];
    for (var d in data) {
      if (d != null) {
        listProduk.add(Product.fromJson(d));
      }
    }
    return listProduk;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(
            color: Color(0xFFF9F5E8),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF5B5247),
        iconTheme: const IconThemeData(color: Color(0xFFF9F5E8)),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMood(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum ada data mood pada mental health tracker.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF5B5247),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F5E8),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: const Color(0xFF5B5247), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF99a485),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Price: ${snapshot.data![index].fields.price}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF525D42),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Description: ${snapshot.data![index].fields.description}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF5B5247),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Time: ${snapshot.data![index].fields.dateAdded}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF5B5247),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
