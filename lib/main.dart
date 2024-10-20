import 'package:flutter/material.dart';
import 'compiler.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

void main() {
  runApp(ApexBurn());
}

class ApexBurn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApexBurn Compiler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CompilerHome(),
    );
  }
}

class CompilerHome extends StatefulWidget {
  @override
  _CompilerHomeState createState() => _CompilerHomeState();
}

class _CompilerHomeState extends State<CompilerHome> {
  String selectedLanguage = 'Python';
  String code = '';
  String output = '';

  void compileAndRun() async {
    String result = await compileCode(selectedLanguage, code);
    setState(() {
      output = result;
    });
  }

  void openFile() async {
    String? selectedFile = await FilePicker.platform.pickFiles().then((result) {
      if (result != null) {
        return result.files.single.path;
      }
      return null;
    });

    if (selectedFile != null) {
      String fileContent = await File(selectedFile).readAsString();
      setState(() {
        code = fileContent;
      });
    }
  }

  void saveFile() async {
    String? path = await FilePicker.platform.saveFile(
      dialogTitle: 'Save your code',
      fileName: 'code.txt',
    );

    if (path != null) {
      File(path).writeAsString(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ApexBurn Compiler'),
        actions: [
          TextButton(
            onPressed: openFile,
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: Text('Open File'),
          ),
          TextButton(
            onPressed: saveFile,
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: Text('Save File'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: <String>['Python', 'Java', 'C++', 'C', 'C#']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  code = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your code here...',
                ),
                maxLines: null, // Allow multiple lines
                keyboardType: TextInputType.multiline,
                expands: true,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: compileAndRun,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Button color
              foregroundColor: Colors.white, // Text color
            ),
            child: Text('Compile & Run'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Output:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            width: double.infinity,
            height: 200, // Fixed height for output
            child: SingleChildScrollView(
              child: Text(output),
            ),
          ),
        ],
      ),
    );
  }
}
