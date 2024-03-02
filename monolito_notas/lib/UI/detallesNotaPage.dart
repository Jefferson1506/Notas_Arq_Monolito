import 'package:flutter/material.dart';

class DetalleNotaPage extends StatelessWidget {
  final String title;
  final String descrip;
  final String body;
  final String fecha;

  DetalleNotaPage({
    required this.title,
    required this.descrip,
    required this.body,
    required this.fecha,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 231, 170),
      appBar: AppBar(
        title: Text('Detalles de la Nota'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: const Color.fromARGB(255, 109, 240, 105),
          onPressed: () => Navigator.pop(context)),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Título: $title',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Descripción: $descrip',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 10.0),
            Divider(), // Línea divisoria
            SizedBox(height: 10.0),
            Text(
              'Fecha: $fecha',
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
                body,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
