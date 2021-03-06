import 'package:app/src/Config/palette.dart';
import 'package:app/src/Pages/PerfilG/guide_profile_w_back_button.dart';
import 'package:app/src/Widget/user_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({Key? key, required this.imageUrl, required this.name})
      : super(key: key);

  final name;
  final Image imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.cinzaTransparente),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserAvatarWidget(
                height: 80,
                width: 80,
                image: imageUrl,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '๐ 4.8 ยท 2 anos na plataforma',
                  style: TextStyle(color: Palette.cinzaClaro),
                ),
              ],
            ),
            if (name.contains('Pedro'))
              Padding(
                // TODO: remover esse padding e corrigir esse alinhamento
                padding: const EdgeInsets.only(bottom: 50),
                child: GestureDetector(
                  onTap: () => Get.to(() => GuideProfileWBackButton()),
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Palette.cinzaClaro),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          Text('Perfil'),
                        ],
                      ),
                    )),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
