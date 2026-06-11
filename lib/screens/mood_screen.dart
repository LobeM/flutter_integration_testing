import 'package:flutter/material.dart';

class MoodScreen extends StatefulWidget {
  MoodScreen({Key? key}) : super(key: key);

  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  List<CheckboxState> checkboxState = [
    CheckboxState("Amazing", false),
    CheckboxState("A code line a day, keeps the doctor away", false),
    CheckboxState("Flutter makes the day great", false),
    CheckboxState("Happiness", false),
    CheckboxState("Maybe tomorrow is a better day", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Relax.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('How is your mood?')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Material(
            color: Color(0xDDFFFFFF),
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: ListView.builder(
              itemCount: checkboxState.length,
              itemBuilder: (context, index) => CheckboxListTile(
                value: checkboxState[index].value,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxState[index] = CheckboxState(
                      checkboxState[index].title,
                      value ?? false,
                    );
                  });
                },
                title: Text(checkboxState[index].title),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckboxState {
  final String title;
  final bool value;

  CheckboxState(this.title, this.value);
}
