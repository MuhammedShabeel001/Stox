// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StockModelAdapter extends TypeAdapter<StockModel> {
  @override
  final int typeId = 0;

  @override
  StockModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StockModel(
      symbol: fields[0] as String,
      name: fields[1] as String,
      type: fields[2] as String,
      region: fields[3] as String,
      marketOpen: fields[4] as String,
      marketClose: fields[5] as String,
      timezone: fields[6] as String,
      currency: fields[7] as String,
      matchScore: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StockModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.symbol)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.region)
      ..writeByte(4)
      ..write(obj.marketOpen)
      ..writeByte(5)
      ..write(obj.marketClose)
      ..writeByte(6)
      ..write(obj.timezone)
      ..writeByte(7)
      ..write(obj.currency)
      ..writeByte(8)
      ..write(obj.matchScore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
