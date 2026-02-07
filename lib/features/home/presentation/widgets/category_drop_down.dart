import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_assets.dart';

class CategoryDropdown extends StatelessWidget {
  const CategoryDropdown({super.key, this.validator, this.onChanged});
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      hint: const Text('Select category'),
      items: AppSvgAssets.categroyNameList.map((category) {
        return DropdownMenuItem<String>(value: category, child: Text(category));
      }).toList(),
      validator: validator,
      onChanged: onChanged,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}
