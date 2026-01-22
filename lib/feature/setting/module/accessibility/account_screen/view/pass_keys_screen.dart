import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PassKeysScreen extends StatelessWidget {
  static const id="/PassKeysScreen";
  const PassKeysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          context.l10n.passkeys,
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.manageyourpasskey,
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: AppSize.getSize(22),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSize.getSize(15)),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        context.l10n.accessWhatsAppthesamewayyouunloackyourphonewithyourfingerprintfaceorscreenlockyourpasskeygivesyouasecureandeasywaytologbackintoyouraccount,
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: context.l10n.leaenmore,
                    style: TextStyle(
                      color: AppTheme.blueshade500,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.getSize(25)),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.greyShade800),
                borderRadius: BorderRadius.circular(AppSize.getSize(10)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(25),
                  vertical: AppSize.getSize(17),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: AppSize.getSize(50),
                      width: AppSize.getSize(50),
                      decoration: BoxDecoration(
                        color: AppTheme.greenshade900,
                        borderRadius: BorderRadius.circular(
                          AppSize.getSize(50),
                        ),
                      ),
                      child: Icon(
                        Icons.person_add_alt_1_sharp,
                        color: AppTheme.blackColor,
                        size: AppSize.getSize(27),
                      ),
                    ),
                    SizedBox(width: AppSize.getSize(15)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.passkeys,
                            style: TextStyle(
                              color: AppTheme.whiteColor,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(5)),
                          Text(
                            context.l10n.thiswillbeusedtoverifyYouraccount,
                            style: TextStyle(
                              color: AppTheme.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(15)),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: AppTheme.greyShade900,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        AppSize.getSize(20),
                                      ),
                                    ),
                                    title: Text(
                                      context.l10n.deletepasskey,
                                      style: TextStyle(
                                        color: AppTheme.whiteColor,
                                        fontSize: AppSize.getSize(22),
                                      ),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          context.l10n.ifyoudeletethispasskeyyouwontbeabletouseittologintoyouraccount,
                                          style: TextStyle(
                                            color: AppTheme.greyShade400,
                                            fontSize: AppSize.getSize(16),
                                          ),
                                        ),
                                        SizedBox(height: AppSize.getSize(10)),
                                        Text(
                                          context.l10n.ifyoudevicetodeletebesuretoalsodeletethepasskeyfromyourdevicepasswordmanager,
                                          style: TextStyle(
                                            color: AppTheme.greyShade400,
                                            fontSize: AppSize.getSize(16),
                                          ),
                                        ),
                                        SizedBox(height: AppSize.getSize(25)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                context.l10n.cancel,
                                                style: TextStyle(
                                                  color: AppTheme
                                                      .greenAccentShade700,
                                                  fontSize: AppSize.getSize(17),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppSize.getSize(25),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                context.l10n.delete,
                                                style: TextStyle(
                                                  color: AppTheme.redColor,
                                                  fontSize: AppSize.getSize(17),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppSize.getSize(13),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Text(
                              context.l10n.delete,
                              style: TextStyle(
                                color: AppTheme.redColor,
                                fontSize: AppSize.getSize(17),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
