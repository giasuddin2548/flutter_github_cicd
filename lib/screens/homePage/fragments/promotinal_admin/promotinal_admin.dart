import 'package:flutter_github_cicd/screens/homePage/fragments/promotinal_admin/promotinal_admin_edit_add.dart';
import 'package:flutter_github_cicd/screens/homePage/fragments/promotinal_admin/promotinal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../../../common_wigets/list_header.dart';
import '../../../../common_wigets/list_item.dart';
import '../../../../datalayer/dataProviders/dio_interceptor.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';

class PromotinalAdmin extends StatelessWidget {
  static const routeName = '/promotinal_admin';
  final PromotinalController _controller = Get.put(
    PromotinalController(DioService(dioInterceptor: DioInterceptor())),
  );
  @override
  Widget build(BuildContext context) {
    _controller.getAccountName();
    // _controller.getBankName();
    // _controller.getDepositList();
    return Container(
      // alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      // decoration: BoxDecoration(
      //     color: Theme.of(context).cardColor,
      //     borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: Get.width,
      height: Get.height,
      child: SingleChildScrollView(child: _tableData(context)),
    );
  }

  Widget _tableData(BuildContext context) {
    var itemName = [
      '#',
      'News Type',
      'Dashboard',
      'Subject',

      'Body',
      'Start Date',
      'End Date',
      'Action',
    ];

    var itemCount = 8.0;
    var itemSize = 120.0;
    var dividerSize = 9.0;
    var extraSize = 20.0;
    var listLength = 20;

    // container-> SingleChildScrollView -> Container -> Column -> IntrinsicHeight -> Container -> ListView

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5.0),
      ), // margin: const EdgeInsets.only(top: 10, bottom: 20),
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
      child: Column(
        children: [
          /*
                                             _controller.promotinalActionType.value="Add Promotional News";
                                    Get.toNamed(PromotinalAdminEditAdd.routeName);
           */
          Container(
            alignment: Alignment.centerLeft,
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promotional News & IPO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Border color
                        width: 1.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ), // Optional: rounded corners
                    ),
                    padding: EdgeInsets.all(
                      3.0,
                    ), // Optional: for spacing inside the container
                    child: Text(
                      'Add News',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  onTap: () {
                    _controller.promotinalActionType.value =
                        "Add Promotional News";
                    Get.toNamed(PromotinalAdminEditAdd.routeName);
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            controller: _controller.scrollController,
            scrollDirection: Axis.horizontal,
            child: Container(
              width: itemSize * itemCount + dividerSize + extraSize,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).hintColor,
                  width: 0.2,
                ),
              ),
              // padding: EdgeInsets.only(right: 10),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              align: 'left',
                              title: itemName[2],
                              size: 120,
                              callback: () {
                                debugPrint('P: 1');
                              },
                              position: 2,
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
                              position: 3,
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
                              position: 4,
                            ),
                            const VerticalDivider(width: 1),
                            ListHeader(
                              height: 40,
                              corner: 'center',
                              color: Colors.black.withOpacity(0.2),
                              align: 'right',
                              title: itemName[5],
                              size: 120,
                              callback: () {
                                debugPrint('P: 1');
                              },
                              position: 5,
                            ),
                            const VerticalDivider(width: 1),
                            ListHeader(
                              height: 40,
                              corner: 'center',
                              color: Colors.black.withOpacity(0.2),
                              align: 'left',
                              title: itemName[6],
                              size: 120,
                              callback: () {
                                debugPrint('P: 1');
                              },
                              position: 6,
                            ),
                            const VerticalDivider(width: 1),
                            ListHeader(
                              height: 40,
                              corner: 'center',
                              color: Colors.black.withOpacity(0.2),
                              align: 'center',
                              title: itemName[7],
                              size: 120,
                              callback: () {
                                debugPrint('P: 1');
                              },
                              position: 7,
                            ),
                            // const VerticalDivider(
                            //   width: 1,
                            // ),
                            // const VerticalDivider(
                            //   width: 1,
                            // ),
                            // ListHeader(
                            //   height: 40,
                            //   corner: 'center',
                            //   color: Colors.black.withOpacity(0.2),
                            //   align: 'center',
                            //   title: itemName[7],
                            //   size: 120,
                            //   callback: () {
                            //     debugPrint('P: 1');
                            //   },
                            //   position: 7,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    // const Divider(
                    //   height: 1,
                    // ),
                    IntrinsicHeight(
                      child: Container(
                        height: 310,
                        width: itemSize * itemCount + dividerSize + extraSize,
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _controller.promotianlList.length ?? 0,
                          itemBuilder: (context, index) {
                            // var p = _controller.depositList[index];
                            // _controller.calculateTotalOverview(index);
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
                                    title:
                                        _controller
                                            .promotianlList[index]
                                            .newsType ??
                                        '',
                                    size: 200,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title:
                                        _controller
                                            .promotianlList[index]
                                            .dashboard ??
                                        '',
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
                                        _controller
                                            .promotianlList[index]
                                            .subject ??
                                        '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  const VerticalDivider(width: 1),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat('0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),

                                  // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '0' : number_format( floor( (float) $account->portfolioStatement->AVERAGE_BUY_PRICE * $account->unit ), 0, '', ',') }}</td>

                                  //_controller.getInvestmentCost(_controller.investmentSummaryData.value.accountSummary![index].portfolioStatement!=null?'0':'0')),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title:
                                        _controller
                                            .promotianlList[index]
                                            .bodyDetails ??
                                        '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].totalInvestmentAtCost??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].totalInvestmentAtCost==null?'0':_controller.getInvestmentCost(_controller.investmentSummaryData.value.accountSummary![index].portfolioStatement?.averagebuyprice??'0', _controller.investmentSummaryData.value.accountSummary![index].unit??'0')), size: 120, callback: (){debugPrint('P: 1');}, position: 4,),
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title:
                                        _controller
                                            .promotianlList[index]
                                            .startDate ??
                                        '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].unrealizeGain??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),

                                  // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '0' : number_format( floor($account->portfolioStatement->CURRENT_MARKET_VALUE), 0, '', ',') }}</td>
                                  //_controller.getInvestmentCost(_controller.investmentSummaryData.value.accountSummary![index].portfolioStatement?.averagebuyprice??'0', _controller.investmentSummaryData.value.accountSummary![index].unit??'0')
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  const VerticalDivider(width: 1),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title:
                                        _controller
                                            .promotianlList[index]
                                            .endDate ??
                                        '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  // ListItem(corner: 'center', align: 'center', title: AppConstant.singleValueFormat(_controller.investmentSummaryData.value.data?.portfolioStatement?[index].unrealizeGainPercentage??'0'), size: 120, callback: (){debugPrint('P: 1');}, position: 3,),

                                  // <td class="text-right d-block">{{ ( '' == $account->portfolioStatement ) ? '' : ( $account->dividendIncome < 0 ) ? '(' . number_format( $account->dividendIncome, 0, '', ',' ) . ')' : number_format( $account->dividendIncome, 0, '', ',' ) }}</td>
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  //
                                  const VerticalDivider(width: 1),
                                  ListItemAction(
                                    corner: 'center',
                                    align: 'right',
                                    title:
                                        _controller
                                            .promotianlList[index]
                                            .dashboard ??
                                        '',
                                    size: 120,
                                    callback: () {
                                      _controller.promotinalActionType.value =
                                          "Edit Promotional News";
                                      _controller.makeItDefault();
                                      _controller.promotinalActionTypeValue =
                                          _controller
                                              .promotianlList[index]
                                              .id ??
                                          '';
                                      _controller
                                          .selectedStartDateTextController
                                          .text = _controller
                                              .promotianlList[index]
                                              .startDate ??
                                          '';
                                      _controller
                                          .selectedEndDateTextController
                                          .text = _controller
                                              .promotianlList[index]
                                              .endDate ??
                                          '';
                                      _controller.subjectTextController.text =
                                          _controller
                                              .promotianlList[index]
                                              .subject ??
                                          '';
                                      _controller.bodyTextController.text =
                                          _controller
                                              .promotianlList[index]
                                              .bodyDetails ??
                                          '';
                                      Get.toNamed(
                                        PromotinalAdminEditAdd.routeName,
                                      );
                                    },
                                    callback2: () {
                                      Get.back();
                                      AppConstant.showDeleteWaringMSG(
                                        context,
                                        "You won't be able to revert this!",
                                        () {
                                          _controller.deleteItem(
                                            _controller.promotianlList[index],
                                          );
                                        },
                                      );
                                    },
                                    position: 1,
                                  ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
