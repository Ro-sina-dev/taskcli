import 'dart:io';
import 'dart:convert';

//retourner une list disponible plutart
Future<List<dynamic>> lireTaches(String path) async {
  final file = File(path);
  final contenu = await file.readAsString();
  return contenu.isEmpty ? [] : jsonDecode(contenu);
}

//cette fonction ne retounre rien mais permet de convertir une list dart en json
Future<void> sauvegarderTaches(String path, List<dynamic> taches) async {
  final file = File(path);
  await file.writeAsString(jsonEncode(taches));
}

void main() async {
  const filePath = 'taches.json';
  List<dynamic> name = await lireTaches(filePath);

  print("Entrez une nouvelle tâche : ");
  String? nom = stdin.readLineSync();
  name.add({'tache': nom, 'complete': false});

  await sauvegarderTaches(filePath, name);
  print(" Tâche '$nom' enregistrée !");
}
