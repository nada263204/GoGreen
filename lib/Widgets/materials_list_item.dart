// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:graduation_project/features/articles/view/screens/articles_screen.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:graduation_project/features/articles/models/material_listview.dart';

import 'text_scale.dart';

class MaterialsListItem extends StatelessWidget {
  final MaterialsModel material;
  const MaterialsListItem({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped on material with ID: ${material.id}');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticlesScreen(category: material.id),
          ),
        );
      },
      child: Container(
        width: 140.0,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        height: MediaQuery.sizeOf(context).height * 0.2, //161.0
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: [
            Text(
              material.name,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 24.0),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10.0),
            Image.asset(
              material.image,
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
