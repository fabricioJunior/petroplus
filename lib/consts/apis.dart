class APIS {
  ///  [Base]
  static String urlBase = 'https://petroplus-api-test.herokuapp.com/v1/';

  /// [Vehicles]
  static String urlGetModels = 'vehicles/models/';
  static String urlGetMakers = 'vehicles/makers/';

  /// [Order]
  static String urlGetOrdersAwait = 'orders?status=AWAT&page=1&limit=10';
  static String urlGetOrders = 'orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT';
}
