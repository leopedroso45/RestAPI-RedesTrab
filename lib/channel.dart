import 'redes.dart';

class RedesChannel extends ApplicationChannel {

  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();

    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo("gatos_user", 
    "password", "localhost", 5432, "gatos");

    context = ManagedContext(dataModel, persistentStore);

  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
      .route("/gato/[:id]")
      .link(()=>GatoController(context));

    return router;
  }
}