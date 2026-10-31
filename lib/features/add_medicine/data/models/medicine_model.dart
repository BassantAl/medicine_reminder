class MedicineModel {
  final int? id;
  final String name;
  final String? foodInstruction;
   final String? notes;
  MedicineModel({
    this.id,
    required this.name,
    this.foodInstruction, this.notes,
  });
  Map<String, Object?> toMap() {
    return {
      'name': name,
      'foodInstruction': foodInstruction,
      'notes': notes,
    };
  }
}
