import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CustomFilePickerField extends StatefulWidget {
  final String label;
  final Function(List<PlatformFile>) onFilesSelected;
  final bool allowMultiple;
  final FileType fileType;
  final List<String>? allowedExtensions;

  const CustomFilePickerField({
    super.key,
    required this.label,
    required this.onFilesSelected,
    this.allowMultiple = false,
    this.fileType = FileType.any,
    this.allowedExtensions,
  });

  @override
  State<CustomFilePickerField> createState() => _CustomFilePickerFieldState();
}

class _CustomFilePickerFieldState extends State<CustomFilePickerField> {
  List<PlatformFile> _selectedFiles = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: widget.allowMultiple,
      type: widget.fileType, // <-- CORREGIDO: de widget.type a widget.fileType
      allowedExtensions: widget.allowedExtensions,
    );

    if (result != null) {
      setState(() {
        _selectedFiles = result.files;
      });
      widget.onFilesSelected(_selectedFiles);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        InkWell(
          onTap: _pickFiles,
          child: DottedBorder(
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: _selectedFiles.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 40,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(height: 8),
                          const Text('Toca para seleccionar archivos'),
                        ],
                      )
                    : _buildFilesList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilesList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _selectedFiles.length,
      itemBuilder: (context, index) {
        final file = _selectedFiles[index];
        return Row(
          children: [
            const Icon(Icons.insert_drive_file_outlined, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(file.name, overflow: TextOverflow.ellipsis)),
          ],
        );
      },
    );
  }
}
