import '../redes.dart';

class GatoController extends ResourceController {

  final _gatos = [
    {'id': 1, 'name': 'Sophie', 'gender': 'female', 'age': '6 months', 'isAdotado': false, 'nomeDono': 'Joao', 'telefoneDono': '(51)1111'},
    {'id': 2, 'name': 'Leo', 'gender': 'male', 'age': '3 months', 'isAdotado': false, 'nomeDono': 'Joao', 'telefoneDono': '(51)1111'},
    {'id': 3, 'name': 'Charlie', 'gender': 'male', 'age': '4 months', 'isAdotado': false, 'nomeDono': 'Joao', 'telefoneDono': '(51)1111'},
    {'id': 4, 'name': 'Milo', 'gender': 'male', 'age': '1 year', 'isAdotado': false, 'nomeDono': 'Maria', 'telefoneDono': '(51)1111'},
    {'id': 5, 'name': 'Lola', 'gender': 'female', 'age': '6 months', 'isAdotado': false, 'nomeDono': 'Maria', 'telefoneDono': '(51)1111'},
    {'id': 6, 'name': 'Jack', 'gender': 'male', 'age': '6 months', 'isAdotado': false, 'nomeDono': 'Maria', 'telefoneDono': '(51)1111'},
    {'id': 7, 'name': 'Zoe', 'gender': 'female', 'age': '4 months', 'isAdotado': false, 'nomeDono': 'Pedro', 'telefoneDono': '(51)1111'},
    {'id': 8, 'name': 'Simon', 'gender': 'male', 'age': '2 years', 'isAdotado': false, 'nomeDono': 'Pedro', 'telefoneDono': '(51)1111'},
    {'id': 9, 'name': 'Loki', 'gender': 'male', 'age': '7 months', 'isAdotado': false, 'nomeDono': 'Pedro', 'telefoneDono': '(51)1111'},
    {'id': 10, 'name': 'Simba', 'gender': 'male', 'age': '3 years', 'isAdotado': false, 'nomeDono': 'Josué', 'telefoneDono': '(51)1111'},
    {'id': 11, 'name': 'Luna', 'gender': 'female', 'age': '3 months', 'isAdotado': false, 'nomeDono': 'Josué', 'telefoneDono': '(51)1111'},
    {'id': 12, 'name': 'Chloe', 'gender': 'female', 'age': '5 months', 'isAdotado': false, 'nomeDono': 'Josué', 'telefoneDono': '(51)1111'},  
  ];

  // final ManagedContext context;

  // GatoController(this.context);

  //mudar retorno
  @Operation.get()
  Future<Response> getAll() async {
    try {
      // final gatoQuery = Query<Gato>(context);
      // final gatos = await gatoQuery.fetch();
      return Response.ok({"Gatos": _gatos});
    } catch (e) {
      return Response.badRequest(body: {"400 Response": e.toString()});
    }
  }

  @Operation.get('id')
  Future<Response> getGatoByID(@Bind.path('id') int id) async {
    final gato = _gatos.firstWhere((gato) => gato['id'] == id, orElse: () => null);
    if (gato == null) {
      return Response.notFound();
    }
    return Response.ok(gato);
  }

  // //mudar retorno
  // @Operation.get("id")
  // Future<Response> getGatoByIDB(@Bind.path("id") int id) async {
  //   final gatoQuery = Query<Gato>(context)
  //     ..where((g) => g.id).equalTo(id);
  //   final gato = await gatoQuery.fetchOne();
  //   if (gato == null) {
  //     return Response.notFound();
  //   }
  //   return Response.ok("gato");
  // }

}