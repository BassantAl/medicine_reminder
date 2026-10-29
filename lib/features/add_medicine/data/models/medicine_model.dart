class MedicineModel {
  final int? id;
  final String name;
  final String? foodInstruction;
  MedicineModel({
    this.id,
    required this.name,
    this.foodInstruction,
  });
  Map<String, Object?> toMap() {
    return {
      'name': name,
      'foodInstruction': foodInstruction,
    };
  }
}
