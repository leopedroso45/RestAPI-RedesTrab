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
      {
        'id': 3,
        'name': 'Charlie',
        'gender': 'male',
        'age': '4 months',
        'isAdotado': false,
        'nomeDono': 'Joao',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 4,
        'name': 'Milo',
        'gender': 'male',
        'age': '1 year',
        'isAdotado': false,
        'nomeDono': 'Maria',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 5,
        'name': 'Lola',
        'gender': 'female',
        'age': '6 months',
        'isAdotado': false,
        'nomeDono': 'Maria',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 6,
        'name': 'Jack',
        'gender': 'male',
        'age': '6 months',
        'isAdotado': false,
        'nomeDono': 'Maria',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 7,
        'name': 'Zoe',
        'gender': 'female',
        'age': '4 months',
        'isAdotado': false,
        'nomeDono': 'Pedro',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 8,
        'name': 'Simon',
        'gender': 'male',
        'age': '2 years',
        'isAdotado': false,
        'nomeDono': 'Pedro',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 9,
        'name': 'Loki',
        'gender': 'male',
        'age': '7 months',
        'isAdotado': false,
        'nomeDono': 'Pedro',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 10,
        'name': 'Simba',
        'gender': 'male',
        'age': '3 years',
        'isAdotado': false,
        'nomeDono': 'Josué',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 11,
        'name': 'Luna',
        'gender': 'female',
        'age': '3 months',
        'isAdotado': false,
        'nomeDono': 'Josué',
        'telefoneDono': '(51)1111'
      },
      {
        'id': 12,
        'name': 'Chloe',
        'gender': 'female',
        'age': '5 months',
        'isAdotado': false,
        'nomeDono': 'Josué',
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
