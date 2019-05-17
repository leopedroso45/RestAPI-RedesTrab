import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Gato", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("name", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("genero", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("idade", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("image", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("isAdotado", ManagedPropertyType.boolean,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("nomeDono", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("telefoneDono", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    final _gatos = [
      {
        'id': 1,
        'name': 'Sophie',
        'gender': 'female',
        'age': '6 months',
        'isAdotado': false,
        'nomeDono': 'Joao',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 2,
        'name': 'Leo',
        'gender': 'male',
        'age': '3 months',
        'isAdotado': false,
        'nomeDono': 'Joao',
        'telefoneDono': '(51)1111'
      },
    ];

    for (final gato in _gatos) {
      await database.store
          .execute("INSERT INTO _Gato (name, genero, idade, image, isAdotado, nomeDono, telefoneDono) VALUES (@name, @genero, @idade, @image, @isAdotado, @nomeDono, @telefoneDono)", substitutionValues: {
        'name': gato['name'],
        'genero': gato['gender'],
        'idade': gato['age'],
        'image': 'semiamge',
        'isAdotado': gato['isAdotado'],
        'nomeDono': gato['nomeDono'],
        'telefoneDono': gato['telefoneDono']
      });
    }
  }
}
