import 'dart:async';

class Tv {
  bool _power = false;
  int _channel = 1;
  int _volume = 50;
  StreamController<String> _streamController = StreamController();

  Stream<String> get stream => _streamController.stream;

  String get status => _power ? 'ON' : 'OFF';
  int get channel => _channel;
  int get volume => _volume;

  void power() {
    _power = !_power;
    _streamController.add('power');
  }

  void channelUp() {
    if (_power) {
      _channel++;
      _streamController.add('channel_up');
    }
  }

  void channelDown() {
    if (_power) {
      _channel--;
      _streamController.add('channel_down');
    }
  }

  void volumeUp() {
    if (_power && _volume < 100) {
      _volume++;
      _streamController.add('volume_up');
    }
  }

  void volumeDown() {
    if (_power && _volume > 0) {
      _volume--;
      _streamController.add('volume_down');
    }
  }

  void play() {
    if (_power) {
      // TODO: send play command over Bluetooth
      _streamController.add('play');
    }
  }

  void pause() {
    if (_power) {
      // TODO: send pause command over Bluetooth
      _streamController.add('pause');
    }
  }

  void stop() {
    if (_power) {
      // TODO: send stop command over Bluetooth
      _streamController.add('stop');
    }
  }

  void mute() {
    if (_power) {
      // TODO: send mute command over Bluetooth
      _streamController.add('mute');
    }
  }

  void dispose() {
    _streamController.close();
  }
}
