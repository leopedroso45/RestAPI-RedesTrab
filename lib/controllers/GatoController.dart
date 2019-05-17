import '../redes.dart';

class GatoController extends ResourceController {
  final ManagedContext context;

  GatoController(this.context);

  @Operation.delete("id")
  Future<Response> deleteCat(@Bind.path("id") int id) async{
    final gatoQuery = Query<Gato>(context)
    ..where((g) => g.id).equalTo(id);
    int gatosApagados = await gatoQuery.delete();
    if(gatosApagados <= 0){
      return Response.badRequest(body: {"400 Response": "Bad Request"});
    } else {
      Response.ok(gatosApagados);
    }
  }

  @Operation.put("id")
    Future<Response> updateIsAdotado(@Bind.path("id") int id) async{
    try{
    final gatoQuery = Query<Gato>(context)
    ..values.isAdotado = true
    ..where((g) => g.id).equalTo(id);
    var updatedGato = await query.updateOne();
    return Response.ok(updatedGato);
    }catch(e){
      return Response.badRequest(body: {"400 Response": e.toString()});
    }
  }

  @Operation.get()
  Future<Response> getCats({@Bind.query('nomeDono')String nomeDono, @Bind.query('name')String name,@Bind.query('telefoneDono')String telefoneDono}) async {
    try{
    final gatoQuery = Query<Gato>(context);
    if (nomeDono != null) {
      gatoQuery.where((g) => g.nomeDono).contains(nomeDono, caseSensitive: false);
    } else if (name != null){
      gatoQuery.where((g) => g.name).contains(name, caseSensitive: false);
    } else if (telefoneDono != null){
      gatoQuery.where((g) => g.telefoneDono).contains(telefoneDono, caseSensitive: false);
    }
    final gatos = await gatoQuery.fetch();
    return Response.ok(gatos);
    }catch (e){
      return Response.badRequest(body: {"400 Response": e.toString()});
    }
  }

  @Operation.get("id")
  Future<Response> getGatoByIDB(@Bind.path("id") int id) async {
    final gatoQuery = Query<Gato>(context)..where((g) => g.id).equalTo(id);
    final gato = await gatoQuery.fetchOne();
    if (gato == null) {
      return Response.notFound();
    }
    return Response.ok(gato);
  }

  @Operation.post()
  Future<Response> createGato() async {
    final Map<String, dynamic> body = await request.body.decode();
    final query = Query<Gato>(context)
      ..values.name = body['name'] as String
      ..values.genero = body['genero'] as String
      ..values.idade = body['idade'] as String
      ..values.image = body['image'] as String
      ..values.isAdotado = body['isAdotado'] as bool
      ..values.nomeDono = body['nomeDono'] as String
      ..values.telefoneDono = body['telefoneDono'] as String;

    final insertedCat = await query.insert();

    return Response.ok(insertedCat);
  }

}
