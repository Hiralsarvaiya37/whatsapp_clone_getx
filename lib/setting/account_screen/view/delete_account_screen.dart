import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/change_number_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppColors.whiteColor),
        ),
        title: Text(
          "Delete this account",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.warning_amber,
                    size: AppSize.getSize(30),
                    color: AppColors.redShade600,
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "If you delete this account:",
                          style: TextStyle(
                            color: AppColors.redShade600,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(15)),
                        appTitle(
                          "The account will be deleted from WhatsApp and all your devices",
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle("Your message history will be erased"),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle(
                          "You will be removed from all your WhatsApp groups",
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle(
                          "Delete your payments history and cancel any pending payments",
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle("Any channels you created will be deleted"),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle(
                          "Any active channel subscriptions associated with this account will be canceled",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(40)),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.system_security_update,
                    size: AppSize.getSize(30),
                    color: AppColors.greyShade400,
                  ),
                  SizedBox(width: AppSize.getSize(30)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Change number insted?",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppSize.getSize(18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: AppSize.getSize(15)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangeNumberScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: AppSize.getSize(42),
                          width: AppSize.getSize(170),
                          decoration: BoxDecoration(
                            color: AppColors.greenAccentShade700,
                            borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Change number",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AppSize.getSize(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(40)),

              Padding(
                padding:  EdgeInsets.only(left: AppSize.getSize(50)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To delete your account, confirm your country code and enter your phone number.",
                      style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(16)),
                    ),
                    SizedBox(height: AppSize.getSize(25)),
                    Text(
                      "Country",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: AppSize.getSize(14),
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(5)),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "India",
                            style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: AppSize.getSize(25),
                          color: AppColors.greyShade400,
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.getSize(3)),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColors.greyShade400),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(30)),
                    Text(
                      "Phone",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: AppSize.getSize(14),
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(7)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppSize.getSize(45),
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                cursorColor: AppColors.greenAccentShade700,
                                style: TextStyle(
                                  color: AppColors.whiteColor,

                                  fontSize: AppSize.getSize(18),
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                  hintText: "+91",
                                  hintStyle: TextStyle(color: AppColors.whiteColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greyColor,
                                      width: AppSize.getSize(1.3),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.greenAccentShade700,
                                      width: AppSize.getSize(2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: AppSize.getSize(15)),

                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            cursorColor: AppColors.greenAccentShade700,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Phone number",
                              hintStyle: TextStyle(color: AppColors.greyColor),
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.greyColor,
                                  width: AppSize.getSize(1.3),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.greenAccentShade700,
                                  width: AppSize.getSize(2),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.getSize(40)),
                    Container(
                      height: AppSize.getSize(40),
                      width: AppSize.getSize(140),
                      decoration: BoxDecoration(
                        color: AppColors.redShade600,
                        borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Delete Account",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(40))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appTitle(String title) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "•",
              style: TextStyle(
                color: AppColors.greyShade400,
                fontSize: AppSize.getSize(22),
                height: AppSize.getSize(1.1),
              ),
            ),
            SizedBox(width: AppSize.getSize(10)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                  height: AppSize.getSize(1.3),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
