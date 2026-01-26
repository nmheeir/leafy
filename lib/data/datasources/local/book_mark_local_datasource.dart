import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../domain/book_marks/entities/book_mark.dart';
import 'database_service.dart';

abstract class BookMarkLocalDataSource {
  Future<int> saveBookMark(BookMark mark);
  Future<List<BookMark>> getBookMarks(int resourceId);
  Future<void> deleteBookMark(int id);
}

@LazySingleton(as: BookMarkLocalDataSource)
class BookMarkLocalDataSourceImpl implements BookMarkLocalDataSource {
  final DatabaseService _databaseService;

  BookMarkLocalDataSourceImpl(this._databaseService);

  @override
  Future<int> saveBookMark(BookMark mark) async {
    final db = await _databaseService.database;
    return await db.insert('book_marks', {
      'resource_id': mark.resourceId,
      'page_index': mark.pageIndex,
      'start_offset': mark.startOffset,
      'end_offset': mark.endOffset,
      'rects': mark.rects,
      'color': mark.color,
      'text': mark.text,
      'created_at': DateTime.now().millisecondsSinceEpoch,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<BookMark>> getBookMarks(int resourceId) async {
    final db = await _databaseService.database;
    final maps = await db.query(
      'book_marks',
      where: 'resource_id = ?',
      whereArgs: [resourceId],
    );

    return List.generate(maps.length, (i) {
      return BookMark(
        id: maps[i]['id'] as int,
        resourceId: maps[i]['resource_id'] as int,
        pageIndex: maps[i]['page_index'] as int,
        startOffset: maps[i]['start_offset'] as int?,
        endOffset: maps[i]['end_offset'] as int?,
        rects: maps[i]['rects'] as String,
        color: maps[i]['color'] as int,
        text: maps[i]['text'] as String?,
      );
    });
  }

  @override
  Future<void> deleteBookMark(int id) async {
    final db = await _databaseService.database;
    await db.delete('book_marks', where: 'id = ?', whereArgs: [id]);
  }
}
