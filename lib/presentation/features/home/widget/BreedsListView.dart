import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/BreedItem.dart';

Widget BreedsListView(BuildContext context, List<BreedItem> data) {
  return ListView.builder(
    itemCount: data.length,
    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
    itemBuilder: (context, index) {
      final item = data[index];
      return ListTile(
        contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        tileColor: (index % 2 == 0) ? Colors.white : Colors.grey[50],
        title: Text(item.breed),
        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 12),
        leading: Icon(Icons.pets_rounded, size: 24),
        subtitle:
            item.subBreed.isEmpty
                ? null
                : Text(
                  item.subBreeds,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
        onTap: () => {context.go('/home/breedImages/${item.breed}')},
      );
    },
  );
}
