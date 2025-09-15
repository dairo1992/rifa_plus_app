
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rifa_plus_app/shared/presentation/widgets/custom_text_form_field.dart';

class CustomDatePickerField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime) onDateSelected;

  const CustomDatePickerField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onDateSelected,
    this.hintText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2101),
    );
    if (picked != null) {
      widget.onDateSelected(picked);
      // Formateamos la fecha y actualizamos el controlador
      final formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      widget.controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        // AbsorbPointer previene que el teclado aparezca
        child: CustomTextFormField(
          controller: widget.controller,
          labelText: widget.labelText,
          hintText: widget.hintText,
          suffixIcon: const Icon(Icons.calendar_today),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor seleccione una fecha';
            }
            return null;
          },
        ),
      ),
    );
  }
}
