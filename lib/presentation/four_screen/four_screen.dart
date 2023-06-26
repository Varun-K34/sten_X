import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:varun_s_application20/core/app_export.dart';
import 'package:varun_s_application20/database/summary.dart';

const SUMMARYTEXT = 'summary';

class FourScreen extends StatefulWidget {
  @override
  State<FourScreen> createState() => _FourScreenState();
}

class _FourScreenState extends State<FourScreen> {
  List<summarytext> summary = [];

  @override
  void initState() {
    super.initState();
    openAndFetchData();
  }

  Future<void> openAndFetchData() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter(summarytextAdapter());

    final box = await Hive.openBox<summarytext>(SUMMARYTEXT);
    setState(() {
      summary = box.values.toList();
    });
  }

  Future<void> saveData(String name, String text) async {
    final box = await Hive.openBox<summarytext>(SUMMARYTEXT);
    final summaryData = summarytext(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      text: text,
    );
    await box.add(summaryData);
    setState(() {
      summary = box.values.toList();
    });
  }

  Future<List<summarytext>> getsummarydet() async {
    final _summarydb = await Hive.openBox<summarytext>(SUMMARYTEXT);
    return _summarydb.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.blue100,
        appBar: CustomAppBar(
          context: context,
          height: getVerticalSize(context, 76),
          leadingWidth: 53,
          leading: AppbarImage(
            height: getSize(context, 30),
            width: getSize(context, 30),
            imagePath: ImageConstant.imgBrightness11,
            margin: getMargin(context, left: 23, top: 13, bottom: 23),
          ),
          centerTitle: true,
          title: AppbarTitle(text: "Synco"),
          actions: [
            Padding(
              padding: getPadding(context, right: 16),
              child: AppbarImage(
                height: getSize(context, 30),
                width: getSize(context, 30),
                imagePath: ImageConstant.imgExit11,
                onTap: () {
                  onTapExitEleven1(context);
                },
              ),
            ),
            Padding(
              padding: getPadding(context, right: 24),
              child: AppbarImage(
                height: getSize(context, 30),
                width: getSize(context, 30),
                imagePath: ImageConstant.imgBackbutton,
                onTap: () {
                  onTapBackButton1(context);
                },
              ),
            ),
          ],
          styleType: Style.bgFillGray900,
        ),
        body: FutureBuilder<List<summarytext>>(
          future: getsummarydet(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              summary = snapshot.data!;
              return ListView.builder(
                itemCount: summary.length,
                itemBuilder: (context, index) {
                  final summary1 = summary[index];
                  return ListTile(
                    title: Text(summary1.name),
                    subtitle: Text(summary1.text),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SummaryInputDialog(
                  onSave: saveData,
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void onTapBackButton1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.twoScreen);
  }

  void onTapExitEleven1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.oneScreen);
  }
}

class SummaryInputDialog extends StatefulWidget {
  final Function(String name, String text) onSave;

  const SummaryInputDialog({
    required this.onSave,
  });

  @override
  _SummaryInputDialogState createState() => _SummaryInputDialogState();
}

class _SummaryInputDialogState extends State<SummaryInputDialog> {
  late TextEditingController _nameController;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Summary'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Text',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String name = _nameController.text.trim();
            String text = _textController.text.trim();
            if (name.isNotEmpty && text.isNotEmpty) {
              widget.onSave(name, text);
              Navigator.pop(context);
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
