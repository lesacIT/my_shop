import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String collectionname = "users";

  createUser(String uid,Map<String, dynamic> value) {
    _firebaseFirestore
      .collection(collectionname)
      .doc(uid) // Sử dụng doc() để tham chiếu đến tài liệu cụ thể
      .set(value) // Sử dụng set() thay vì add() nếu bạn muốn ghi đè dữ liệu tồn tại
      .then((_) => print("User created successfully")) // Xử lý thành công
        .catchError((e) => {print(e.toString())});
  }
}
