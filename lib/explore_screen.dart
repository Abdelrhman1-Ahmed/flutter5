import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/widgets/app_text_field.dart';
import 'models/category_model.dart';
import 'beverages_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = SampleCategories.categories.where((cat) {
      return cat.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Find Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Search Bar
            AppTextField(
              label: '',
              hint: 'Search Store',
              controller: _searchController,
              isSearchStyle: true,
              onChanged: (val) {
                setState(() => _searchQuery = val);
              },
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18, color: AppColors.secondaryText),
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _searchQuery = '');
                      },
                    )
                  : null,
            ),
            const SizedBox(height: 20),

            // Category Grid
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.88,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: filteredCategories.length,
                itemBuilder: (context, index) {
                  final cat = filteredCategories[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: cat.backgroundColor,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: cat.borderColor, width: 1.2),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(18),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CategoryProductsScreen(
                                title: cat.title.replaceAll('\n', ' '),
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  cat.imageUrl,
                                  height: 80,
                                  width: 85,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(
                                    cat.iconData,
                                    size: 48,
                                    color: cat.borderColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                cat.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: AppColors.darkText,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
