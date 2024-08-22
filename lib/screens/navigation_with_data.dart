import 'package:flutter/material.dart';

class NavigationWithData extends StatefulWidget {
  const NavigationWithData({super.key});

  @override
  State<NavigationWithData> createState() => _NavigationWithDataState();
}

class _NavigationWithDataState extends State<NavigationWithData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  void initState() {
    _dateController.text = "";
    super.initState();
  }

  void _selectedDate(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now());
    String formatedDate =
        '${pickedDate!.day}-${pickedDate.month}-${pickedDate.year}';
    setState(() {
      _dateController.text = formatedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text("Navigation Example with Data"),
        ),
        body: Center(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Please enter your name ',
                  label: Text('Name'),
                ),
              ),
              TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  label: Text('DOB'),
                ),
                readOnly: true,
                onTap: () {
                  _selectedDate(context);
                },
              ),
              TextButton(
                  onPressed: () {
                    var formData={
                      'name':_nameController.text,
                      'dob':_dateController.text
                    };
                    Navigator.pushNamed(context, '/newScreen', arguments: formData);
                  },
                  child: const Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  final String name;
  final String dob;
  const NewScreen({super.key, required this.name,required this.dob});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
      ),
          body: Center(
            child: Text("Your Birthdate is $dob"),
          ),
    ));
  }
}
