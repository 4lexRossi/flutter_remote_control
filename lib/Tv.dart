import 'package:flutter/material.dart';

class Tv {
  bool _power = false;
  int _channel = 1;
  int _volume = 50;

  String get status => _power ? 'ON' : 'OFF';
  int get channel => _channel;
  int get volume => _volume;

  void power() {
    _power = !_power;
  }

  void channelUp() {
    if (_power) {
      _channel++;
    }
  }

  void channelDown() {
    if (_power) {
      _channel--;
    }
  }

  void volumeUp() {
    if (_power && _volume < 100) {
      _volume++;
    }
  }

  void volumeDown() {
    if (_power && _volume > 0) {
      _volume--;
    }
  }

  void play() {
    if (_power) {
      // TODO: send play command over Bluetooth
    }
  }

  void pause() {
    if (_power) {
      // TODO: send pause command over Bluetooth
    }
  }

  void rewind() {
    if (_power) {
      // TODO: send rewind command over Bluetooth
    }
  }

  void fastForward() {
    if (_power) {
      // TODO: send fast forward command over Bluetooth
    }
  }

  void setChannel(int channel) {
    if (_power) {
      _channel = channel;
    }
  }

  void setVolume(int volume) {
    if (_power) {
      _volume = volume;
    }
  }
}
