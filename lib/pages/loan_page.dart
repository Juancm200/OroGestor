import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/pages/home_page.dart';

// Class person that initialize the data fields
class Persons {
  int ID, Barras, Ley, GBrutos, Finos;
  Persons(this.ID, this.Barras, this.GBrutos, this.Ley, this.Finos);
}

class InsertDataTable extends StatefulWidget {
  @override
  _InsertDataTableState createState() => new _InsertDataTableState();
}

class _InsertDataTableState extends State<InsertDataTable> {
  List<Persons> PersonsLst = <Persons>[];

  final formKey = new GlobalKey<FormState>();
  var ID_Controller = new TextEditingController();
  var Barras_Controller = new TextEditingController();
  var GBrutos_Controller = new TextEditingController();
  var Ley_Controller = new TextEditingController();
  var Finos_Controller = new TextEditingController();
  String respuesta = "";
  int gfinos = 0;
  var lastID = 2;

  @override
// Method that call only once to initiate the default app.
  void initState() {
    super.initState();
    lastID++;
    ID_Controller.text = lastID.toString();
  }

// Method that is used to refresh the UI and show the new inserted data.
  refreshList() {
    setState(() {
      ID_Controller.text = lastID.toString();
    });
  }

  void calcular() {
    setState(() {
      int ley = int.parse(Ley_Controller.text);
      int gbrutos = int.parse(GBrutos_Controller.text);
      gfinos = ley * gbrutos;
      respuesta = gfinos.toString();
    });
  }

// Method used to validate the user data
  validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      calcular();
      String ID = ID_Controller.text;
      String B = Barras_Controller.text;
      String GB = GBrutos_Controller.text;
      String L = Ley_Controller.text;
      String F = Finos_Controller.text;
      Persons p = Persons(int.parse(ID), int.parse(B), int.parse(GB),
          int.parse(L), int.parse(respuesta));
      PersonsLst.add(p);
      lastID++;
      refreshList();
      Barras_Controller.text = "";
      GBrutos_Controller.text = "";
      Ley_Controller.text = "";
    }
  }

// Method to check the value of age, age is int or not
  bool NotIntCheck(var N) {
    final V = int.tryParse(N);

    if (V == null) {
      print("Not Int");
      return true;
    } else {
      print("Int");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp with home as scaffold
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[100],
          title: Text("Registro Diario"),
          leading: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomePage()),
            ),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Person ID:"),
                    TextField(
                      controller: ID_Controller,
                      enabled: false,
                    ),
                    Text("Barras:"),
                    TextFormField(
                      controller: Barras_Controller,
                      keyboardType: TextInputType.number,
                      validator: (val) =>
                          NotIntCheck(val) ? 'Number Required' : null,
                    ),
                    Text("Gramos Brutos:"),
                    TextFormField(
                      controller: GBrutos_Controller,
                      keyboardType: TextInputType.number,
                      validator: (val) =>
                          NotIntCheck(val) ? 'Number Required' : null,
                    ),
                    Text("Ley:"),
                    TextFormField(
                      controller: Ley_Controller,
                      keyboardType: TextInputType.number,
                      validator: (val) =>
                          NotIntCheck(val) ? 'Number Required' : null,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          'Insertar Registro',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: validate,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text("ID"),
                  ),
                  DataColumn(
                    label: Text("Barras"),
                  ),
                  DataColumn(
                    label: Text("Gramos Brutos"),
                  ),
                  DataColumn(
                    label: Text("Ley"),
                  ),
                  DataColumn(
                    label: Text("Gramos Finos"),
                  ),
                ],
                rows: PersonsLst.map(
                  (p) => DataRow(cells: [
                    DataCell(
                      Text(p.ID.toString()),
                    ),
                    DataCell(
                      Text(p.Barras.toString()),
                    ),
                    DataCell(
                      Text(p.GBrutos.toString()),
                    ),
                    DataCell(
                      Text(p.Ley.toString()),
                    ),
                    DataCell(
                      Text(p.Finos.toString()),
                    ),
                  ]),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
