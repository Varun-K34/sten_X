import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:varun_s_application20/core/app_export.dart';
import 'package:varun_s_application20/database/summary.dart';
import 'package:varun_s_application20/db_functions/summaryfc/summaryfunc.dart';

class ThreScreen extends StatefulWidget {
  @override
  _ThreScreenState createState() => _ThreScreenState();
}

class _ThreScreenState extends State<ThreScreen> {
  String inputText = '';
  String summaryText = '';
  bool isDarkMode = false;

  void onTapBackButton(BuildContext context) {
    Navigator.pop(context);
  }

  void onSummarizeButtonPressed() async {
    final summary = await summarizeText(inputText);

    setState(() {
      summaryText = summary;
    });
  }

  Future<String> summarizeText(String inputText) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/summarize'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': inputText}),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData['summary'];
    } else {
      throw Exception('Failed to summarize text');
    }
  }

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return CustomAppBar(
      context: context,
      height: getVerticalSize(context, 65),
      leadingWidth: 45,
      leading: IconButton(
        icon: Icon(isDarkMode ? Icons.brightness_7 : Icons.brightness_6),
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        iconSize: getSize(context, 30),
        padding: getPadding(context, left: 15, top: 18, bottom: 17),
      ),
      centerTitle: true,
      title: AppbarTitle(text: "Summarize"),
      actions: [
        AppbarImage(
          height: getSize(context, 30),
          width: getSize(context, 30),
          imagePath: ImageConstant.imgBackbutton,
          margin: getMargin(context, left: 22, top: 18, right: 22, bottom: 17),
          onTap: () {
            onTapBackButton(context);
          },
        ),
      ],
      styleType: Style.bgFillGray900,
    );
  }

  Widget buildTextDivider(BuildContext context) {
    return Padding(
      padding: getPadding(context, top: 2),
      child: Divider(
        height: getVerticalSize(context, 3),
        thickness: getVerticalSize(context, 3),
        color: isDarkMode ? Colors.grey[700] : Colors.black,
      ),
    );
  }

  Widget buildInputTextField(BuildContext context) {
    return Container(
      margin: getMargin(context, top: 14, right: 14, bottom: 11),
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xFF555555) : Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: getVerticalSize(context, 250),
          child: TextField(
            maxLines: null,
            onChanged: (text) {
              setState(() {
                inputText = text;
              });
            },
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter your text...',
              hintStyle: TextStyle(
                color: isDarkMode
                    ? Color(0xFFFFFFFF)
                    : Colors.black.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              ),
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSummaryTextField(BuildContext context) {
    return Container(
      margin: getMargin(context, top: 14, right: 14, bottom: 11),
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xFF555555) : ColorConstant.blueGray102,
        borderRadius: BorderRadius.circular(4),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: getVerticalSize(context, 250),
          child: TextField(
            maxLines: null,
            readOnly: true,
            controller: TextEditingController(text: summaryText),
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: 'Poppins',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Summary will appear here...',
              hintStyle: TextStyle(
                color:
                    isDarkMode ? Colors.white : Colors.black.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
              ),
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? Color(0xFF333333) : ColorConstant.blue100,
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          padding: getPadding(context, top: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                child: Container(
                  padding: getPadding(context, top: 9, bottom: 9),
                  decoration: AppDecoration.fillGray100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(context, left: 36, right: 69),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enter text",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: isDarkMode ? Colors.black : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Spacer(),
                            Text(
                              "SL",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Padding(
                              padding: getPadding(context,
                                  left: 11, top: 4, bottom: 10),
                              child: Text(
                                "L",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Container(
                              height: getSize(context, 14),
                              width: getSize(context, 14),
                              margin: getMargin(context,
                                  left: 5, top: 6, bottom: 9),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: getSize(context, 80),
                                      child: Divider(
                                        height: getSize(context, 4),
                                        thickness: getSize(context, 4),
                                        color: isDarkMode
                                            ? Colors.grey[700]
                                            : Color(0xFF707070),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: getSize(context, 14),
                                      width: getSize(context, 14),
                                      decoration: BoxDecoration(
                                        color: isDarkMode
                                            ? Color(0xFF4a4a4a)
                                            : ColorConstant.blueGray400,
                                        borderRadius: BorderRadius.circular(
                                            getSize(context, 7)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: getPadding(context,
                                  left: 7, top: 4, bottom: 10),
                              child: Text(
                                "H",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(context, top: 2),
                        child: Divider(
                          height: getSize(context, 3),
                          thickness: getSize(context, 3),
                          color: isDarkMode ? Colors.grey[700] : Colors.black,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: buildInputTextField(context),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                height: getSize(context, 51),
                width: getSize(context, 214),
                text: "Summarize",
                margin: getMargin(context, top: 12),
                variant: ButtonVariant.FillBlueA100,
                fontStyle: ButtonFontStyle.PoppinsBold20,
                context: context,
                onTap: onSummarizeButtonPressed,
                buttonColor: ColorConstant.blueA100,
              ),
              CustomButton(
                height: getSize(context, 51),
                width: getSize(context, 214),
                text: "Save",
                margin: getMargin(context, top: 12),
                variant: ButtonVariant.FillBlueA100,
                fontStyle: ButtonFontStyle.PoppinsBold20,
                context: context,
                buttonColor: ColorConstant.blueA100,
                onTap: () {
                  savesummary();
                  showSavedIndicator(context);
                },
              ),
              Container(
                width: double.maxFinite,
                child: Container(
                  padding: getPadding(context, top: 9, bottom: 9),
                  decoration: BoxDecoration(
                    color:
                        isDarkMode ? Color(0xFF333333) : ColorConstant.gray100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(context, left: 36, right: 69),
                        child: Text(
                          "Summary",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      buildTextDivider(context),
                      Align(
                        alignment: Alignment.centerRight,
                        child: buildSummaryTextField(context),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> savesummary() async {
    final summary = TextEditingController(text: summaryText).text;
    if (summary.isEmpty) {
      return;
    }
    final passsummary = summarytext(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      name: 'Summary [${DateTime.now().microsecondsSinceEpoch.toString()}]',
      text: summary,
    );
    summarytextadd(passsummary);
  }

  void showSavedIndicator(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Saved"),
          content: Text("Summary has been saved."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}






//Uri.parse('http://10.0.2.2:5000/summarize'),



// Uri.parse('http://192.168.1.7:5000/summarize'),
