import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/book_list_screen.dart';
import 'screens/book_detail_screen.dart';
import 'services/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Librairie App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthWrapper(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/books': (context) => BookListScreen(),
        '/book_detail': (context) => BookDetailScreen(),
      },
    );
  }
}

class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  AuthService authService = AuthService();
  bool isLoggedIn = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    bool loggedIn = await authService.isLoggedIn();
    setState(() {
      isLoggedIn = loggedIn;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (isLoggedIn) {
      return BookListScreen();
    } else {
      return LoginScreen();
    }
  }
}
