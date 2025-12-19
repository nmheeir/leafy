import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DefaultBookTagCubit extends HydratedCubit<List<String>> {
  DefaultBookTagCubit() : super([]);

  void updateTag(String tag) {
    final updatedTags = [...state];

    if (updatedTags.contains(tag)) {
      updatedTags.remove(tag);
    } else {
      updatedTags.add(tag);
    }

    emit(updatedTags);
  }

  @override
  List<String>? fromJson(Map<String, dynamic> json) {
    final tags =
        (json['default_book_tags'] as List?)
            ?.map((e) => e.toString())
            .toList() ??
        [];
    return tags;
  }

  @override
  Map<String, dynamic>? toJson(List<String> state) {
    return {'default_book_tags': state};
  }
}
