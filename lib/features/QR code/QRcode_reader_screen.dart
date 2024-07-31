// import 'package:flutter/material.dart';
// import 'package:graduation_project/core/widgets/widgets/wide_button.dart';
// import 'package:lottie/lottie.dart';

// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:graduation_project/core/config/theme.dart';

// class QRscanner extends StatefulWidget {
//   const QRscanner({super.key});

//   @override
//   State<QRscanner> createState() => _QRscannerState();
// }

// class _QRscannerState extends State<QRscanner> {
//   String scannedData = '';
//   Future<void> scan() async {
//     try {
//       String code = await FlutterBarcodeScanner.scanBarcode(
//           '#A5D6A7', 'Cancel', false, ScanMode.QR);
//       setState(() {
//         scannedData = code;
//         if (scannedData != '-1') {
//           _showAlertDialog(scannedData);
//           Navigator.pop(context);
//         }
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Hello you can here scanning your machine QRcode result and earn points',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: AppTheme.primary,
//                   fontSize: 30,
//                   fontFamily: 'Irish Grover'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Image.asset(
//               'assets/images/Group 4.png',
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             WideButton(
//                 text: 'Start scanning Qr code',
//                 onTap: () {
//                   scan();
//                 }),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showAlertDialog(String scanData) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           width: 346,
//           height: 317,
//           decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
//           child: AlertDialog(
//             icon: Lottie.asset('assets/lottie/Animation - 1714593217351.json'),
//             title: const Text('QR Code Scanned'),
//             content: Text('Scanned Data: $scanData'),
//           ),
//         );
//       },
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:graduation_project/core/widgets/widgets/wide_button.dart';
// import 'package:lottie/lottie.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:graduation_project/core/config/theme.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class QRscanner extends StatefulWidget {
//   const QRscanner({super.key});

//   @override
//   State<QRscanner> createState() => _QRscannerState();
// }

// class _QRscannerState extends State<QRscanner> {
//   int? scannedData;

//   Future<void> scan() async {
//     try {
//       String code = await FlutterBarcodeScanner.scanBarcode(
//           '#A5D6A7', 'Cancel', false, ScanMode.QR);
//       if (code != '-1') {
//         try {
//           int parsedCode = int.parse(code);
//           setState(() {
//             scannedData = parsedCode;
//           });
//           _showAlertDialog(scannedData!);
//           _sendScannedData(scannedData!);
//           Navigator.pop(context);
//         } catch (e) {
//           print('Error: scanned code is not an integer');
//           _showErrorDialog('Scanned code is not a valid integer.');
//         }
//       }
//     } catch (e) {
//       print(e);
//       _showErrorDialog('An error occurred while scanning. Please try again.');
//     }
//   }

//   Future<void> _sendScannedData(int scanData) async {
//     const String token =
//         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RuYWRhMUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpZCI6IjY2Njc5ZjRkMTYxZGNiZDFmOWMyZWUxYyIsIm5hbWUiOiJOYWRhIiwiaWF0IjoxNzE5NDE3NzI4LCJleHAiOjE3MjcxOTM3Mjh9.96eIJSkOAXTDS2mPCt8J_Fp2bfN7fSF0g5haRZ7Gnlw';
//     final url = Uri.parse('https://go-green-3w65.onrender.com/api/user/updatePoints');
//     final response = await http.patch(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: jsonEncode({'scannedData': scanData}),
//     );

//     if (response.statusCode == 200) {
//       print('Data sent successfully');
//     } else {
//       print('Failed to send data');
//       _showErrorDialog('Failed to send data. Please try again.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Hello you can here scanning your machine QRcode result and earn points',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: AppTheme.primary,
//                   fontSize: 30,
//                   fontFamily: 'Irish Grover'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Image.asset(
//               'assets/images/Group 4.png',
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             WideButton(
//                 text: 'Start scanning Qr code',
//                 onTap: () {
//                   scan();
//                 }),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showAlertDialog(int scanData) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           width: 346,
//           height: 317,
//           decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
//           child: AlertDialog(
//             icon: Lottie.asset('assets/lottie/Animation - 1714593217351.json'),
//             title: const Text('QR Code Scanned'),
//             content: Text('Scanned Data: $scanData'),
//           ),
//         );
//       },
//     );
//   }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           width: 346,
//           height: 317,
//           decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
//           child: AlertDialog(
//             title: const Text('Error'),
//             content: Text(message),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/widgets/wide_button.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QRscanner extends StatefulWidget {
  const QRscanner({super.key});

  @override
  State<QRscanner> createState() => _QRscannerState();
}

class _QRscannerState extends State<QRscanner> {
  String scannedData = '';

  Future<void> scan() async {
    try {
      String code = await FlutterBarcodeScanner.scanBarcode(
          '#A5D6A7', 'Cancel', false, ScanMode.BARCODE); // Set to barcode mode
      if (code != '-1') {
        setState(() {
          scannedData = code;
        });
        if (_isNumeric(scannedData)) {
          _showAlertDialog(scannedData);
          _sendScannedData(scannedData);
          Navigator.pop(context);
        } else {
          _showErrorDialog('Scanned code is not a valid integer');
        }
      }
    } catch (e) {
      print(e);
      _showErrorDialog('An error occurred while scanning. Please try again.');
    }
  }

  bool _isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    final number = num.tryParse(str);
    return number != null && number is int;
  }

  Future<void> _sendScannedData(String scanData) async {
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InRlc3RuYWRhMUBnbWFpbC5jb20iLCJyb2xlIjoiYWRtaW4iLCJpZCI6IjY2Njc5ZjRkMTYxZGNiZDFmOWMyZWUxYyIsIm5hbWUiOiJOYWRhIiwiaWF0IjoxNzE5NDE3NzI4LCJleHAiOjE3MjcxOTM3Mjh9.96eIJSkOAXTDS2mPCt8J_Fp2bfN7fSF0g5haRZ7Gnlw';
    final url =
        Uri.parse('https://go-green-3w65.onrender.com/api/user/updatePoints');
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'scannedData': scanData}),
    );

    if (response.statusCode == 200) {
      print('Data sent successfully');
    } else {
      print('Failed to send data');
      _showErrorDialog('Failed to send data. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, you can scan your machine barcode here and earn points',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 30,
                  fontFamily: 'Irish Grover'),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/Group 4.png',
            ),
            const SizedBox(
              height: 20,
            ),
            WideButton(
                text: 'Start scanning barcode',
                onTap: () {
                  scan();
                }),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(String scanData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 346,
          height: 317,
          decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
          child: AlertDialog(
            icon: Lottie.asset('assets/lottie/Animation - 1714593217351.json'),
            title: const Text('Barcode Scanned'),
            content: Text('Scanned Data: $scanData'),
          ),
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 346,
          height: 317,
          decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
          child: AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}
