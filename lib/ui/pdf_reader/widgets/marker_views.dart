import 'package:flutter/material.dart';

class Marker {
  Marker({
    required this.color,
    required this.pageNumber,
    required this.bounds,
    required this.text,
  }) : id = null;

  Marker.fromEntity(
    this.color,
    this.pageNumber,
    this.bounds,
    this.text,
    this.id,
  );

  final int? id;
  final Color color;
  final int pageNumber;
  final Rect bounds;
  final String text;
}

class MarkersView extends StatefulWidget {
  const MarkersView({
    required this.markers,
    super.key,
    this.onTap,
    this.onDeleteTap,
  });

  final List<Marker> markers;
  final void Function(Marker marker)? onTap;
  final void Function(Marker marker)? onDeleteTap;

  @override
  State<MarkersView> createState() => _MarkersViewState();
}

class _MarkersViewState extends State<MarkersView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final marker = widget.markers[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: Stack(
            children: [
              Material(
                color: marker.color.withAlpha(100),
                child: InkWell(
                  onTap: () => widget.onTap?.call(marker),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: Text('Page #${marker.pageNumber} - ${marker.text}'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => widget.onDeleteTap?.call(marker),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: widget.markers.length,
    );
  }
}
