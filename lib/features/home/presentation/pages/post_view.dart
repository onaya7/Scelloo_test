import 'package:flutter/material.dart';
import 'package:scelloo_test/componenets/custom_scaffold.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Text('Post'),
      ),
      body: const Placeholder(),
    );
  }
}
