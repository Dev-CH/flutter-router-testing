import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:router_testing/widgets/navigation_bar.dart';

class PageTemplate extends StatelessWidget {
  final String name;

  PageTemplate({
    Key? key,
    required this.name
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('This is the $name page'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Modal',
        child: const Icon(Icons.arrow_circle_up),
      ),
      bottomNavigationBar: NavigationBar(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
