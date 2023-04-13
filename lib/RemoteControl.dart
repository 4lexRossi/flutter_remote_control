import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    String password = '0859132103374564';
    bool isConnected;

    try {
      await WiFiForIoTPlugin.connect(ssid, password: password);
      isConnected = true;
    } catch (e) {
      isConnected = false;
    }

    setState(() {
      _isConnected = isConnected;
    });
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
        title: Text('Remote Control'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 32.0),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Wi-Fi SSID',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _connectToWifi,
              child: Text('Connect to Wi-Fi'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _disconnectFromWifi,
              child: Text('Disconnect from Wi-Fi'),
            ),
            SizedBox(height: 32.0),
            Text(
              'TV Status: ${_tv.status}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.power();
                    });
                  },
                  icon: Icon(Icons.power_settings_new),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.channelDown();
                    });
                  },
                  icon: Icon(Icons.arrow_left),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.channelUp();
                    });
                  },
                  icon: Icon(Icons.arrow_right),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.volumeDown();
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _tv.volumeUp();
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Text(
              'Channel: ${_tv.channel}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Volume: ${_tv.volume}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
