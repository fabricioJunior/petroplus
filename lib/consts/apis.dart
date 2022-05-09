class APIS {
  static String urlBase = 'https://petroplus-api-dev.herokuapp.com/v1/';
  static String urlOrder = 'https://petroplus-api-dev.herokuapp.com/v1/orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT';
  static String urlOrdersAwait = 'https://petroplus-api-dev.herokuapp.com/v1/orders?status=AWAT&page=1&limit=10';
  static String urlSaveOrderAll = 'orders?status[]=AAPR&status[]=DLVD&status[]=INSP&status[]=IPGR&status[]=PAID&status[]=PEND&status[]=QUTD&status[]=RFCO&status[]=AWAT';
  static String urlSaveOrder = '/orders/?status=AWAT&page=1&limit=10';

}
