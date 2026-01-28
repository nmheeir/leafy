import 'package:flutter/material.dart';
import 'package:leafy/domain/tag/entities/tag.dart';

class TagFormDialog extends StatefulWidget {
  final Tag? tag;
  final ValueChanged<Tag> onSave;

  const TagFormDialog({super.key, this.tag, required this.onSave});

  @override
  State<TagFormDialog> createState() => _TagFormDialogState();
}

class _TagFormDialogState extends State<TagFormDialog> {
  late TextEditingController _nameController;
  late TextEditingController _iconController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.tag?.name ?? '');
    _iconController = TextEditingController(text: widget.tag?.icon ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.tag != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Tag' : 'New Tag'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Tag Name',
                hintText: 'e.g., Fiction, Sci-Fi',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a tag name';
                }
                return null;
              },
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _iconController,
              decoration: const InputDecoration(
                labelText: 'Icon (Emoji)',
                hintText: 'e.g., 📚, 🚀',
                border: OutlineInputBorder(),
              ),
              maxLength: 2, // Limit to 1-2 chars usually for emoji
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _submit,
          child: Text(isEditing ? 'Save' : 'Create'),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newTag =
          widget.tag?.copyWith(
            name: _nameController.text.trim(),
            icon: _iconController.text.trim().isEmpty
                ? null
                : _iconController.text.trim(),
          ) ??
          Tag.empty().copyWith(
            name: _nameController.text.trim(),
            icon: _iconController.text.trim().isEmpty
                ? null
                : _iconController.text.trim(),
          );

      widget.onSave(newTag);
      Navigator.of(context).pop();
    }
  }
}
