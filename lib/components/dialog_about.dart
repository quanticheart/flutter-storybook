import 'package:flutter/material.dart';

class DialogAbout extends StatelessWidget {
  const DialogAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.help),
      onPressed: () => showAboutDialog(
        context: context,
        applicationName: 'Storybook',
        applicationVersion: '0.0.1',
        applicationIcon: const Icon(Icons.book),
        applicationLegalese: 'Open',
      ),
    );
  }
}
