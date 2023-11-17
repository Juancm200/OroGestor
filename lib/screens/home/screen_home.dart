import 'package:flutter/material.dart';
import 'package:modernlogintute/screens/category/screen_category.dart';
import 'package:modernlogintute/screens/category/widget/add_category_popup.dart';
import 'package:modernlogintute/screens/home/widget/bottom_navigationbar.dart';
import 'package:modernlogintute/screens/transaction/screen_transaction.dart';
import 'package:modernlogintute/screens/transaction/widget/add_transaction.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    ScreenTransaction(),
    ScreenCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Money Manager',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, int updatedIndex, _) {
          return _pages[updatedIndex];
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            //print("add transaction");
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
          } else {
            // print("add category");
            ShowCategoryAddPopup(context);

            // final _sample = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'Travel',
            //   type: CategoryType.expense
            //   );
            // CategoryDb().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
