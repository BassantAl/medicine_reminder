import 'package:flutter/material.dart';

@immutable
class MedicineStatusColors extends ThemeExtension<MedicineStatusColors> {
  final Color taken;
  final Color pending;
  final Color missed;
  final Color skipped;

  const MedicineStatusColors({
    required this.taken,
    required this.pending,
    required this.missed,
    required this.skipped,
  });

  @override
  MedicineStatusColors copyWith({
    Color? taken,
    Color? pending,
    Color? missed,
    Color? skipped,
  }) {
    return MedicineStatusColors(
      taken: taken ?? this.taken,
      pending: pending ?? this.pending,
      missed: missed ?? this.missed,
      skipped: skipped ?? this.skipped,
    );
  }

  @override
  MedicineStatusColors lerp(covariant MedicineStatusColors? other, double t) {
    if (other == null) return this;

    return MedicineStatusColors(
      taken: Color.lerp(taken, other.taken, t)!,
      pending: Color.lerp(pending, other.pending, t)!,
      missed: Color.lerp(missed, other.missed, t)!,
      skipped: Color.lerp(skipped, other.skipped, t)!,
    );
  }
}
