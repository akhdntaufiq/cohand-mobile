import 'package:cohand_mobile/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      }, 
      child: MaterialApp(
        title: 'Cohand',
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(
            primary:    const Color(0xFF5B5247),
            secondary:  const Color(0xFF99A485),
          ),
          scaffoldBackgroundColor: const Color(0xFFF9F5E8),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
