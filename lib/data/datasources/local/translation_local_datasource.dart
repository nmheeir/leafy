import 'package:injectable/injectable.dart';
import 'package:leafy/core/constants/enums/translation_language.dart';
import 'package:leafy/data/datasources/local/database_service.dart';
import 'package:leafy/data/models/translation/summary_model.dart';
import 'package:leafy/data/models/translation/translation_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class TranslationLocalDataSource {
  Future<void> saveTranslation(TranslationModel translation);
  Future<TranslationModel?> getTranslation(
    String fileHash,
    int chapterIndex,
    TranslationLanguage lang,
  );
  Future<void> saveSummary(SummaryModel summary);
  Future<List<SummaryModel>> getSummaries(
    String fileHash,
    int startChapter,
    int endChapter,
  );
}

@LazySingleton(as: TranslationLocalDataSource)
class TranslationLocalDataSourceImpl implements TranslationLocalDataSource {
  final DatabaseService _databaseService;

  TranslationLocalDataSourceImpl(this._databaseService);

  Future<Database> get _db async => _databaseService.database;

  @override
  Future<void> saveTranslation(TranslationModel translation) async {
    final db = await _db;

    await db.insert(
      'epub_translations',
      translation.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<TranslationModel?> getTranslation(
    String fileHash,
    int chapterIndex,
    TranslationLanguage lang,
  ) async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query(
      'epub_translations',
      where: 'file_hash = ? AND chapter_index = ? AND target_lang = ?',
      whereArgs: [fileHash, chapterIndex, lang],
    );

    if (maps.isEmpty) return null;

    return TranslationModel.fromJson(maps.first);
  }

  @override
  Future<void> saveSummary(SummaryModel summary) async {
    final db = await _db;

    final map = {
      'file_hash': summary.fileHash,
      'chapter_index': summary.chapterIndex,
      'summary_content': summary.summaryContent,
      'last_updated': DateTime.now().millisecondsSinceEpoch,
    };

    await db.insert(
      'epub_summary',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<SummaryModel>> getSummaries(
    String fileHash,
    int startChapter,
    int endChapter,
  ) async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query(
      'epub_summary',
      where: 'file_hash = ? AND chapter_index >= ? AND chapter_index <= ?',
      whereArgs: [fileHash, startChapter, endChapter],
      orderBy: 'chapter_index ASC',
    );

    return maps.map((e) => SummaryModel.fromJson(e)).toList();
  }
}
