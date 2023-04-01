import 'package:flutter/material.dart';
import 'package:storybook/components/appbar.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../main.dart';

final _plugins = initializePlugins(
  contentsSidePanel: true,
  knobsSidePanel: true,
  initialDeviceFrameData: DeviceFrameData(
    device: Devices.ios.iPhone13,
  ),
);

class StoryBookScreen extends StatelessWidget {
  const StoryBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Storybook(
        initialStory: 'Screens/Scaffold',
        plugins: _plugins,
        stories: [
          Story(
            name: 'Screens/Scaffold',
            description: 'Story with scaffold and different knobs.',
            builder: (context) => Scaffold(
              appBar: AppBarProject(
                title: Text(
                  context.knobs.text(
                    label: 'Title',
                    initial: 'Scaffold',
                    description: 'The title of the app bar.',
                  ),
                ),
                elevation: context.knobs.nullable.slider(
                  label: 'AppBar elevation',
                  initial: 4,
                  min: 0,
                  max: 10,
                  description: 'Elevation of the app bar.',
                ),
                backgroundColor: context.knobs.nullable.options(
                  label: 'AppBar color',
                  initial: Colors.blue,
                  description: 'Background color of the app bar.',
                  options: const [
                    Option(
                      label: 'Blue',
                      value: Colors.blue,
                      description: 'Blue color',
                    ),
                    Option(
                      label: 'Green',
                      value: Colors.green,
                      description: 'Green color',
                    ),
                  ],
                ),
              ),
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    context.knobs.sliderInt(
                      label: 'Items count',
                      initial: 2,
                      min: 1,
                      max: 5,
                      description: 'Number of items in the body container.',
                    ),
                    (_) => const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Hello World!'),
                    ),
                  ),
                ),
              ),
              floatingActionButton: context.knobs.boolean(
                label: 'FAB',
                initial: true,
                description: 'Show FAB button',
              )
                  ? FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    )
                  : null,
            ),
          ),
          Story(
            name: 'Screens/Counter',
            description: 'Demo Counter app with about dialog.',
            builder: (context) => MyHomePage(
              title: context.knobs.text(label: 'Title', initial: 'Counter'),
              enabled: context.knobs.boolean(label: 'Enabled', initial: true),
            ),
          ),
          Story(
            name: 'Widgets/Text',
            description: 'Simple text widget.',
            builder: (context) => const Center(child: Text('Simple text')),
          ),
          Story(
            name: 'Story/Nested/Multiple/Times/First',
            builder: (context) => const Center(child: Text('First')),
          ),
          Story(
            name: 'Story/Nested/Multiple/Times/Second',
            builder: (context) => const Center(child: Text('Second')),
          ),
          Story(
            name: 'Story/Nested/Multiple/Third',
            builder: (context) => const Center(child: Text('Third')),
          ),
          Story(
            name: 'Story/Nested/Multiple/Fourth',
            builder: (context) => const Center(child: Text('Fourth')),
          ),
          Story(
            name: 'Story without a category',
            builder: (context) => const Center(child: Text('Simple text')),
          ),
        ],
      );
}
