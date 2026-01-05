import 'package:injectable/injectable.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/domain/book/repositories/book_repository.dart';

@injectable
class WatchAllBooksUseCase {
  final BookRepository bookRepository;

  WatchAllBooksUseCase(this.bookRepository);

  Stream<List<Book>> call() {
    return bookRepository.watchAllNotDeletedBooks();
  }
}