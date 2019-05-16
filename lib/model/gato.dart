import 'package:aqueduct/aqueduct.dart';

class Gato extends ManagedObject<_Gato> implements _Gato {}

class _Gato {
  @primaryKey
  int id;

  @Column(unique: false)
  String name;

  @Column(unique: false)
  String genero;

  @Column(unique: false)
  String idade;

  @Column(unique: false)
  String image;

  @Column(unique: false)
  bool isAdotado;

  @Column(unique: false)
  String nomeDono;

  @Column(unique: false)
  String telefoneDono;


}
