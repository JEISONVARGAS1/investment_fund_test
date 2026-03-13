import 'package:flutter/material.dart';

class PokedexSearchBar extends StatelessWidget {
  final bool isFiltering;
  final VoidCallback? onTapSearch;
  final TextEditingController controller;

  
  const PokedexSearchBar({
    super.key,
    this.onTapSearch,
    required this.controller,
    required this.isFiltering,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: .circular(16),
                border: .all(color: Colors.grey.shade300),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Procurar Pókemon...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 22,
                  ),
                  border: InputBorder.none,
                  contentPadding: .symmetric(horizontal: 16, vertical: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTapSearch,
              borderRadius: .circular(24),
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: .circle,
                  border: Border.all(color: Colors.grey.shade400, width: 1.5),
                ),
                child: Icon(
                  isFiltering ? Icons.close : Icons.search,
                  color: Colors.grey.shade700,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
