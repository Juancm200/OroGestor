import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/loan_page.dart';
import 'package:modernlogintute/pages/login_page.dart';

import 'clients_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUsetOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUsetOut,
            icon: Icon(Icons.logout),
          )
        ],
        backgroundColor: Colors.deepPurple[200],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[120],
          child: ListView(children: [
            const DrawerHeader(
                child: Center(
              child: Text(
                'L O G O',
                style: TextStyle(fontSize: 10),
              ),
            )),
            ListTile(
              leading: const Icon(
                Icons.my_library_books_rounded,
              ),
              title: const Text(
                'Registro Diario',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => InsertDataTable()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.assignment_ind_rounded,
              ),
              title: const Text(
                'Clientes',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ClientPage()),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.handshake_outlined,
              ),
              title: const Text(
                'Prestamos',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ClientPage()),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
