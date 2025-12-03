import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/data/models/book.dart';
import 'package:leafy/logic/cubit/current_book_cubit.dart';

class CoverBackground extends StatelessWidget {
  const CoverBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentBookCubit, Book>(
      buildWhen: (previous, current) {
        return previous.blurHash != current.blurHash;
      },
      builder: (context, state) {
        final image = BlurHash.decode(state.blurHash!).toImage(35, 20);

        return Image.memory(
          Uint8List.fromList(img.encodeJpg(image)),
          fit: BoxFit.cover,
          width: context.deviceSize.width,
          height: (context.deviceSize.height / 2.5) + context.padding.top + 20,
          frameBuilder:
              (
                BuildContext context,
                Widget child,
                int? frame,
                bool wasSynchronouslyLoaded,
              ) {
                if (wasSynchronouslyLoaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 0.6,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                  child: child,
                );
              },
        );
      },
    );
  }
}
