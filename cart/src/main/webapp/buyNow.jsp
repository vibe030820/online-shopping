<!DOCTYPE html>
<html>
<head>
<title>Merchant Check Out Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="GENERATOR" content="Evrsoft First Page">
</head>
<body>
<h1>Merchant Check Out Page</h1>
<pre>
</pre>
<form method="post" action="pgDirect.jsp">
  <table border="1">
    <tbody>
      <tr>
        <th>S.No</th>
        <th>Label</th>
        <th>Value</th>
      </tr>
      <tr>
        <td>1</td>
        <td><label>ORDER_ID::*</label></td>
        <td>
          <input id="ORDER_ID" tabindex="1" maxlength="20" size="20"
          name="ORDER_ID" autocomplete="off"
          value="ord_12345678">
        </td>
      </tr>
      <tr>
        <td>2</td>
        <td><label>CUSTID ::*</label></td>
        <td>
          <input id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off"
          value="12345">
        </td>
      </tr>
      <tr>
        <td>3</td>
        <td><label>INDUSTRY_TYPE_ID ::*</label></td>
        <td>
          <input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail">
        </td>
      </tr>
      <tr>
        <td>4</td>
        <td><label>Channel ::*</label></td>
        <td>
          <input id="CHANNEL_ID" tabindex="4" maxlength="12"
          size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
        </td>
      </tr>
      <tr>
        <td>5</td>
        <td><label>txnAmount*</label></td>
        <td>
          <input title="TXN_AMOUNT" tabindex="10"
          type="text" name="TXN_AMOUNT"
          value="1">
        </td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td><input value="CheckOut" type="submit" onclick=""></td>
      </tr>
    </tbody>
  </table>
</form>
</body>
</html>
