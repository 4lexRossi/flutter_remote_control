import 'package:flutter/material.dart';

import 'Tv.dart';

class RemoteControlPage extends StatefulWidget {
  @override
  _RemoteControlPageState createState() => _RemoteControlPageState();
}

class _RemoteControlPageState extends State<RemoteControlPage> {
  Tv tv = Tv();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            Text(
              'TV Status: ${tv.status}',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              child: const Text('Power'),
              onPressed: () {
                setState(() {
                  tv.power();
                });
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_upward),
                  onPressed: () {
                    setState(() {
                      tv.volumeUp();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      tv.channelDown();
                    });
                  },
                ),
                const SizedBox(width: 32.0),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    setState(() {
                      tv.play();
                    });
                  },
                ),
                const SizedBox(width: 32.0),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      tv.channelUp();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: () {
                    setState(() {
                      tv.volumeDown();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
