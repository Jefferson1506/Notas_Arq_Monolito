import "package:cloud_firestore/cloud_firestore.dart";
import "package:intl/intl.dart";
import "package:monolito_notas/Data/model.dart";

DateTime fechaActual = DateTime.now();
String soloFecha = DateFormat('yyyy-MM-dd').format(fechaActual);
String soloHora = DateFormat('HH:mm:ss').format(fechaActual);

FirebaseFirestore db = FirebaseFirestore.instance;

Future<bool> addNote({
  required String title,
  required String descrip,
  required String context,
}) async {
  try {
    await db.collection("Notes").add({
      "id": title + "" + soloFecha + " " + soloHora,
      "title": title,
      "descrip": descrip,
      "context": context,
      "fecha": soloFecha + " " + soloHora
    });

    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<List<Notes>> getNotes() async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection("Notes").get();

    List<Notes> notesList = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      return Notes(
          id: doc.id,
          title: data['title'],
          descrip: data['descrip'],
          context: data['context'],
          fecha: data['fecha']);
    }).toList();

    return notesList;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<bool> deleteNote(String noteId) async {
  try {
    await db.collection("Notes").doc(noteId).delete();
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> updateNote({
  required String noteId,
  required String title,
  required String descrip,
  required String context,
}) async {
  try {
    await db.collection("Notes").doc(noteId).update({
      "id": title + "" + soloFecha + " " + soloHora,
      "title": title,
      "descrip": descrip,
      "context": context,
      "fecha": soloFecha + " " + soloHora
    });
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
