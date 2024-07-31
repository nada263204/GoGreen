// ignore_for_file: public_member_api_docs, sort_constructors_first
class MaterialsModel {
  final String name;
  final String image;
  final String id;
  MaterialsModel({
    required this.name,
    required this.image,
    required this.id,
  });
}

List<MaterialsModel> material = [
  MaterialsModel(name: 'Glass', image: 'assets/images/glass.png', id: 'glass'),
  MaterialsModel(
      name: 'Plastic', image: 'assets/images/plasticB.png', id: 'plastic'),
  MaterialsModel(name: 'Paper', image: 'assets/images/paper.png', id: 'paper'),
  MaterialsModel(name: 'Metal', image: 'assets/images/metals.png', id: 'metal'),
];
