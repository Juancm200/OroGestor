import 'package:flutter/material.dart';
import 'package:modernlogintute/Screens/HomeScreen.dart';

final TextEditingController titleC = TextEditingController();
final TextEditingController contentC = TextEditingController();
late String title;
late String content;
late String time;
late int Index;
int chosenIndex = 0;

class createNote extends StatefulWidget {
  createNote({
    Key? key,
  }) : super(key: key);

  @override
  State<createNote> createState() => _CreatNoteState();
}

class _CreatNoteState extends State<createNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[chosenIndex],
      body: SafeArea(
          child: ListView(children: [
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
              maxLines: 2,
              cursorColor: Colors.white,
              autofocus: true,
              textInputAction: TextInputAction.next,
              controller: titleC,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 60 : 36,
                  fontWeight: FontWeight.w500),
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: "Title")),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextFormField(
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              controller: contentC,
              maxLines: isTablet ? 20 : 15,
              showCursor: true,
              style:
                  TextStyle(color: Colors.white, fontSize: isTablet ? 40 : 24),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  constraints: BoxConstraints.expand(
                      height: isTablet ? 800 : 460, width: 200),
                  hintText: "Write Your Note Here")),
        ),
        FittedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 100 : 20.0),
            child: Container(
              height: 60,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, Index) => GestureDetector(
                    onTap: () {
                      chosenIndex = Index;
                      setState(() {});
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: colors[Index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: TextButton(
            onPressed: () async {
              time = DateTime.now().toString();
              title = titleC.text;
              content = contentC.text;
              titleC.text != "" || contentC.text != ""
                  ? {
                      await insertToDatabase(
                          title: title,
                          time: time,
                          content: content,
                          index: chosenIndex),
                      titleC.text = "",
                      contentC.text = "",
                      Navigator.pop(context)
                    }
                  : Navigator.pop(context);
            },Fluttertoast.showToast(
    msg: "Cliente Creado Exitosamente",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    textColor: Colors.white,
    fontSize: 16.0);
            child: Text(
              "Done",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        )
      ])),
    );
  }
}
