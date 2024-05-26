import 'package:flutter/material.dart';
import 'package:scelloo_test/componenets/custom_divider.dart';
import 'package:scelloo_test/componenets/custom_scaffold.dart';
import 'package:scelloo_test/utils/constants/color_constants.dart';

import '../../../../utils/helpers/helpers.dart';

class PostDetailView extends StatelessWidget {
  final Map<String, dynamic> args;

  const PostDetailView({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Helpers.popPage(),
        ),
        backgroundColor: ColorConstants.primary,
        foregroundColor: ColorConstants.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: ColorConstants.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.newspaper_rounded,
                          size: 80, color: ColorConstants.primary),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      'ID: ${args['id']}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'User ID: ${args['userId']}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Title: ${args['title']}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Body: ${args['body']}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
