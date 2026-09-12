import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/app_button.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> _categories = [
    'Eggs',
    'Noodles & Pasta',
    'Chips & Crisps',
    'Fast Food',
  ];

  final List<String> _brands = [
    'Individual Collection',
    'Cocola',
    'Ifad',
    'Kazi Farmas',
  ];

  final Set<String> _selectedCategories = {'Eggs'};
  final Set<String> _selectedBrands = {'Cocola'};

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Color(0xFFF2F3F2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: AppColors.darkText, size: 24),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Filters',
                      style: TextStyle(
                        color: AppColors.darkText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48), // balance the close icon
              ],
            ),
          ),

          // Content Box with rounded white background
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categories Section
                    const Text(
                      'Categories',
                      style: TextStyle(
                        color: AppColors.darkText,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._categories.map((cat) {
                      final isSelected = _selectedCategories.contains(cat);
                      return _buildCheckboxRow(
                        label: cat,
                        isSelected: isSelected,
                        onChanged: () {
                          setState(() {
                            if (isSelected) {
                              _selectedCategories.remove(cat);
                            } else {
                              _selectedCategories.add(cat);
                            }
                          });
                        },
                      );
                    }),
                    const SizedBox(height: 32),

                    // Brand Section
                    const Text(
                      'Brand',
                      style: TextStyle(
                        color: AppColors.darkText,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._brands.map((brand) {
                      final isSelected = _selectedBrands.contains(brand);
                      return _buildCheckboxRow(
                        label: brand,
                        isSelected: isSelected,
                        onChanged: () {
                          setState(() {
                            if (isSelected) {
                              _selectedBrands.remove(brand);
                            } else {
                              _selectedBrands.add(brand);
                            }
                          });
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),

          // Apply Button
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: AppButton(
              text: 'Apply Filter',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxRow({
    required String label,
    required bool isSelected,
    required VoidCallback onChanged,
  }) {
    return InkWell(
      onTap: onChanged,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.borderColor,
                  width: 1.8,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.darkText,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
