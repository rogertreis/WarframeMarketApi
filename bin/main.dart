import 'package:my_project/my_project.dart';
import 'dart:io' show Platform;

Future main() async {
  var app = new Application<MyProjectSink>()
      ..configuration.configurationFilePath = "config.yaml"
      ..configuration.port = 8000;

  await app.start(numberOfInstances: Platform.numberOfProcessors);

  print("Application started on port: ${app.configuration.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}