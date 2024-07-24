import 'package:flutter/material.dart';

class VerifiedProfileWidget extends StatelessWidget {
  final String? name;
  final String appId;

  const VerifiedProfileWidget({
    Key? key,
    required this.name,
    required this.appId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFFBECEC),
          radius: MediaQuery.of(context).size.width * 0.07,
          child: const Icon(
            Icons.person,
            color: Color(0xFFC1272D),
            size: 18.86,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Icon(
                  Icons.fingerprint,
                  size: 10.7,
                ),
                const Text(
                  'App ID: ',
                  style: TextStyle(fontSize: 10.7),
                ),
                Text(
                  appId,
                  style: const TextStyle(fontSize: 10.7, color: Colors.grey),
                ),
                
              ],
            ),
            
          ],
        ),
        const Spacer(),
        Container(
          height: MediaQuery.of(context).size.width * 0.08,
          width: MediaQuery.of(context).size.width * 0.17,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/new_releases (1).png'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                const Text(
                  'Verfied',

                  style: TextStyle(color: Colors.white, fontSize: 8.42),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
