import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_github_cicd/datalayer/dataProviders/dio_interceptor.dart';
import 'package:flutter_github_cicd/datalayer/dataProviders/dio_service.dart';
import 'package:flutter_github_cicd/screens/homePage/fragments/payments/payments_screen.dart';
import '../../../profile/edit_profile_screen.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboardScreen';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController _controller = Get.put(
    DashboardController(DioService(dioInterceptor: DioInterceptor())),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.04;

    _controller.getProfileData(context);

    return SingleChildScrollView(
      controller: _controller.scrollController,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: Column(
        children: [
          Obx(
            () => Visibility(
              visible:
                  (_controller
                          .dashboardData
                          .value
                          .dashboardData
                          ?.setupProgress ??
                      0) !=
                  100,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(EditProfileScreen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.all(size.width * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Profile Setup\nProgress',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Complete setup >',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: size.width * 0.18,
                            height: size.width * 0.18,
                            child: CircularProgressIndicator(
                              value:
                                  ((_controller
                                                  .dashboardData
                                                  .value
                                                  .dashboardData
                                                  ?.setupProgress ??
                                              0) /
                                          100)
                                      .toDouble(),
                              strokeWidth: 8,
                              backgroundColor: Colors.grey[400],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            '${_controller.dashboardData.value.dashboardData?.setupProgress ?? 0}%',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(size.width * 0.04),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Balance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Obx(
                  () => InkWell(
                    onTap: _controller.changeState,
                    child: Container(
                      width: 160,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: _controller.isBallanceShown.value ? 1 : 0,
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              '৳${_controller.dashboardData.value.dashboardData?.balance ?? 0.0}',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: _controller.isBallance.value ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: const Text(
                              'Tap for balance',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 1100),
                            left:
                                _controller.isAnimated.value == false ? 5 : 135,
                            curve: Curves.fastOutSlowIn,
                            child: Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const FittedBox(
                                child: Text(
                                  '৳',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
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
          ),
          SizedBox(height: size.height * 0.01),

          Obx(
            () => _buildTileRow(size, [
              _buildGridTile(
                title: 'Rewards',
                value:
                    '${_controller.dashboardData.value.dashboardData?.rewards ?? 0.0}',
                icon: Icons.star,
                footer: 'View Rewards >',
              ),
              _buildGridTile(
                title: 'Current Points',
                value:
                    '${_controller.dashboardData.value.dashboardData?.rewards ?? 0.0}',
                icon: Icons.star,
                footer: "",
              ),
            ]),
          ),

          _buildTileRow(size, [
            Obx(
              () => _buildGridTile(
                title: 'Paid',
                value:
                    '৳ ${_controller.dashboardData.value.dashboardData?.totalWithdrawal ?? 0.0}',
                footer: "",
              ),
            ),
            _buildGridTile(
              title: 'New\nInstallation',
              icon: Icons.arrow_forward_ios,
              isButton: true,
            ),
          ]),
          GestureDetector(
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => PaymentsScreen()));
            },
            child: _buildTileRow(size, [
              _buildGridTile(
                title: 'Payment\nRequest',
                icon: Icons.arrow_forward_ios,
                isButton: true,
              ),
              const SizedBox.shrink(),
            ]),
          ),

          SizedBox(height: size.height * 0.01),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Product",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "See More >",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: size.height * 0.01),

          Obx(
            () => SizedBox(
              height: size.height * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    _controller
                        .dashboardData
                        .value
                        .dashboardData
                        ?.topProducts
                        ?.length ??
                    0,
                itemBuilder: (context, index) {
                  var d =
                      _controller
                          .dashboardData
                          .value
                          .dashboardData
                          ?.topProducts![index];
                  return Container(
                    margin: EdgeInsets.only(right: size.width * 0.03),
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.memory(
                        _controller.imageConvertor(d?.image ?? ''),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Deals",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "See More >",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),

          Obx(
            () => SizedBox(
              height: size.height * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    _controller
                        .dashboardData
                        .value
                        .dashboardData
                        ?.latestDeals
                        ?.length ??
                    0,
                itemBuilder: (context, index) {
                  var d =
                      _controller
                          .dashboardData
                          .value
                          .dashboardData
                          ?.latestDeals![index];
                  return Container(
                    margin: EdgeInsets.only(right: size.width * 0.03),
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.memory(
                        _controller.imageConvertor(d?.image ?? ''),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTileRow(Size size, List<Widget> tiles) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.01),
      child: Row(
        children:
            tiles
                .map(
                  (tile) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: tile,
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _buildGridTile({
    required String title,
    String? value,
    IconData? icon,
    String? footer,
    bool isButton = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          if (value != null && icon != null)
            Row(
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          else if (value != null)
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          if (isButton)
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(icon ?? Icons.arrow_forward_ios),
            ),
          if (footer != null) ...[
            const SizedBox(height: 8),
            Text(footer, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ],
      ),
    );
  }
}
