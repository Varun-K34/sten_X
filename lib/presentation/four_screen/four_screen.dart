// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;
// import 'package:varun_s_application20/core/app_export.dart';
// import 'package:varun_s_application20/database/summary.dart';

// const SUMMARYTEXT = 'summary';

// class FourScreen extends StatefulWidget {
//   @override
//   State<FourScreen> createState() => _FourScreenState();
// }

// class _FourScreenState extends State<FourScreen> {
//   List<summarytext> summary = [];

//   @override
//   void initState() {
//     super.initState();
//     openAndFetchData();
//   }

//   Future<void> openAndFetchData() async {
//     final appDocumentDir =
//         await path_provider.getApplicationDocumentsDirectory();
//     await Hive.initFlutter(appDocumentDir.path);
//     Hive.registerAdapter(summarytextAdapter());

//     final box = await Hive.openBox<summarytext>(SUMMARYTEXT);
//     setState(() {
//       summary = box.values.toList();
//     });
//   }

//   Future<void> saveData(String name, String text) async {
//     final box = await Hive.openBox<summarytext>(SUMMARYTEXT);
//     final summaryData = summarytext(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: name,
//       text: text,
//     );
//     await box.add(summaryData);
//     setState(() {
//       summary = box.values.toList();
//     });
//   }

//   Future<List<summarytext>> getsummarydet() async {
//     final _summarydb = await Hive.openBox<summarytext>(SUMMARYTEXT);
//     return _summarydb.values.toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ColorConstant.blue100,
//         appBar: CustomAppBar(
//           context: context,
//           height: getVerticalSize(context, 76),
//           leadingWidth: 53,
//           leading: AppbarImage(
//             height: getSize(context, 30),
//             width: getSize(context, 30),
//             imagePath: ImageConstant.imgBrightness11,
//             margin: getMargin(context, left: 23, top: 13, bottom: 23),
//           ),
//           centerTitle: true,
//           title: AppbarTitle(text: "StenX"),
//           actions: [
//             Padding(
//               padding: getPadding(context, right: 16),
//               child: AppbarImage(
//                 height: getSize(context, 30),
//                 width: getSize(context, 30),
//                 imagePath: ImageConstant.imgExit11,
//                 onTap: () {
//                   onTapExitEleven1(context);
//                 },
//               ),
//             ),
//             Padding(
//               padding: getPadding(context, right: 24),
//               child: AppbarImage(
//                 height: getSize(context, 30),
//                 width: getSize(context, 30),
//                 imagePath: ImageConstant.imgBackbutton,
//                 onTap: () {
//                   onTapBackButton1(context);
//                 },
//               ),
//             ),
//           ],
//           styleType: Style.bgFillGray900,
//         ),
//         body: FutureBuilder<List<summarytext>>(
//           future: getsummarydet(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               summary = snapshot.data!;
//               return ListView.builder(
//                 itemCount: summary.length,
//                 itemBuilder: (context, index) {
//                   final summary1 = summary[index];
//                   return ListTile(
//                     title: Text(summary1.name),
//                     subtitle: Text(summary1.text),
//                   );
//                 },
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return SummaryInputDialog(
//                   onSave: saveData,
//                 );
//               },
//             );
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }

//   void onTapBackButton1(BuildContext context) {
//     Navigator.pushNamed(context, AppRoutes.twoScreen);
//   }

//   void onTapExitEleven1(BuildContext context) {
//     Navigator.pushNamed(context, AppRoutes.oneScreen);
//   }
// }

// class SummaryInputDialog extends StatefulWidget {
//   final Function(String name, String text) onSave;

//   const SummaryInputDialog({
//     required this.onSave,
//   });

//   @override
//   _SummaryInputDialogState createState() => _SummaryInputDialogState();
// }

// class _SummaryInputDialogState extends State<SummaryInputDialog> {
//   late TextEditingController _nameController;
//   late TextEditingController _textController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//     _textController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _textController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Add Summary'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: _nameController,
//             decoration: InputDecoration(
//               labelText: 'Name',
//             ),
//           ),
//           TextField(
//             controller: _textController,
//             decoration: InputDecoration(
//               labelText: 'Text',
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             String name = _nameController.text.trim();
//             String text = _textController.text.trim();
//             if (name.isNotEmpty && text.isNotEmpty) {
//               widget.onSave(name, text);
//               Navigator.pop(context);
//             }
//           },
//           child: Text('Save'),
//         ),
//       ],
//     );
//   }
// }

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
  bool isDarkMode = false;

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

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isDarkMode ? Colors.black : ColorConstant.blueA100;
    Color appBarIconColor = isDarkMode ? Colors.white : Colors.black;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color backgroundColor =
        isDarkMode ? Color(0xFF22292F) : ColorConstant.blue100;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          context: context,
          height: getVerticalSize(context, 76),
          leadingWidth: 53,
          leading: IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.brightness_6,
              color: appBarIconColor,
            ),
            onPressed: toggleTheme,
            iconSize: getSize(context, 30),
            padding: getPadding(context, left: 23, top: 13, bottom: 23),
          ),
          centerTitle: true,
          title: AppbarTitle(text: "History\t"),
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
                    title: Text(
                      summary1.name,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    subtitle: Text(
                      summary1.text,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
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
                  isDarkMode: isDarkMode,
                );
              },
            );
          },
          child: Icon(
            Icons.add,
            color: buttonColor,
          ),
          backgroundColor: isDarkMode ? Colors.white : Colors.transparent,
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
  final bool isDarkMode;

  const SummaryInputDialog({
    required this.onSave,
    required this.isDarkMode,
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
    Color textColor = widget.isDarkMode ? Colors.white : Colors.black;

    return AlertDialog(
      title: Text(
        'Add Summary',
        style: TextStyle(
          color: textColor,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            style: TextStyle(
              color: textColor,
            ),
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(
                color: textColor,
              ),
            ),
          ),
          TextField(
            controller: _textController,
            style: TextStyle(
              color: textColor,
            ),
            decoration: InputDecoration(
              labelText: 'Text',
              labelStyle: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: textColor,
            ),
          ),
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
          child: Text(
            'Save',
            style: TextStyle(
              color: textColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: widget.isDarkMode ? Colors.white : Colors.blue,
          ),
        ),
      ],
    );
  }
}
