import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quotes_mobile/ui/mine/quote_mine_view_model.dart';
import 'package:quotes_mobile/ui/mine/mine_controller.dart';

class DialogHelper {
  final MineController controller = Get.find<MineController>();

  void openDialog(BuildContext context,
      Future<void> Function(QuoteMineViewModel model) onConfirm) {
    TextEditingController quoteController = TextEditingController();
    TextEditingController authorController = TextEditingController();
    TextEditingController typeController = TextEditingController();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: quoteController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Quote',
                    hintStyle: const TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: authorController,
                  decoration: InputDecoration(
                    hintText: 'Author',
                    hintStyle: const TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                    hintText: 'Type',
                    hintStyle: const TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (quoteController.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: 'Please fill in all fields',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                          );
                          return;
                        }
                        final newQuote = QuoteMineViewModel(
                          quote: quoteController.text,
                          type: typeController.text,
                          author: authorController.text,
                        );
                        // await controller.addQuote(newQuote);
                        await onConfirm(newQuote);
                        Get.back();
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
    );
  }

  static void openDialogDelete(
      BuildContext context, Function(int id) onDelete, int id) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm delete').tr(),
          content: Text('Are you sure you want to delete ?').tr(),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Delete'),
              onPressed: () async {
                onDelete(id);
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
