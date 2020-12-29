import 'dart:async';
import 'package:flutter/material.dart';

class WorkoutTimer extends ChangeNotifier {
  Stopwatch _watch;
  Timer _timer;

  Duration _initialDuration = Duration.zero;

  String get currentDuration =>
      "${_currentDuration.inHours}:${_currentDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(_currentDuration.inSeconds.remainder(60).toString().padLeft(2, '0'))}";
  Duration _currentDuration = Duration.zero;

  bool get isRunning => _timer != null;

  WorkoutTimer() {
    _watch = Stopwatch();
  }

  void _onTick(Timer timer) {
    _currentDuration = _watch.elapsed + _initialDuration;
    notifyListeners();
  }

  void start([DateTime startTime]) {
    if (_timer != null) reset();

    _initialDuration = DateTime.now().difference(startTime ?? DateTime.now());
    _currentDuration = _initialDuration;
    _timer = Timer.periodic(Duration(seconds: 1), _onTick);
    _watch.start();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _watch.stop();
    _currentDuration = _watch.elapsed;

    notifyListeners();
  }

  void reset() {
    stop();
    _watch.reset();
    _currentDuration = Duration.zero;

    notifyListeners();
  }
}
