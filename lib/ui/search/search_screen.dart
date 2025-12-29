import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/book/entities/book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';
import 'package:leafy/main.dart';
import 'package:leafy/ui/book/book_screen.dart';
import 'package:leafy/ui/book_editor/widgets/form_fields/book_text_field.dart';
import 'package:leafy/ui/books/widgets/cards/book_card_list.dart';
import 'package:leafy/ui/common/keyboard_dismissable.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(() {
      bookCubit.getSearchBooks(_searchController.text);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissible(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.search_in_books.tr(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: BookTextField(
                controller: _searchController,
                keyboardType: TextInputType.name,
                maxLength: 99,
                autofocus: true,
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            Expanded(
              child: StreamBuilder<List<Book>>(
                stream: bookCubit.searchBooks,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final heroTag = 'tag_$index';

                        return BookCardList(
                          book: snapshot.data![index],
                          heroTag: heroTag,
                          addBottomPadding:
                              (snapshot.data!.length == index + 1),
                          cardColor: context.colorScheme.secondaryContainer
                              .withAlpha(150),
                          onPressed: () {
                            if (snapshot.data![index].id == null) return;

                            context.read<CurrentBookCubit>().setBook(
                              snapshot.data![index],
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookScreen(heroTag: heroTag),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
