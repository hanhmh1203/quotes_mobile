import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class DialogHelperDelete {
  void openDialogDelete(
    BuildContext context,
  ) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('confirm_delete').tr(),
          content: Text('question_delete').tr(),
          actions: <Widget>[
            TextButton(
              child: const Text('cancel').tr(),
              onPressed: () {
                Get.back;
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'delete',
                style: TextStyle(
                  color: Colors.white, // Màu chữ là màu trắng
                ),
              ).tr(),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
