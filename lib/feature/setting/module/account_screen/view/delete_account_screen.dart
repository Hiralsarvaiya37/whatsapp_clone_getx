import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_state.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/change_number_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class DeleteAccountScreen extends StatelessWidget {
  static const id = "/DeleteAccountScreen";

  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();

    return BlocProvider(
      create: (_) => AccountBloc(),
      child: Scaffold(
        backgroundColor: AppTheme.blackColor,
        appBar: AppBar(
          backgroundColor: AppTheme.blackColor,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              size: AppSize.getSize(25),
              color: AppTheme.whiteColor,
            ),
          ),
          title: Text(
            context.l10n.deletethisaccount,
            style: TextStyle(
              color: AppTheme.whiteColor,
              fontSize: AppSize.getSize(23),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: BlocConsumer<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state.isDeleting) {
              // You can show loading dialog here if you want
            }
            // You can listen for delete success/failure here later
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(20),
                  vertical: AppSize.getSize(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Warning section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.warning_amber,
                          size: AppSize.getSize(30),
                          color: AppTheme.redShade600,
                        ),
                        SizedBox(width: AppSize.getSize(20)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.ifyoudeletethisaccount,
                                style: TextStyle(
                                  color: AppTheme.redShade600,
                                  fontSize: AppSize.getSize(18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: AppSize.getSize(15)),
                              appBulletPoint(context.l10n.theaccountwillbedeletedfromWhatsAppandallyourdevices),
                              appBulletPoint(context.l10n.yourmessagehistorywillbeerased),
                              appBulletPoint(context.l10n.youwillberemovedfromallyourWhatsAppgroups),
                              appBulletPoint(context.l10n.deleteyourpaymentshistoryandcancelanypendingpayments),
                              appBulletPoint(context.l10n.anychannelsyoucreatedwillbedeleted),
                              appBulletPoint(context.l10n.anyactivechannelsubscriptionsassociatedwiththisaccountwillbecanceled),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.getSize(40)),

                    // Change number instead section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.system_security_update,
                          size: AppSize.getSize(30),
                          color: AppTheme.greyShade400,
                        ),
                        SizedBox(width: AppSize.getSize(20)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.changenumberinsted,
                                style: TextStyle(
                                  color: AppTheme.whiteColor,
                                  fontSize: AppSize.getSize(18),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: AppSize.getSize(16)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const ChangeNumberScreen()),
                                  );
                                },
                                child: Container(
                                  height: AppSize.getSize(42),
                                  width: AppSize.getSize(170),
                                  decoration: BoxDecoration(
                                    color: AppTheme.greenAccentShade700,
                                    borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    context.l10n.changenumber,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: AppSize.getSize(15),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.getSize(48)),

                    // Phone confirmation section
                    Padding(
                      padding: EdgeInsets.only(left: AppSize.getSize(50)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.todeleteyouraccountconfirmyourcountrycodeandenteryourphonenumber,
                            style: TextStyle(
                              color: AppTheme.whiteColor,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(24)),

                          Text(
                            context.l10n.country,
                            style: TextStyle(
                              color: AppTheme.greyShade400,
                              fontSize: AppSize.getSize(14),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(6)),

                          InkWell(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                favorite: ['IN'],
                                countryListTheme: CountryListThemeData(
                                  backgroundColor: AppTheme.blackColor,
                                  searchTextStyle: const TextStyle(color: Colors.white),
                                  textStyle: TextStyle(color: AppTheme.whiteColor, fontSize: 16),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  inputDecoration: InputDecoration(
                                    labelText: 'Search',
                                    labelStyle: TextStyle(color: AppTheme.greyShade400),
                                    prefixIcon: Icon(Icons.search, color: AppTheme.greyShade400),
                                  ),
                                ),
                                onSelect: (Country country) {
                                  context.read<AccountBloc>().add(ToggleCountryEvent(country));
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.only(bottom: AppSize.getSize(8)),
                              decoration:  BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: AppTheme.greyColor, width: 1),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.selectedCountry?.name ?? context.l10n.india,
                                      style: TextStyle(
                                        color: AppTheme.whiteColor,
                                        fontSize: AppSize.getSize(18),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: AppSize.getSize(28),
                                    color: AppTheme.greyShade400,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: AppSize.getSize(32)),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: AppSize.getSize(70),
                                child: TextField(
                                  readOnly: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppTheme.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                  ),
                                  decoration: InputDecoration(
                                    hintText: state.selectedCountry != null
                                        ? "+${state.selectedCountry!.phoneCode}"
                                        : "+91",
                                    hintStyle: TextStyle(color: AppTheme.whiteColor),
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    enabledBorder:  UnderlineInputBorder(
                                      borderSide: BorderSide(color: AppTheme.greyColor),
                                    ),
                                    focusedBorder:  UnderlineInputBorder(
                                      borderSide: BorderSide(color: AppTheme.greenAccentShade700),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: AppSize.getSize(12)),
                              Expanded(
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  cursorColor: AppTheme.greenAccentShade700,
                                  style: TextStyle(color: AppTheme.whiteColor),
                                  decoration: InputDecoration(
                                    hintText: context.l10n.phonenumber,
                                    hintStyle: TextStyle(color: AppTheme.greyColor),
                                    contentPadding: EdgeInsets.zero,
                                    isDense: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppTheme.greyColor,
                                        width: AppSize.getSize(1.3),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppTheme.greenAccentShade700,
                                        width: AppSize.getSize(2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: AppSize.getSize(48)),

                          GestureDetector(
                            onTap: state.isDeleting
                                ? null
                                : () {
                                    final phone = phoneController.text.trim();
                                    final code = state.selectedCountry?.phoneCode ?? "91";

                                    if (phone.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(context.l10n.enterphonenumber)),
                                      );
                                      return;
                                    }

                                    context.read<AccountBloc>().add(
                                          DeleteAccountEvent(
                                            phoneNumber: phone,
                                            countryCode: code,
                                          ),
                                        );
                                  },
                            child: Container(
                              height: AppSize.getSize(48),
                              width: AppSize.getSize(160),
                              decoration: BoxDecoration(
                                color: state.isDeleting ? Colors.grey : AppTheme.redShade600,
                                borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                              ),
                              alignment: Alignment.center,
                              child: state.isDeleting
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : Text(
                                      context.l10n.deleteAccount,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),

                          SizedBox(height: AppSize.getSize(60)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget appBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSize.getSize(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "•  ",
            style: TextStyle(
              color: AppTheme.greyShade400,
              fontSize: AppSize.getSize(20),
              height: 1.4,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(16),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}