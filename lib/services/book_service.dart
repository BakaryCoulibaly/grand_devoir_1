import '../models/book.dart';

class BookService {
  // Liste simple de livres
  List<Book> books = [
    Book(
      id: '1',
      title: 'Kaïdara',
      author: 'Amadou Hampâté Bâ',
      description:
          'Conte initiatique africain sur la sagesse et la connaissance.',
      imageUrl: 'assets/Amadou Hampâté Bâ.webp',
    ),

    Book(
      id: '2',
      title: 'Ce que je crois',
      author: 'Léopold Sédar Senghor',
      description:
          'Essai autobiographique sur la négritude et la culture africaine.',
      imageUrl: 'assets/leopold sedar senghor.webp',
    ),

    Book(
      id: '3',
      title: "L'Enfant noir",
      author: 'Camara Laye',
      description: 'Roman autobiographique sur l’enfance en Guinée.',
      imageUrl: 'assets/camara laye.webp',
    ),

    Book(
      id: '4',
      title: 'Sous l’orage',
      author: 'Seydou Badian',
      description: 'Conflit entre tradition africaine et modernité.',
      imageUrl: 'assets/seydou badian.webp',
    ),
  ];

  // Récupérer tous les livres
  List<Book> getBooks() {
    return books;
  }

  // Récupérer un livre par ID
  Book getBookById(String id) {
    return books.firstWhere((book) => book.id == id);
  }
}
