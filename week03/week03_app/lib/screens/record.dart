import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:week03_app/models/memo.dart';
import 'package:week03_app/services/db.dart';

import 'baseappbar.dart';
import 'basenavibar.dart';

class Record extends StatefulWidget {
  final List<bool> isSelected;

  Record({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(''),
        appBar: AppBar(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: TextField(
                      controller: titleController,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        counterText: "",
                        labelText: '제목',
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: TextField(
                      controller: contentController,
                      decoration: const InputDecoration(
                        labelText: '내용',
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        saveDB();
                        titleController.clear();
                        contentController.clear();
                        FocusScope.of(context).unfocus();
                      });
                    },
                    child: const Text('완료'),
                  ),
                ],
              ),
            ),
            BaseNaviBar(isSelected: widget.isSelected),
          ],
        ),
      ),
    );
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
      id: Str2Sha512(DateTime.now().toString()),
      title: titleController.text,
      text: contentController.text,
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
  }

  String Str2Sha512(String text) {
    var bytes = utf8.encode(text);
    var digest = sha512.convert(bytes);

    return digest.toString();
  }
}
