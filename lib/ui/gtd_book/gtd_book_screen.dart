import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/gutendex/entities/gtd_book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/logic/utils/extensions.dart';
import 'package:leafy/ui/book/widgets/book_detail.dart';
import 'package:leafy/ui/book/widgets/book_detail_long.dart';
import 'package:leafy/ui/book_editor/book_editor_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class GtdBookScreen extends StatelessWidget {
  final GtdBook book;
  final String? heroTag;

  const GtdBookScreen({super.key, required this.book, this.heroTag});

  bool get _hasEpub => book.formats?.applicationEpubZip != null;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: _buildSaveFab(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: context.colorScheme.surface.withValues(alpha: 0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colorScheme.surface.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.share),
            ),
            onPressed: () async {
              final url =
                  book.formats?.textHtml ?? book.formats?.applicationEpubZip;
              if (url != null) {
                await SharePlus.instance.share(
                  ShareParams(uri: Uri.parse(url)),
                );
              }
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCoverSpace(mediaQuery, context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildHeaderInfo(context),
                  const SizedBox(height: 16),
                  _buildOnlineReadButton(context),
                  const SizedBox(height: 24),
                  const Divider(),
                  _buildStatsRow(context),
                  const Divider(),
                  _buildTagsSection(context),
                  const SizedBox(height: 20),
                  _buildSummariesDetail(),
                  _buildDetailRow(
                    LocaleKeys.language.tr(),
                    book.languages.join(", "),
                  ),
                  _buildDetailRow(
                    "Copyright",
                    book.copyright == true ? "Yes" : "Public Domain",
                  ),
                  _buildDetailRow("Media Type", book.mediaType ?? "Unknown"),
                  _buildPersonListDetail("Editors", book.editors),
                  _buildPersonListDetail("Translators", book.translators),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveFab(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: _hasEpub ? () => _onSavePressed(context) : null,
      backgroundColor: _hasEpub
          ? context.colorScheme.primary
          : context.colorScheme.surfaceContainerHighest,
      foregroundColor: _hasEpub
          ? context.colorScheme.onPrimary
          : context.colorScheme.onSurfaceVariant,
      icon: Icon(_hasEpub ? Icons.save_alt_rounded : Icons.block),
      label: Text(_hasEpub ? "Save to Library" : "No EPUB"),
    );
  }

  Widget _buildCoverSpace(MediaQueryData mediaQuery, BuildContext context) {
    final coverUrl = book.formats?.imageJpeg;
    final double height = mediaQuery.size.height * 0.40;

    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background mờ
          // NOTE: thay bằng generate blur hash
          if (coverUrl != null)
            Image.network(
              coverUrl,
              fit: BoxFit.cover,
              color: Colors.black.withValues(alpha: 0.6),
              colorBlendMode: BlendMode.darken,
            )
          else
            Container(color: context.colorScheme.surfaceContainerHighest),

          // Gradient fade xuống body
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    context.colorScheme.surfaceContainer,
                  ],
                ),
              ),
            ),
          ),

          // Ảnh bìa chính
          Align(
            alignment: Alignment.bottomCenter,
            child: Hero(
              tag: heroTag ?? book.id.toString(),
              child: Container(
                height: height * 0.65,
                width: (height * 0.65) * 0.65,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: coverUrl != null
                      ? Image.network(
                          coverUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => _buildPlaceholderCover(),
                        )
                      : _buildPlaceholderCover(),
                ),
              ),
            ),
          ),

          // Badge: EPUB Available Indicator
          Positioned(
            top: mediaQuery.padding.top + 60,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _hasEpub ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white, width: 1.5),
                boxShadow: const [
                  BoxShadow(blurRadius: 4, color: Colors.black26),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _hasEpub ? Icons.check_circle : Icons.cancel,
                    color: Colors.white,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _hasEpub ? "EPUB" : "No EPUB",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderCover() {
    return Container(
      color: Colors.grey.shade300,
      child: const Center(
        child: Icon(Icons.book, size: 50, color: Colors.grey),
      ),
    );
  }

  Widget _buildHeaderInfo(BuildContext context) {
    final authors = book.authors.map((e) => e.name ?? "Unknown").join(", ");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          book.title ?? 'Unknown Title',
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        if (authors.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            authors,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildOnlineReadButton(BuildContext context) {
    if (book.formats?.textHtml == null) return const SizedBox.shrink();

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(color: context.colorScheme.outline),
        ),
        onPressed: () async {
          final uri = Uri.parse(book.formats!.textHtml!);
          if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
            // Handle error
          }
        },
        icon: const Icon(Icons.public),
        label: const Text("Read Online (Web)"),
      ),
    );
  }

  // --- Logic: Navigate to Save Screen ---
  void _onSavePressed(BuildContext context) {
    if (!_hasEpub) return;

    context.editBookCubit.initBookFromGutendex(
      title: book.title,
      authors: book.authors,
      bookshelves: book.bookshelves,
      subjects: book.subjects,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            BookEditorScreen(fromGutendex: true, gutendexFormat: book.formats),
      ),
    );

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text("Preparing to save '${book.title}'..."),
    //     action: SnackBarAction(label: "GO", onPressed: () {}),
    //   ),
    // );
  }

  Widget _buildStatsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(
            context,
            icon: Icons.download_done_rounded,
            label: "Downloads",
            value: "${book.downloadCount ?? 0}",
          ),
          _buildContainerLine(context),
          _buildStatItem(
            context,
            icon: Icons.language,
            label: "Language",
            value: book.languages.firstOrNull?.toUpperCase() ?? "UNK",
          ),
          _buildContainerLine(context),
          _buildStatItem(
            context,
            icon: Icons.copyright,
            label: "License",
            value: book.copyright == true ? "Protected" : "Public",
            isSecure: book.copyright == true,
          ),
        ],
      ),
    );
  }

  Widget _buildContainerLine(BuildContext context) {
    return Container(
      height: 30,
      width: 1,
      color: Theme.of(context).dividerColor,
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    bool isSecure = false,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          color: isSecure ? Colors.orange : Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildTagsSection(BuildContext context) {
    final allTags = [...book.bookshelves, ...book.subjects];

    if (allTags.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tags",
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: allTags.take(10).map((tag) {
            return Chip(
              label: Text(tag, style: const TextStyle(fontSize: 12)),
              padding: EdgeInsets.zero,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: context.colorScheme.surfaceContainerLow,
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSummariesDetail() {
    if (book.summaries.isEmpty) return const SizedBox.shrink();

    final text = book.summaries.join("\n\n");
    return BookDetailLong(title: LocaleKeys.description.tr(), text: text);
  }

  Widget _buildPersonListDetail(String title, List<dynamic> persons) {
    if (persons.isEmpty) return const SizedBox.shrink();
    final text = persons.map((p) => p.name).join("\n");
    return BookDetail(title: title, text: text);
  }

  Widget _buildDetailRow(String title, String text) {
    if (text.isEmpty) return const SizedBox.shrink();
    return BookDetail(title: title, text: text);
  }
}
