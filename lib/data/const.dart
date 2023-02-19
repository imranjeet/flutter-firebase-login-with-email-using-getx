import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

void showAlert(String message) {
  
  Fluttertoast.showToast(msg: message);
}

// void showAlert(String? message,
//     {ToastGravity? gravity,
//     length = Toast.LENGTH_SHORT,
//     Color? bgColor,
//     Color? textColor,
//     bool print = false}) {
//   if (message!.isEmpty || (!kIsWeb && Platform.isLinux)) {
//     log(message);
//   } else {
//     Fluttertoast.showToast(
//       msg: message,
//       gravity: gravity,
//       toastLength: length,
//       backgroundColor: bgColor,
//       textColor: textColor,
//       timeInSecForIosWeb: 2,
//     );
//     if (print) log(message);
//   }
// }

String generateId() {
  return Uuid().v1();
}
