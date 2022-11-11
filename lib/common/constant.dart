class Constant{
  ///  TOKEN
  static String storageTokenKey = 'token';
  static String serverApiUrl = bool.fromEnvironment("dart.vm.product")
      ? 'http://www.shuqi.com/'
      : 'http://www.shuqi.com/';
  /// userId
  static  String storageUserIdKey = 'userId';

  /// 设备是否第一次打开
  static String storageDeviceFirstOpenKey = 'device_first_open';

  /// 设备是否第一次登录
  static  String storageDeviceFirstLoginKey = 'device_first_login';

  /// 是否同意使用协议
  static String storageDeviceAgreeKey = 'device_agree';

  static String storageDevicePolicyEntryKey = 'device_policy_entryKey';

  /// 设备的id
  static String iid = 'iid';

  /// aliPushDeviceId
 //  String aliPushDeviceIdKey = 'aliPushDeviceId';

  /// 设备的语言
  static String storageLangKey = 'lang';

  /// 通知权限提醒日期
  static String notificationDateTime = 'notification_date_time';

}