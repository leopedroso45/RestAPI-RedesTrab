import 'redes.dart';

class RedesChannel extends ApplicationChannel {

  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();

    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo("postgres", 
    "123", "localhost", 5432, "adoptpampa");

    context = ManagedContext(dataModel, persistentStore);

  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route("/gato[/:id]")
      .link(()=>GatoController(context));

    return router;
  }
}