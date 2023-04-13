import 'package:flutter/material.dart';
import 'package:wifi_iot/wifi_iot.dart';

import 'tv.dart';

class RemoteControl extends StatefulWidget {
  @override
  _RemoteControlState createState() => _RemoteControlState();
}

class _RemoteControlState extends State<RemoteControl> {
  final _textController = TextEditingController();
  final _tv = Tv();
  bool _isConnected = false;

  Future<void> _connectToWifi() async {
    String ssid = _textController.text;
    String password = '<password here>';
    bool isConnected = false;

    try {
      await WiFiForIoTPlugin.connect(ssid, password: password);
      isConnected = true;
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isConnected = isConnected;
      });
    }
  }

  void _disconnectFromWifi() {
    WiFiForIoTPlugin.disconnect();
    setState(() {
      _isConnected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remote Control'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32.0),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Wi-Fi SSID',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _connectToWifi,
              child: const Text('Connect to Wi-Fi'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _disconnectFromWifi,
              child: const Text('Disconnect from Wi-Fi'),
            ),
            const SizedBox(height: 32.0),
            Text(
              'TV Status: ${_tv.status}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.power();
                    });
                  },
                  icon: const Icon(Icons.power_settings_new),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.channelDown();
                    });
                  },
                  icon: const Icon(Icons.arrow_left),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.channelUp();
                    });
                  },
                  icon: const Icon(Icons.arrow_right),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.volumeDown();
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.volumeUp();
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Text(
              'Channel: ${_tv.channel}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Volume: ${_tv.volume}',
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
