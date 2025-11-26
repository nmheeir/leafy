import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leafy/core/constants/constants.dart';
import 'package:leafy/core/constants/enums/index.dart';

class BookTypeDropdown extends StatelessWidget {
  const BookTypeDropdown({
    super.key,
    required this.bookTypes,
    required this.changeBookType,
    // Tham số mới thay thế cho BLoC
    required this.selectedFormat,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
  });

  final List<String> bookTypes;
  final Function(String?) changeBookType;
  // BookFormat được chọn, truyền từ widget cha
  final BookFormat selectedFormat;
  final EdgeInsets padding;

  String _getBookTypeDropdownValue(BookFormat bookType) {
// ...existing code...
    switch (bookType) {
      case BookFormat.paperback:
        return bookTypes[0];
      case BookFormat.hardcover:
        return bookTypes[1];
      case BookFormat.ebook:
        return bookTypes[2];
      case BookFormat.audiobook:
        return bookTypes[3];
    }
  }

  @override
  Widget build(BuildContext context) {
// ...existing code...
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha:  0.5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cornerRadius),
            bottomLeft: Radius.circular(cornerRadius),
            topRight: Radius.circular(cornerRadius),
            bottomRight: Radius.circular(cornerRadius),
          ),
        ),
        // Loại bỏ BlocBuilder
        child: Row(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.fromLTRB(
                10,
                0,
                // Sử dụng `selectedFormat` thay vì `state.bookFormat`
                selectedFormat == BookFormat.audiobook
                    ? 2
                    : selectedFormat == BookFormat.ebook
                        ? 4
                        : 0,
                0,
              ),
              child: Center(
                child: FaIcon(
                  // Sử dụng `selectedFormat` thay vì `state.bookFormat`
                  selectedFormat == BookFormat.audiobook
                      ? FontAwesomeIcons.headphones
                      : selectedFormat == BookFormat.ebook
                          ? FontAwesomeIcons.tabletScreenButton
                          : FontAwesomeIcons.bookOpen,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  buttonStyleData: const ButtonStyleData(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                  items: bookTypes
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14)),
                          ))
                      .toList(),
                  // Sử dụng `selectedFormat` thay vì `state.bookFormat`
                  value: _getBookTypeDropdownValue(selectedFormat),
                  onChanged: (value) {
                    changeBookType(value);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}