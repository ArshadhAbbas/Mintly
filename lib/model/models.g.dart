// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

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
      subCategories: (fields[3] as List?)?.cast<CategoriesModel>(),
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
      ..writeByte(3)
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

class CardModelAdapter extends TypeAdapter<CardModel> {
  @override
  final typeId = 1;

  @override
  CardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardModel(
      cardId: (fields[0] as num).toInt(),
      cardType: fields[1] as String?,
      balance: fields[3] as num,
      expiry: fields[4] as String,
      cardNumber: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cardId)
      ..writeByte(1)
      ..write(obj.cardType)
      ..writeByte(2)
      ..write(obj.cardNumber)
      ..writeByte(3)
      ..write(obj.balance)
      ..writeByte(4)
      ..write(obj.expiry);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BankAccountsModelAdapter extends TypeAdapter<BankAccountsModel> {
  @override
  final typeId = 2;

  @override
  BankAccountsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankAccountsModel(
      id: (fields[0] as num).toInt(),
      accountNumber: fields[1] as String,
      ifscCode: fields[2] as String,
      accountBalance: fields[3] as num,
      bankName: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BankAccountsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.accountNumber)
      ..writeByte(2)
      ..write(obj.ifscCode)
      ..writeByte(3)
      ..write(obj.accountBalance)
      ..writeByte(4)
      ..write(obj.bankName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankAccountsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
