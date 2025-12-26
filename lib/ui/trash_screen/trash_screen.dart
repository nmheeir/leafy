import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/data/models/book/book/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/main.dart';
import 'package:leafy/ui/books/widgets/layouts/books_list.dart';

//TODO: add some logic (delete_all button, dismissible to delete or recovery)
class TrashScreen extends StatelessWidget {
  const TrashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bookCubit.getDeletedBooks();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.deleted_books.tr(),
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: StreamBuilder<List<Book>>(
        stream: bookCubit.deletedBooks,
        builder: (context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text(
                    LocaleKeys.no_deleted_books.tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }
            return BooksList(
              books: snapshot.data!,
              listNumber: 5,
              allBooksCount: null,
            );
          } else if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
