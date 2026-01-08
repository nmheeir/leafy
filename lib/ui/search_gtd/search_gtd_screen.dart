// lib/ui/search_gtd/search_gtd_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/di/injection.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/bloc/search_gtd/search_gtd_bloc.dart';
import 'package:leafy/ui/search_gtd/widgets/gtd_book_tile.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchGtdScreen extends StatelessWidget {
  const SearchGtdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SearchGtdBloc>()..add(const SearchGtdEvent.fetched()),
      child: const SearchGtdView(),
    );
  }
}

class SearchGtdView extends StatefulWidget {
  const SearchGtdView({super.key});

  @override
  State<SearchGtdView> createState() => _SearchGtdViewState();
}

class _SearchGtdViewState extends State<SearchGtdView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<SearchGtdBloc>().add(const SearchGtdEvent.fetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.search_in_gutendex.tr())),
      body: BlocBuilder<SearchGtdBloc, SearchGtdState>(
        builder: (context, state) {
          switch (state.status) {
            case SearchGtdStatus.failure:
              return Center(child: Text(state.errorMessage ?? 'Error'));

            case SearchGtdStatus.initial:
              return const Center(child: CircularProgressIndicator());

            case SearchGtdStatus.success:
              if (state.books.isEmpty) {
                return const Center(child: Text('No books found'));
              }

              return ListView.separated(
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.books.length
                    : state.books.length + 1,
                separatorBuilder: (context, index) => const SizedBox.shrink(),
                itemBuilder: (context, index) {
                  if (index >= state.books.length) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: LoadingAnimationWidget.staggeredDotsWave(
                          color: context.colorScheme.primary,
                          size: 30,
                        ),
                      ),
                    );
                  }

                  final item = state.books[index];
                  return GtdBookTile(book: item);
                },
              );
          }
        },
      ),
    );
  }
}
