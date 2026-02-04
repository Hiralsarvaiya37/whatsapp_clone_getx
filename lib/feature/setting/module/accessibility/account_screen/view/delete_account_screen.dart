import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/provider/account_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/change_number_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class DeleteAccountScreen extends StatelessWidget {
  static const id = "/DeleteAccountScreen";
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    final accountProvider = context.watch<AccountViewProvider>();
    final country = accountProvider.selectedCountry;
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor: theme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: theme.whiteColor,
          ),
        ),
        title: Text(
          context.l10n.deletethisaccount,
          style: TextStyle(
            color: theme.whiteColor,
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
                    color: theme.redShade600,
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.ifyoudeletethisaccount,
                          style: TextStyle(
                            color: theme.redShade600,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(15)),
                        appTitle(
                          context
                              .l10n
                              .theaccountwillbedeletedfromWhatsAppandallyourdevices,context
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle(context.l10n.yourmessagehistorywillbeerased, context),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle(
                          context
                              .l10n
                              .youwillberemovedfromallyourWhatsAppgroups,context
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle(
                          context
                              .l10n
                              .deleteyourpaymentshistoryandcancelanypendingpayments,context
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle(
                          context.l10n.anychannelsyoucreatedwillbedeleted,context
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        appTitle(
                          context
                              .l10n
                              .anyactivechannelsubscriptionsassociatedwiththisaccountwillbecanceled,context
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
                    color: theme.greyShade400,
                  ),
                  SizedBox(width: AppSize.getSize(30)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.changenumberinsted,
                        style: TextStyle(
                          color: theme.whiteColor,
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
                            color: theme.greenAccentShade700,
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(25),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            context.l10n.changenumber,
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
                      context
                          .l10n
                          .todeleteyouraccountconfirmyourcountrycodeandenteryourphonenumber,
                      style: TextStyle(
                        color: theme.whiteColor,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(25)),
                    Text(
                      context.l10n.country,
                      style: TextStyle(
                        color: theme.greyShade400,
                        fontSize: AppSize.getSize(14),
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(5)),

                    Container(
                      padding: EdgeInsets.only(bottom: AppSize.getSize(6)),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: theme.greyColor,
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
                                    backgroundColor: theme.blackColor,
                                    searchTextStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textStyle: TextStyle(
                                      color: theme.whiteColor,
                                      fontSize: 16,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    inputDecoration: InputDecoration(
                                      labelText: 'Search',
                                      labelStyle: TextStyle(
                                        color: theme.greyShade400,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: theme.greyShade400,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: theme.greyShade400,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: theme.greenAccentShade700,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onSelect: (Country country) {
                                    accountProvider.selectedCountry = country;
                                  },
                                );
                              },
                              child: InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (Country country) {
                                      accountProvider.selectedCountry = country;
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        accountProvider.selectedCountry?.name ??
                                            context.l10n.india,
                                        style: TextStyle(
                                          color: theme.whiteColor,
                                          fontSize: AppSize.getSize(18),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      size: AppSize.getSize(25),
                                      color: theme.greyShade400,
                                    ),
                                  ],
                                ),
                              ),
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
                          child: TextField(
                            readOnly: true,
                            style: TextStyle(
                              color: theme.whiteColor,
                              fontSize: AppSize.getSize(18),
                            ),
                            decoration: InputDecoration(
                              hintText: country != null
                                  ? "+${country.phoneCode}"
                                  : "+91",
                              hintStyle: TextStyle(color: theme.whiteColor),
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: theme.greyColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: theme.greenAccentShade700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            cursorColor: theme.greenAccentShade700,
                            style: TextStyle(color: theme.whiteColor),
                            decoration: InputDecoration(
                              hintText: context.l10n.phonenumber,
                              hintStyle: TextStyle(color: theme.greyColor),
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: theme.greyColor,
                                  width: AppSize.getSize(1.3),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: theme.greenAccentShade700,
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
                        color: theme.redShade600,
                        borderRadius: BorderRadius.circular(
                          AppSize.getSize(25),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        context.l10n.deleteAccount,
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

  Widget appTitle(String title, BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "•",
              style: TextStyle(
                color: theme.greyShade400,
                fontSize: AppSize.getSize(22),
                height: AppSize.getSize(1.1),
              ),
            ),
            SizedBox(width: AppSize.getSize(10)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: theme.greyShade400,
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
