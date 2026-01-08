import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/gutendex/entities/gtd_book.dart';
import 'package:leafy/generated/locale_keys.g.dart';
import 'package:leafy/ui/book/widgets/book_detail.dart';
import 'package:leafy/ui/book/widgets/book_detail_long.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// NOTE: thêm một nút để lưu sách vào trong database

class GtdBookScreen extends StatelessWidget {
  final GtdBook book;
  final String? heroTag;

  const GtdBookScreen({super.key, required this.book, this.heroTag});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download_rounded),
            onPressed: () {
              _onDownloadPressed(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              await SharePlus.instance.share(
                ShareParams(uri: Uri.parse(book.formats!.textHtml!)),
              );
            },
          ),
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
                  const SizedBox(height: 20),
                  _buildActionButtons(context),
                  const SizedBox(height: 20),
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

  // 1. Cover Image Area (Remote Image)
  Widget _buildCoverSpace(MediaQueryData mediaQuery, BuildContext context) {
    final coverUrl = book.formats?.imageJpeg ?? book.formats?.imageJpeg;
    final double height = mediaQuery.size.height * 0.35;

    return Container(
      width: double.infinity,
      height: height + mediaQuery.padding.top,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.3,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 20,
            child: Hero(
              tag: heroTag ?? book.id.toString(),
              child: Container(
                height: height * 0.8,
                width: (height * 0.8) * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
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

  // 2. Title & Author
  Widget _buildHeaderInfo(BuildContext context) {
    final authors = book.authors.map((e) => e.name ?? "Unknown").join(", ");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          book.title ?? 'Unknown Title',
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        if (authors.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            authors,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ],
    );
  }

  // 3. Action Buttons (Download / Read)
  Widget _buildActionButtons(BuildContext context) {
    final hasEpub = book.formats?.applicationEpubZip != null;
    final hasHtml = book.formats?.textHtml != null;

    return Row(
      children: [
        if (hasEpub)
          Expanded(
            child: FilledButton.icon(
              onPressed: () => _onDownloadPressed(context),
              icon: const Icon(Icons.download),
              label: const Text("Download EPUB"),
            ),
          ),
        if (hasEpub && hasHtml) const SizedBox(width: 10),
        if (hasHtml)
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () async {
                if (!await launchUrl(
                  Uri.parse(book.formats!.textHtml ?? ''),
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception('Could not launch ${book.formats?.textHtml}');
                }
              },
              icon: const Icon(Icons.open_in_browser),
              label: const Text("Read Online"),
            ),
          ),
      ],
    );
  }

  // 4. Statistics Row
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

  // 5. Tags (Subjects & Bookshelves)
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

  // 6. Summaries (Description)
  Widget _buildSummariesDetail() {
    if (book.summaries.isEmpty) return const SizedBox.shrink();

    // Nối các summary lại hoặc lấy cái đầu tiên
    final text = book.summaries.join("\n\n");
    return BookDetailLong(title: LocaleKeys.description.tr(), text: text);
  }

  // Helper for Person List
  Widget _buildPersonListDetail(String title, List<dynamic> persons) {
    if (persons.isEmpty) return const SizedBox.shrink();
    final text = persons.map((p) => p.name).join("\n");
    return BookDetail(title: title, text: text);
  }

  // Helper for Simple Row
  Widget _buildDetailRow(String title, String text) {
    if (text.isEmpty) return const SizedBox.shrink();
    return BookDetail(title: title, text: text);
  }

  void _onDownloadPressed(BuildContext context) {
    final epubUrl = book.formats?.applicationEpubZip;
    if (epubUrl != null) {
      // TODO: Call Cubit/Bloc to download and add to database
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Downloading from: $epubUrl")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("No EPUB format available")));
    }
  }
}
