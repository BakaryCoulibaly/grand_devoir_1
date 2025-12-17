import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/book_service.dart';

class BookDetailScreen extends StatefulWidget {
  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  BookService bookService = BookService();
  Book? book;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String bookId = ModalRoute.of(context)!.settings.arguments as String;
    loadBook(bookId);
  }

  void loadBook(String id) async {
    Book loadedBook = await bookService.getBookById(id);
    setState(() {
      book = loadedBook;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails du Livre')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : book == null
          ? Center(child: Text('Livre non trouvé'))
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(book!.imageUrl, height: 200, fit: BoxFit.cover),
                  SizedBox(height: 16),
                  Text(
                    book!.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Auteur: ${book!.author}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  Text(book!.description),
                ],
              ),
            ),
    );
  }
}
