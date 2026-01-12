import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/utils/extensions/extensions.dart';

class BookFileCard extends StatelessWidget {
  final String? localFilePath;
  final String? downloadUrl;
  final VoidCallback onPickFile;
  final VoidCallback onDeleteFile;

  const BookFileCard({
    super.key,
    this.localFilePath,
    this.downloadUrl,
    required this.onPickFile,
    required this.onDeleteFile,
  });

  @override
  Widget build(BuildContext context) {
    bool hasFile = localFilePath != null || downloadUrl != null;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.3,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasFile
              ? context.colorScheme.primary.withValues(alpha: 0.5)
              : context.colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                FontAwesomeIcons.file,
                size: 16,
                color: context.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                "E-Book File", // Hoặc LocaleKeys.ebook_file.tr()
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Content Area
          if (!hasFile)
            _buildEmptyState(context)
          else if (localFilePath != null)
            _buildLocalFileState(context, localFilePath!)
          else
            _buildOnlineFileState(context, downloadUrl!),
        ],
      ),
    );
  }

  // State 1: Chưa có file
  Widget _buildEmptyState(BuildContext context) {
    return InkWell(
      onTap: onPickFile,
      borderRadius: BorderRadius.circular(8),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(cornerRadius),
          dashPattern: const [10, 8],
          color: context.colorScheme.onSurface.withValues(alpha: 0.3),
          strokeWidth: 2,
          padding: EdgeInsets.zero,
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Icon(Icons.upload_file, color: context.colorScheme.secondary),
              const SizedBox(height: 5),
              Text(
                "Tap to upload EPUB", // LocaleKeys.tap_to_upload.tr()
                style: TextStyle(color: context.colorScheme.secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // State 2: File đã có trong máy (Local)
  Widget _buildLocalFileState(BuildContext context, String path) {
    final file = File(path);
    String fileSizeString = "Unknown size";
    String fileName = path.split('/').last;

    if (file.existsSync()) {
      final bytes = file.lengthSync();
      fileSizeString = _formatBytes(bytes);
    }

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.check_circle, color: context.colorScheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "$fileSizeString • Local Storage",
                style: TextStyle(
                  fontSize: 12,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        // Action Buttons
        IconButton(
          onPressed: onDeleteFile,
          icon: Icon(Icons.close, color: context.colorScheme.error),
          tooltip: "Remove file",
        ),
      ],
    );
  }

  // State 3: File chờ tải (Gutendex)
  Widget _buildOnlineFileState(BuildContext context, String url) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.cloud_download, color: Colors.blue),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ready to download", // LocaleKeys.ready_to_download.tr()
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Source: Gutendex (Auto-download on Save)",
                style: TextStyle(
                  fontSize: 12,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onDeleteFile, // Cho phép hủy download nếu muốn
          icon: Icon(Icons.close, color: context.colorScheme.error),
          tooltip: "Cancel download",
        ),
      ],
    );
  }

  String _formatBytes(int bytes) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB"];
    var i = 0;
    double size = bytes.toDouble();
    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }
    return "${size.toStringAsFixed(1)} ${suffixes[i]}";
  }
}
