import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:leafy/core/utils/extensions/extensions.dart';
import 'package:leafy/logic/cubit/book_detail/book_detail_cubit.dart';

class CoverBackground extends StatelessWidget {
  const CoverBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailCubit, BookDetailState>(
      // We could use buildWhen to optimize, but state change is rare enough.
      builder: (context, state) {
        return state.maybeMap(
          loaded: (loadedState) {
            final blurHash = loadedState.bookWithDetails.book.blurHash;
            if (blurHash == null || blurHash.isEmpty) {
              return const SizedBox.shrink();
            }

            // Ideally this heavy computation should be done in Isolate or pre-calculated
            // But for now keeping it as is.
            final image = BlurHash.decode(blurHash).toImage(35, 20);

            return Image.memory(
              Uint8List.fromList(img.encodeJpg(image)),
              fit: BoxFit.cover,
              width: context.deviceSize.width,
              height:
                  (context.deviceSize.height / 2.5) + context.padding.top + 20,
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
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
