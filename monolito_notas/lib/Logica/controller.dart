
import 'package:get/get.dart';
import 'package:monolito_notas/Data/firebase.dart';
import 'package:monolito_notas/Data/model.dart';



class HomeController extends GetxController {
  final RxList<Notes> notesList = <Notes>[].obs;

  @override
  void onInit() {
    fetchNotes(); 
    super.onInit();  }

  void fetchNotes() async {
    final List<Notes> notes = await getNotes();
    notesList.assignAll(notes);
  }

  
}
