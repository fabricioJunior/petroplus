class APIS {
  ///  [Base]
  static String urlBase = 'https://petroplus-api-test.herokuapp.com/v1/';
  
  /// [Vehicles]
  static String urlGetVehicles = 'orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT';
  
  /// [Order]
  static String urlGetOrdersAwait = 'orders?status=AWAT&page=1&limit=10';
  static String urlGetOrder = 'orders/?status=AWAT&page=1&limit=10';
}
