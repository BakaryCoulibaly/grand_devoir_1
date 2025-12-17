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
      imageUrl: 'https://via.placeholder.com/150?text=Kaïdara',
    ),

    Book(
      id: '2',
      title: 'Ce que je crois',
      author: 'Léopold Sédar Senghor',
      description:
          'Essai autobiographique sur la négritude et la culture africaine.',
      imageUrl: 'https://via.placeholder.com/150?text=Ce+que+je+crois',
    ),

    Book(
      id: '3',
      title: "L'Enfant noir",
      author: 'Camara Laye',
      description: 'Roman autobiographique sur l’enfance en Guinée.',
      imageUrl: 'https://via.placeholder.com/150?text=L+Enfant+noir',
    ),

    Book(
      id: '4',
      title: 'Sous l’orage',
      author: 'Seydou Badian',
      description: 'Conflit entre tradition africaine et modernité.',
      imageUrl: 'https://via.placeholder.com/150?text=Sous+l+orage',
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
