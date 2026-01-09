// lib/ui/book_editor/widgets/downloading_dialog.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/logic/cubit/book_editor_action/book_editor_action_cubit.dart';

class DownloadingDialog extends StatelessWidget {
  const DownloadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // PopScope (thay thế WillPopScope) chặn nút Back của Android
    return PopScope(
      canPop: false, 
      child: AlertDialog(
        title: const Text("Downloading eBook..."),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Please wait while we fetch the book content."),
            const SizedBox(height: 20),
            BlocBuilder<BookEditorActionCubit, BookEditorActionState>(
              buildWhen: (previous, current) => previous.downloadProgress != current.downloadProgress,
              builder: (context, state) {
                final percent = (state.downloadProgress * 100).toStringAsFixed(0);
                return Column(
                  children: [
                    LinearProgressIndicator(value: state.downloadProgress),
                    const SizedBox(height: 10),
                    Text("$percent%", style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Gọi huỷ bên Cubit
              context.read<BookEditorActionCubit>().cancelDownload();
              Navigator.of(context).pop(false); // Trả về false (thất bại/huỷ)
            },
            child: const Text("Cancel", style: TextStyle(color: Colors.red)),
          )
        ],
      ),
    );
  }
}