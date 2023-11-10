import 'dart:io';

class BillInput {
  String? store, invoiceNumber, total;
  File? image;

  BillInput({this.store, this.image, this.invoiceNumber, this.total});
}
