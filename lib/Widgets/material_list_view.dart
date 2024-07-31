import 'package:flutter/material.dart';
import 'package:graduation_project/features/articles/models/material_listview.dart';

import 'materials_list_item.dart';

class MaterialsListView extends StatelessWidget {
  const MaterialsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: material.length,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemBuilder: (context, index) => MaterialsListItem(
          material: material[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 14.0),
      ),
    );
  }
}
