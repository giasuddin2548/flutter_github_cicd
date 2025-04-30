import 'package:flutter_github_cicd/screens/homePage/fragments/withdraw/withdraw_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/common_wigets/form_header.dart';
import 'package:flutter_github_cicd/common_wigets/my_text_field.dart';
import 'package:flutter_github_cicd/utils/app_constent.dart';
import '../../../../common_wigets/list_header.dart';
import '../../../../common_wigets/list_item.dart';
import '../../../../datalayer/dataProviders/dio_interceptor.dart';
import '../../../../datalayer/dataProviders/dio_service.dart';
import '../../../../utils/Utils.dart';

class WithdrawScreen extends StatelessWidget {
  final WithdrawScreenController _controller = Get.put(
    WithdrawScreenController(DioService(dioInterceptor: DioInterceptor())),
  );




  @override
  Widget build(BuildContext context) {
    _controller.getBalance();
    _controller.getWithdrawList();
    return Container(
      // alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      // decoration: BoxDecoration(
      //     color: AppConstant.textColorMain(),
      //     borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: MediaQuery.of(context).size.width,

      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              width: Get.size.width,
              child: Form(
                key: _controller.withdrawPageKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10),
                    AppConstant.timerMarketPlace(context),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      alignment: Alignment.center,
                      height: 60,
                      // color: Colors.yellow,
                      child: Text(
                        "Withdrawal Request Form".toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey.withOpacity(0.2)),

                    FormHeader(title: "Available Balance"),
                    MyTextField(
                      isRequired: false,
                      editingController:
                          _controller.availableBalanceTextController,
                      enableOrDisable: false,
                      hints: 'Available Balance',
                      errorMessage: 'Please fill in this field.',
                      inputType: TextInputType.text,
                    ),

                    FormHeader(title: "Withdrawal Amount", required: true),

                    MyTextField(
                      isRequired: true,
                      editingController:
                          _controller.withdrawAmountTextController,
                      enableOrDisable: true,
                      hints: 'Withdraw Amount',
                      errorMessage: 'Please fill in this field.',
                      inputType: TextInputType.text,
                      onChangedCallback: (v) {},
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                    //   child: Text(
                    //     'NOTE: Early withdrawn fees are applicable if account age within one year.',
                    //   ),
                    // ),
                    Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
                    SizedBox(height: 10),
                    Utils.globalButton(
                      context,
                      "Submit",
                      () {
                        if (_controller.withdrawPageKey.currentState!
                            .validate()) {
                          _controller.postWithdraw();
                        }
                      },
                      MediaQuery.of(context).size.width / 2,
                      40,
                    ),

                    // Container(
                    //   margin: const EdgeInsets.only(left: 10),
                    //   alignment: Alignment.center,
                    //   height: 20,
                    // ),
                    SizedBox(height: 20),

                    // Container(height: 3,color: Colors.grey.withOpacity(0.1),),
                    // _tableData(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            _tableData(context),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _tableData(BuildContext context) {
    var itemName = [
      '#',
      'Bank Name',
      'Payment Type	',
      'Cheque No',
      'Amount',
      'Status',
    ];

    var itemCount = 6.0;
    var itemSize = 120.0;
    var dividerSize = 8.0;
    var extraSize = 20.0;
    var listLength = 20;

    // container-> SingleChildScrollView -> Container -> Column -> IntrinsicHeight -> Container -> ListView

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5.0),
      ), // margin: const EdgeInsets.only(top: 10, bottom: 20),
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 20),
      width: itemSize * itemCount + dividerSize + extraSize,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: 30,
            width: double.infinity,
            child: Text(
              'recent Withdraw List'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
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
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
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
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
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
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
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
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
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
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          ListHeader(
                            height: 40,
                            corner: 'center',
                            color: Colors.black.withOpacity(0.2),
                            align: 'left',
                            title: itemName[5],
                            size: 120,
                            callback: () {
                              debugPrint('P: 1');
                            },
                            position: 5,
                          ),
                          // const VerticalDivider(
                          //   width: 1,
                          // ),
                          // ListHeader(
                          //   height: 40,
                          //   corner: 'center',
                          //   color: Colors.black.withOpacity(0.2),
                          //   align: 'center',
                          //   title: itemName[6],
                          //   size: 120,
                          //   callback: () {
                          //     debugPrint('P: 1');
                          //   },
                          //   position: 6,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // const Divider(
                  //   height: 1,
                  // ),
                  Obx(
                    () => IntrinsicHeight(
                      child: SizedBox(
                        height: 310,
                        width: itemSize * itemCount + dividerSize + extraSize,
                        child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _controller.withdrawList.length ?? 0,
                          itemBuilder: (context, index) {
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
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title:
                                        _controller
                                            .withdrawList[index]
                                            .orgName ??
                                        '',
                                    size: 200,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),
                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title:
                                        _controller
                                            .withdrawList[index]
                                            .paymentType ??
                                        '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

                                  // Container(
                                  //   width: 1,
                                  //   color: Colors.white,
                                  // ),
                                  ListItem(
                                    corner: 'center',
                                    align: 'right',
                                    title:
                                        _controller.withdrawList[index].chqNo ??
                                        '',
                                    size: 120,
                                    callback: () {
                                      debugPrint('P: 1');
                                    },
                                    position: 1,
                                  ),

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
                                            .withdrawList[index]
                                            .amount ??
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
                                  ListItem(
                                    corner: 'center',
                                    align: 'left',
                                    title:
                                        _controller
                                            .withdrawList[index]
                                            .status ??
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
                                  // ListItem(
                                  //   corner: 'center',
                                  //   align: 'center',
                                  //   title: _controller.withdrawList[index].recordDate??'',
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
