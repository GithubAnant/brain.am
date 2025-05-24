import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LiveTimeText extends StatefulWidget {
  const LiveTimeText({super.key});

  @override
  State<LiveTimeText> createState() => _LiveTimeTextState();
}

class _LiveTimeTextState extends State<LiveTimeText> {
  late Timer _timer;
  String _currentTime = "";

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _updateTime(),
    );
  }

  void _updateTime() {
    final now = DateTime.now().toUtc().add(
      const Duration(hours: 5, minutes: 30),
    ); // IST
    setState(() {
      _currentTime = DateFormat('hh:mm a').format(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentTime,
      style: const TextStyle(
        fontSize: 72,
        fontFamily: 'Montserrat',
        color: Colors.white,
      ),
    );
  }
}
