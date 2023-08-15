import 'package:flutter/material.dart';

class LockerList extends StatefulWidget {
  const LockerList({
    Key? key,
    required this.lockerID,
    required this.lockerAddress,
  }) : super(key: key);

  final int lockerID;
  final String lockerAddress;

  @override
  State<LockerList> createState() => _AppState();
}

class _AppState extends State<LockerList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD8E8E9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.lock_outline_rounded,
                      color: Color.fromARGB(221, 53, 53, 53),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      widget.lockerID.toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(221, 21, 21, 21),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      widget.lockerAddress,
                      style: const TextStyle(
                        color: Color.fromARGB(221, 53, 53, 53),
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
