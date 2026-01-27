// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class CategoriesModelAdapter extends TypeAdapter<CategoriesModel> {
  @override
  final typeId = 0;

  @override
  CategoriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoriesModel(
      categoryId: fields[0] as String,
      categoryName: fields[1] as String,
      categoryIcon: fields[2] as String,
      subCategories: (fields[5] as List?)?.cast<CategoriesModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoriesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.categoryName)
      ..writeByte(2)
      ..write(obj.categoryIcon)
      ..writeByte(5)
      ..write(obj.subCategories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
