import 'package:flutter/material.dart';
import 'CustomContainer.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("弹性布局组件学习"),
      ),
      // body: MyFlexible(),
      // body: FlexExpanded(),
      body: MySpacer(),
    ),
  ));
}

/**
 * Flexible 
 */

class MyFlexible extends StatelessWidget {
  const MyFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.blue,
          height: 50,
          width: 100,
        ),
        Flexible(
            fit: FlexFit.tight, //强制填满剩余空间
            child: Container(
              color: Colors.red,
              alignment: Alignment.center, //子控件居中
              height: 50,
              child: Text(
                'Container',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )),
        Container(
          color: Colors.blue,
          height: 50,
          width: 100,
        ),
      ],
    );
  }
}

/**
 *  弹性布局组件
 *  Expanded继承字Flexible，fit参数固定为FlexFit.tight，也就是说Expanded必须（强制）填满剩余空间
 *  flex 设置权重
 */
class FlexExpanded extends StatelessWidget {
  const FlexExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: CustomContainer(
              Icons.home,
              bgColor: Colors.orange,
            ),
            flex: 1, //设置的分隔比例，CustomContainer内部设置的宽高无效
          ),
          Expanded(
            child: CustomContainer(
              Icons.ad_units,
              bgColor: Colors.blue,
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}

/**
 * Spacer
 * Spacer用于撑开Row、Column、Flex的子控件的空隙
 */

class MySpacer extends StatelessWidget {
  const MySpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 50,
          color: Colors.green,
        ),
        Spacer(
          flex: 2,
        ),
        Container(
          width: 100,
          height: 50,
          color: Colors.blue,
        ),
        Spacer(),
        Container(
          width: 100,
          height: 50,
          color: Colors.red,
        ),
      ],
    );
  }
}
