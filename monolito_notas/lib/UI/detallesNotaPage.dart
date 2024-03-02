import 'package:flutter/material.dart';
import 'package:monolito_notas/Data/model.dart';
import 'package:monolito_notas/UI/editarNotePage.dart';

class DetalleNotaPage extends StatelessWidget {
  final Notes nota;

  DetalleNotaPage({
    required this.nota,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 231, 170),
      appBar: AppBar(
        title: Text('Detalles de la Nota'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        backgroundColor: const Color.fromARGB(255, 109, 240, 105),
        onPressed: ()async {
       await   Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditarNotaPage(nota: nota),
            ),
          );
          Navigator.pop(context, true);
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Título: ${nota.title}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Descripción: ${nota.descrip}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 10.0),
            Divider(), // Línea divisoria
            SizedBox(height: 10.0),
            Text(
              'Fecha: ${nota.fecha}',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 10.0),
            Text(
              'Contexto:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                nota.body,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
