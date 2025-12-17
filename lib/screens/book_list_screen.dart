import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/book_service.dart';
import '../services/auth_service.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  BookService bookService = BookService();
  AuthService authService = AuthService();
  List<Book> books = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBooks();
  }

  void loadBooks() async {
    List<Book> loadedBooks = await bookService.getBooks();
    setState(() {
      books = loadedBooks;
      isLoading = false;
    });
  }

  void logout() async {
    await authService.logout();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Déconnexion réussie')));
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livres Disponibles'),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: logout)],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                Book book = books[index];
                return ListTile(
                  leading: Image.asset(
                    book.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/book_detail',
                      arguments: book.id,
                    );
                  },
                );
              },
            ),
    );
  }
}
