import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/domain/gutendex/entities/gtd_book.dart';
import 'package:leafy/ui/gtd_book/gtd_book_screen.dart';
// Import màn hình chi tiết

class GtdBookTile extends StatelessWidget {
  final GtdBook book;

  const GtdBookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final coverUrl = book.formats?.imageJpeg ?? book.formats?.imageJpeg;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  GtdBookScreen(book: book, heroTag: 'book_cover_${book.id}'),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCoverImage(coverUrl),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title ?? 'No Title',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    Text(
                      book.authors.map((e) => e.name).join(', '),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        _buildMetadataChip(
                          context,
                          icon: Icons.language,
                          label:
                              book.languages.firstOrNull?.toUpperCase() ??
                              'UNK',
                          color: Colors.blue.shade100,
                          textColor: Colors.blue.shade900,
                        ),
                        const SizedBox(width: 8),
                        _buildMetadataChip(
                          context,
                          icon: Icons.download_rounded,
                          label: _formatDownloadCount(book.downloadCount),
                          color: Colors.green.shade100,
                          textColor: Colors.green.shade900,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget hiển thị ảnh bìa
  Widget _buildCoverImage(String? url) {
    return Hero(
      tag: 'book_cover_${book.id}',
      child: Container(
        width: 60,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey.shade200,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: url != null
              ? Image.network(
                  url,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.broken_image, size: 20)),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                )
              : const Center(
                  child: FaIcon(
                    FontAwesomeIcons.book,
                    size: 24,
                    color: Colors.grey,
                  ),
                ),
        ),
      ),
    );
  }

  // Widget hiển thị Chip thông tin nhỏ (Lang, Download)
  Widget _buildMetadataChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // Format số lượt tải (ví dụ: 1500 -> 1.5k)
  String _formatDownloadCount(int? count) {
    if (count == null) return "0";
    if (count >= 1000) {
      return "${(count / 1000).toStringAsFixed(1)}k";
    }
    return count.toString();
  }
}
