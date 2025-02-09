// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************



class CartModelAdapter extends TypeAdapter<CartModel> {
  @override
  final int typeId = 0;

  @override
  CartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartModel(
      productName: fields[0] as String?,
      productID: fields[1] as String?,
      productGraphID: fields[2] as String?,
      productColor: fields[3] as String?,
      productSize: fields[4] as String?,
      varientID: fields[5] as String?,
      productImage: fields[6] as String?,
      productPrice: fields[7] as String?,
      quantity: fields[8] as String?,
      comparePrice: fields[9] as String?,
      sku: fields[10] as String?,
      available: fields[11] as bool?,
      userId: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CartModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.productID)
      ..writeByte(2)
      ..write(obj.productGraphID)
      ..writeByte(3)
      ..write(obj.productColor)
      ..writeByte(4)
      ..write(obj.productSize)
      ..writeByte(5)
      ..write(obj.varientID)
      ..writeByte(6)
      ..write(obj.productImage)
      ..writeByte(7)
      ..write(obj.productPrice)
      ..writeByte(8)
      ..write(obj.quantity)
      ..writeByte(9)
      ..write(obj.comparePrice)
      ..writeByte(10)
      ..write(obj.sku)
      ..writeByte(11)
      ..write(obj.available)
      ..writeByte(12)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
