import 'package:flashcards_flutter/presentation/features/favourites/model/filter_item.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  final List<FilterItem> items;
  final Function(List<FilterItem>) onFiltersSet;

  const FilterBottomSheet(this.items, this.onFiltersSet, {super.key});

  @override
  State<StatefulWidget> createState() => FilterBottomSheetViewState();
}

class FilterBottomSheetViewState extends State<FilterBottomSheet> {
  static List<FilterItem> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await _openBottomSheet(widget.items);
        widget.onFiltersSet(result ?? List.empty());
      },
      child: Text("Filter"),
    );
  }

  Future<List<FilterItem>?> _openBottomSheet(List<FilterItem> items) async {
    _selectedItems = items.where((item) => item.isSelected).toList();
    final result = await showModalBottomSheet<List<FilterItem>>(
      context: context,
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setState) => Container(
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: items.length,
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return CheckboxListTile(
                        value: _selectedItems.contains(item),
                        onChanged: (newValue) {
                          setState(() {
                            newValue == true
                                ? _selectedItems.add(item)
                                : _selectedItems.remove(item);
                          });
                        },
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 8,
                        ),
                        title: Text(item.name),
                      );
                    },
                  ),
                ),
          ),
    );
    return _selectedItems;
  }
}
