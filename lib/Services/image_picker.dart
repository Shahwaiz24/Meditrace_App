import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

class ImagePicking {
  static pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
    static clickImage() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    return photo;
  }
}
