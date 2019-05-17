import '../redes.dart';

class GatoController extends ResourceController {
  final ManagedContext context;

  GatoController(this.context);

  //mudar retorno
  @Operation.get()
  Future<Response> getAll() async {
    try {
      final gatoQuery = Query<Gato>(context);
      final gatos = await gatoQuery.fetch();
      return Response.ok(gatos);
    } catch (e) {
      return Response.badRequest(body: {"400 Response": e.toString()});
    }
  }

  @Operation.post()
  Future<Response> createHero() async {
    final Map<String, dynamic> body = await request.body.decode();
    final query = Query<Gato>(context)
      ..values.name = body['name'] as String
      ..values.genero = body['genero'] as String
      ..values.idade = body['idade'] as String
      ..values.image = body['image'] as String
      ..values.isAdotado = body['isAdotado'] as bool
      ..values.nomeDono = body['nomeDono'] as String
      ..values.telefoneDono = body['telefoneDono'] as String;

    final insertedHero = await query.insert();

    return Response.ok(insertedHero);
  }

  //mudar retorno
  @Operation.get("id")
  Future<Response> getGatoByIDB(@Bind.path("id") int id) async {
    final gatoQuery = Query<Gato>(context)..where((g) => g.id).equalTo(id);
    final gato = await gatoQuery.fetchOne();
    if (gato == null) {
      return Response.notFound();
    }
    return Response.ok(gato);
  }
}
