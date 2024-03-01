import "package:cloud_firestore/cloud_firestore.dart";
import "package:monolito_notas/Data/model.dart";

FirebaseFirestore db = FirebaseFirestore.instance;

Future<bool> addNote({
  required String title,
  String? descrip,
  String? context,
}) async {
  try {
    await db.collection("Notes").add({
      "title": title,
      "descrip": descrip,
      "context": context,
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
        title: data['title'] ,
        descrip: data['descrip'] ,
        context: data['context'] ,
      );
    }).toList();

    return notesList;
  } catch (e) {
    print(e);
    return [];
  }
}

