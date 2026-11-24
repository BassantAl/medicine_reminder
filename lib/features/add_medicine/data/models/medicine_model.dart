class MedicineModel {
  final int? id;
  final String name;
  final String? foodInstruction;
  final String? notes;
  MedicineModel({
    this.id,
    required this.name,
    this.foodInstruction,
    this.notes,
  });
  Map<String, Object?> toMap() {
    return {'name': name, 'foodInstruction': foodInstruction, 'notes': notes};
  }

factory MedicineModel.fromMap({
  required Map<String, dynamic> data,
}) {
  return MedicineModel(
    id: data['medicineId'] as int?,
    name: data['name'],
    foodInstruction: data['foodInstruction'],
    notes: data['notes'],
  );
}
MedicineModel copyWith({
    int? id,
    String? name,
    String? foodInstruction,
    String? notes,
  }) {
    return MedicineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      foodInstruction: foodInstruction ?? this.foodInstruction,
      notes: notes ?? this.notes,
    );
  }

}
