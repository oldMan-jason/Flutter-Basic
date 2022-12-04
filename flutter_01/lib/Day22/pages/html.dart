import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlPage extends StatefulWidget {
  final String aid;
  const HtmlPage({super.key, required this.aid});
  @override
  State<HtmlPage> createState() => _HtmlPageState();
}

/**
 * https://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=20
 */
// 解析HTML
class _HtmlPageState extends State<HtmlPage> {
  late String content;
  _getDetail() async {
    var url =
        "https://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${widget.aid}";
    var result = await Dio().get(url).then((value) {
      // print("valu -- ${value.data}");
      var map = json.decode(value.data);
      var content = map["result"][0]["content"];
      return content;
    });

    setState(() {
      content = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDetail();
  }

/**
 *  flutter_html插件使用
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTML解析"),
      ),
      body: content.isEmpty
          ? CircularProgressIndicator()
          : Html(
              data: content,
              tagsList: Html.tags..addAll(["bird", "flutter"]),
              style: {
                "table": Style(
                  backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "tr": Style(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                "th": Style(
                  padding: EdgeInsets.all(6),
                  backgroundColor: Colors.grey,
                ),
                "td": Style(
                  padding: EdgeInsets.all(6),
                  alignment: Alignment.topLeft,
                ),
                'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
              },
              customRender: {
                "table": (context, child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:
                        (context.tree as TableLayoutElement).toWidget(context),
                  );
                },
                "bird": (RenderContext context, Widget child) {
                  return TextSpan(text: "🐦");
                },
                "flutter": (RenderContext context, Widget child) {
                  return FlutterLogo(
                    style:
                        (context.tree.element!.attributes['horizontal'] != null)
                            ? FlutterLogoStyle.horizontal
                            : FlutterLogoStyle.markOnly,
                    textColor: context.style.color!,
                    size: context.style.fontSize!.size! * 5,
                  );
                },
              },
            ),
    );
  }
}
