import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/change_number_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:country_picker/country_picker.dart';

class DeleteAccountScreen extends StatelessWidget {
  DeleteAccountScreen({super.key});
  final AccountViewController deleteController = Get.find();

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
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
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.getSize(20),
            vertical: AppSize.getSize(20),
          ),
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
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(25),
                            ),
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
                padding: EdgeInsets.only(left: AppSize.getSize(50)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To delete your account, confirm your country code and enter your phone number.",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppSize.getSize(16),
                      ),
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

                    Container(
                      padding: EdgeInsets.only(bottom: AppSize.getSize(6)),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.greyColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: false,
                                  countryListTheme: CountryListThemeData(
                                    backgroundColor: AppColors.blackColor,
                                    textStyle: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 16,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    inputDecoration: InputDecoration(
                                      labelText: 'Search',
                                      labelStyle: TextStyle(color: AppColors.greyShade400,),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: AppColors.greyShade400,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.greyShade400
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AppColors.greenAccentShade700,
                                          width: 1.5
                                        ),
                                      ),
                                    ),
                                  ),
                                  onSelect: (Country country) {
                                    deleteController.selectedCountry.value =
                                        country;
                                  },
                                );
                              },
                              child: Obx(() {
                                final country =
                                    deleteController.selectedCountry.value;
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        country?.name ?? "India",
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: AppSize.getSize(18),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: AppSize.getSize(25),
                                      color: AppColors.greyShade400,
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSize.getSize(30)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: AppSize.getSize(55),
                          child: Obx(() {
                            final country =
                                deleteController.selectedCountry.value;

                            return TextField(
                              readOnly: true,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppSize.getSize(18),
                              ),
                              decoration: InputDecoration(
                                hintText: country != null
                                    ? "+${country.phoneCode}"
                                    : "+91",
                                hintStyle: TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.greenAccentShade700,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            cursorColor: AppColors.greenAccentShade700,
                            style: TextStyle(color: AppColors.whiteColor),
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
                        borderRadius: BorderRadius.circular(
                          AppSize.getSize(25),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Delete Account",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(40)),
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
