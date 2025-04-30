import 'package:flutter_github_cicd/screens/homePage/fragments/personal_info/personal_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_wigets/dashboard_info_item.dart';
import '../../../../common_wigets/list_header.dart';
import '../../../../common_wigets/list_item.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../datalayer/dataProviders/dio_interceptor.dart';

//ignore: must_be_immutable
class PersonalInfo extends StatelessWidget {
  static const routeName = '/profile_dfdf_screen';
  final _controller = Get.put(
    PersonalInfoController(DioService(dioInterceptor: DioInterceptor())),
  );

  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    _controller.getProfileData();

    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      width: MediaQuery.of(context).size.width,
      height: Get.height,
      child: ProfileTab(),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      PersonalInfoController(DioService(dioInterceptor: DioInterceptor())),
    );
    return Container(
      child: SingleChildScrollView(
        controller: controller.scrollController,
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: Get.size.width,
              margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30, // Adjust size as needed
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                      backgroundColor: Colors.white,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 15, bottom: 10),
                      child: Text(
                        "Personal Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),

                    DashboardInfoItem(
                      "Full Name",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.investorName ??
                          '',
                    ),
                    SizedBox(height: 3),
                    DashboardInfoItem(
                      "Company Name",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.fatherName ??
                          '',
                    ),
                    SizedBox(height: 3),
                    DashboardInfoItem(
                      "District",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.motherName ??
                          '',
                    ),
                    SizedBox(height: 3),
                    DashboardInfoItem(
                      "Thana",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.spouseName ??
                          '',
                    ),
                    SizedBox(height: 3),
                    DashboardInfoItem(
                      "Village/Street",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.occupation ??
                          '',
                    ),
                    SizedBox(height: 3),
                    DashboardInfoItem(
                      "Phone Number",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.businessAddress ??
                          '',
                    ),
                    SizedBox(height: 3),
                    DashboardInfoItem(
                      "Office Phone Number",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.homeAddress ??
                          '',
                    ),
                    SizedBox(height: 3),
                    DashboardInfoItem(
                      "Date of Birth",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.dateOfBirth ??
                          '',
                    ),
                    SizedBox(height: 3),
                    DashboardInfoItem(
                      "Office ID Number",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.nationality ??
                          '',
                    ),
                    SizedBox(height: 3),
                    DashboardInfoItem(
                      "NID/Birth Certificate",
                      controller
                              .profileData
                              .value
                              .investorInformation
                              ?.officePhoneNo ??
                          '',
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

class ActivityTab extends StatelessWidget {
  final _controller = Get.put(
    PersonalInfoController(DioService(dioInterceptor: DioInterceptor())),
  );

  const ActivityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _tableData(context);
  }

  Widget _tableData(BuildContext context) {
    var itemName = [
      '#',
      'Nominee Name',
      'Nominee Address',
      'Relation',
      'Percentage',
    ];

    var itemCount = 5.0;
    var itemSize = 120.0;
    var dividerSize = 4.0;
    var extraSize = 20.0;

    // container-> SingleChildScrollView -> Container -> Column -> IntrinsicHeight -> Container -> ListView

    return Container(
      // margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 10, top: 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        // boxShadow: [AppConstant.myBoxShadow2()],
      ),
      // height: 35.0*listLength+80.0,
      // height: Get.size.height,
      // height: 500,
      // width: 500,
      width: itemSize * itemCount + dividerSize + extraSize,
      child: Column(
        children: [
          // Container(
          //   alignment: Alignment.centerLeft,
          //   height: 30,
          //   width: double.infinity,
          //   child: Text(
          //     'recent ipo order list'.toUpperCase(),
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black),
          //   ),
          // ),
          SizedBox(height: 20),
          SingleChildScrollView(
            controller: _controller.scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).hintColor,
                  width: 0.2,
                ),
              ),
              padding: EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Helldfsdfs dfsd'),
                  // String corner;
                  // String align;
                  // String title;
                  //   double size;
                  //   Callback callback;
                  Container(
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListHeader(
                            height: 40,
                            corner: 'left',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[0],
                            size: 60,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 1,
                          ),
                          const VerticalDivider(width: 1),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[1],
                            size: 200,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 1,
                          ),
                          const VerticalDivider(width: 1),

                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'right',
                            title: itemName[2],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 3,
                          ),
                          const VerticalDivider(width: 1),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'right',
                            title: itemName[3],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 4,
                          ),
                          const VerticalDivider(width: 1),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'right',
                            title: itemName[4],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const Divider(
                  //   height: 1,
                  // ),
                  IntrinsicHeight(
                    child: Obx(
                      () => SizedBox(
                        height: 310,
                        width: itemSize * itemCount + dividerSize + extraSize,
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              _controller
                                  .profileData
                                  .value
                                  .nomineeInformation
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var dd =
                                _controller
                                    .profileData
                                    .value
                                    .nomineeInformation![index];
                            return IntrinsicHeight(
                              child: Row(
                                children: [
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title: '${index + 1}',
                                    size: 60,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title: dd.nomineeName ?? '',
                                    size: 200,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title: dd.mailingAddress ?? '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title: dd.relation ?? '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title: dd.sharePercentage ?? '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  // // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].unrealizeGain??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),
                                  //
                                  // // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '0' : number_format( floor($account->portfolioStatement->CURRENT_MARKET_VALUE), 0, '', ',') }}</td>
                                  // //_controller.getInvestmentCost(_controller.investmentSummaryData.value.accountSummary![index].portfolioStatement?.averagebuyprice??'0', _controller.investmentSummaryData.value.accountSummary![index].unit??'0')
                                  // // Container(
                                  // //   width: 1,
                                  // //   color: Colors.white,
                                  // // ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'right',
                                  //   title: dd.nomineeName??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),
                                  // // Container(
                                  // //   width: 1,
                                  // //   color: Colors.white,
                                  // // ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'left',
                                  //   title: dd.nomineeName??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),
                                  // // Container(
                                  // //   width: 1,
                                  // //   color: Colors.white,
                                  // // ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'left',
                                  //   title: dd.nomineeName??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].unrealizeGainPercentage??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),

                                  // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '' : ( $account->dividendIncome < 0 ) ? '(' . number_format( $account->dividendIncome, 0, '', ',' ) . ')' : number_format( $account->dividendIncome, 0, '', ',' ) }}</td>
                                ],
                              ),
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) => Container(
                                height: 0.2,
                                color: Theme.of(context).hintColor,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JointTab extends StatelessWidget {
  final _controller = Get.put(
    PersonalInfoController(DioService(dioInterceptor: DioInterceptor())),
  );

  const JointTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _tableData(context);
  }

  Widget _tableData(BuildContext context) {
    var itemName = [
      '#',
      'Nominee Name',
      'Nominee Address',
      'Relation',
      'Percentage',
    ];

    var itemCount = 5.0;
    var itemSize = 120.0;
    var dividerSize = 4.0;
    var extraSize = 20.0;

    // container-> SingleChildScrollView -> Container -> Column -> IntrinsicHeight -> Container -> ListView

    return Container(
      // margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 10, top: 3),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        // boxShadow: [AppConstant.myBoxShadow2()],
      ),
      // height: 35.0*listLength+80.0,
      // height: Get.size.height,
      // height: 500,
      // width: 500,
      width: itemSize * itemCount + dividerSize + extraSize,
      child: Column(
        children: [
          // Container(
          //   alignment: Alignment.centerLeft,
          //   height: 30,
          //   width: double.infinity,
          //   child: Text(
          //     'recent ipo order list'.toUpperCase(),
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black),
          //   ),
          // ),
          SizedBox(height: 20),
          SingleChildScrollView(
            controller: _controller.scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).hintColor,
                  width: 0.2,
                ),
              ),
              padding: EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text('Helldfsdfs dfsd'),
                  // String corner;
                  // String align;
                  // String title;
                  //   double size;
                  //   Callback callback;
                  Container(
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ListHeader(
                            height: 40,
                            corner: 'left',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[0],
                            size: 60,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 1,
                          ),
                          const VerticalDivider(width: 1),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[1],
                            size: 200,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 1,
                          ),
                          const VerticalDivider(width: 1),

                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'right',
                            title: itemName[2],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 3,
                          ),
                          const VerticalDivider(width: 1),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'right',
                            title: itemName[3],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 4,
                          ),
                          const VerticalDivider(width: 1),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'right',
                            title: itemName[4],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const Divider(
                  //   height: 1,
                  // ),
                  IntrinsicHeight(
                    child: Obx(
                      () => SizedBox(
                        height: 310,
                        width: itemSize * itemCount + dividerSize + extraSize,
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              _controller
                                  .profileData
                                  .value
                                  .jointInformation
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var dd =
                                _controller
                                    .profileData
                                    .value
                                    .jointInformation![index];
                            return IntrinsicHeight(
                              child: Row(
                                children: [
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title: '${index + 1}',
                                    size: 60,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title: dd.name ?? '',
                                    size: 200,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title: dd.mailingAddress ?? '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title:
                                        dd.relationWithPrincipalApplicant ?? '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title: dd.spouseName ?? '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  // // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].unrealizeGain??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),
                                  //
                                  // // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '0' : number_format( floor($account->portfolioStatement->CURRENT_MARKET_VALUE), 0, '', ',') }}</td>
                                  // //_controller.getInvestmentCost(_controller.investmentSummaryData.value.accountSummary![index].portfolioStatement?.averagebuyprice??'0', _controller.investmentSummaryData.value.accountSummary![index].unit??'0')
                                  // // Container(
                                  // //   width: 1,
                                  // //   color: Colors.white,
                                  // // ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'right',
                                  //   title: dd.nomineeName??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),
                                  // // Container(
                                  // //   width: 1,
                                  // //   color: Colors.white,
                                  // // ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'left',
                                  //   title: dd.nomineeName??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),
                                  // // Container(
                                  // //   width: 1,
                                  // //   color: Colors.white,
                                  // // ),
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'left',
                                  //   title: dd.nomineeName??'',
                                  //   size: 120,
                                  //   callback: () {
                                  //     debugPrint('P: 1');
                                  //   },
                                  //   position: 1,
                                  // ),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].unrealizeGainPercentage??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),

                                  // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '' : ( $account->dividendIncome < 0 ) ? '(' . number_format( $account->dividendIncome, 0, '', ',' ) . ')' : number_format( $account->dividendIncome, 0, '', ',' ) }}</td>
                                ],
                              ),
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) => Container(
                                height: 0.2,
                                color: Theme.of(context).hintColor,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
  Widget _investorPersonalInfo(BuildContext context) {
    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              "Personal Information",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          DashboardInfoItem("Investor Name", _controller.profileData.value.investorInformation?.investorName ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Father’s Name", _controller.profileData.value.investorInformation?.fatherName ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Mother’s Name", _controller.profileData.value.investorInformation?.motherName ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Spouse Name", _controller.profileData.value.investorInformation?.spouseName ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Occupation", _controller.profileData.value.investorInformation?.occupation ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Business Address", _controller.profileData.value.investorInformation?.businessAddress ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Home Address", _controller.profileData.value.investorInformation?.homeAddress ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Date of Birth", _controller.profileData.value.investorInformation?.dateOfBirth ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Nationality", _controller.profileData.value.investorInformation?.nationality ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Office Phone No.", _controller.profileData.value.investorInformation?.officePhoneNo ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Home Phone No.", _controller.profileData.value.investorInformation?.homePhoneNo ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Mobile No.", _controller.profileData.value.investorInformation?.mobileNo ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("E-Mail", _controller.profileData.value.investorInformation?.email ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Identity No.", _controller.profileData.value.investorInformation?.identityNo ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Passport No.", _controller.profileData.value.investorInformation?.passportNo ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Issue Place", _controller.profileData.value.investorInformation?.issuePlace ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Valid Till", _controller.profileData.value.investorInformation?.validTill ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Fax No.", _controller.profileData.value.investorInformation?.faxNo ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Telex", _controller.profileData.value.investorInformation?.telex ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("TIN", _controller.profileData.value.investorInformation?.tin ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Investor Account No.", _controller.profileData.value.investorInformation?.investorAccountNo ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Account Type", _controller.profileData.value.investorInformation?.accountType ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Sub Account Type", _controller.profileData.value.investorInformation?.subAccountType ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Bank Name", _controller.profileData.value.investorInformation?.bankName ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Branch Name", _controller.profileData.value.investorInformation?.branchName ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Bank Account No.", _controller.profileData.value.investorInformation?.bankAccountNo ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Connecting Branch", _controller.profileData.value.investorInformation?.connectingBranch ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Operation Type", _controller.profileData.value.investorInformation?.operationType ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Opening Date", _controller.profileData.value.investorInformation?.openingDate ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Special Instruction", _controller.profileData.value.investorInformation?.specialInstruction ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Introducer Name", _controller.profileData.value.investorInformation?.introducerName ?? ''),
          SizedBox(height: 3),
          DashboardInfoItem("Introducer Account", _controller.profileData.value.investorInformation?.introducerAccount ?? ''),
        ],
      )),
    );
  }



  Widget _investorContactInfo(BuildContext context) {
    var itemName = [
      "Contact Info",

      "Email",
      'Phone',
      'Address',

    ];

    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(bottom: 20,left: 10,right: 10),

      child: Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              itemName[0].toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).hintColor),
            ),
          ),
          DashboardInfoItem(itemName[1],_controller.profileData.value.email??''),
          SizedBox(height: 3),
          DashboardInfoItem(itemName[2],_controller.profileData.value.mobile??''),
          SizedBox(height: 3),
          DashboardInfoItem(itemName[3],_controller.profileData.value.mailingAddress??''),


        ],
      )),
    );
  }


  Widget _investorBankInfo(BuildContext context) {
    var itemName = [
      "Bank Info",

      "Bank",
      'Branch',
      'Bank Ac No.'
    ];

    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(bottom: 20,left: 10,right: 10),

      child: Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              itemName[0].toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).hintColor),
            ),
          ),
          DashboardInfoItem(itemName[1],_controller.profileData.value.bankName??''),
          SizedBox(height: 3),
          DashboardInfoItem(itemName[2],_controller.profileData.value.branchName??''),
          SizedBox(height: 3),
          DashboardInfoItem(itemName[3],_controller.profileData.value.bankAccountNo??''),
        ],
      )),
    );
  }

  Widget _investorAccountInfo(BuildContext context) {
    var itemName = [
      "Account Info",

      "Code",
      'Operating Branch',
      'Date',
      'BO Account No.',

    ];

    return Container(
      width: Get.size.width,
      margin: const EdgeInsets.only(bottom: 20,left: 10,right: 10),

      child: Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              itemName[0].toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).hintColor),
            ),
          ),
          DashboardInfoItem(itemName[1],_controller.profileData.value.portfolioCode??''),
          SizedBox(height: 3),
          DashboardInfoItem(itemName[2],_controller.profileData.value.bankName??''),
          SizedBox(height: 3),
          DashboardInfoItem(itemName[3],_controller.profileData.value.bankName??''),
          SizedBox(height: 3),
          DashboardInfoItem(itemName[4],_controller.profileData.value.boAccountNo??''),

        ],
      )),
    );
  }

   */
