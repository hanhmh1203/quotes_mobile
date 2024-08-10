import 'package:flutter/material.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Align(
                  alignment: Alignment.topCenter, // Đặt vị trí của dialog lên cao
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 250.0), // Điều chỉnh khoảng cách từ trên cùng
                    child: Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95, // 95% của màn hình
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                maxLines: 5,
                                decoration: InputDecoration(
                                  hintText: 'Quote', // Thay đổi labelText thành hintText
                                  hintStyle: const TextStyle(color: Colors.deepPurple),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.deepPurple, // Màu xanh đen cho đường viền
                                      width: 2.0, // Độ dày của đường viền
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Author', // Thay đổi labelText thành hintText
                                  hintStyle: const TextStyle(color: Colors.deepPurple),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.deepPurple, // Màu xanh đen cho đường viền
                                      width: 2.0, // Độ dày của đường viền
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Type', // Thay đổi labelText thành hintText
                                  hintStyle: const TextStyle(color: Colors.deepPurple),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      color: Colors.deepPurple, // Màu xanh đen cho đường viền
                                      width: 2.0, // Độ dày của đường viền
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Xử lý logic khi nhấn nút Save
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
