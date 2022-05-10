class APIS {
  static String urlBase = 'https://petroplus-api-test.herokuapp.com/v1/';
  static String urlGetVehicles = 'orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT';
  static String urlOrdersAwait = 'orders?status=AWAT&page=1&limit=10';
  static String urlSaveOrderAll = 'orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT';
  static String urlSaveOrder = 'orders/?status=AWAT&page=1&limit=10';

}
