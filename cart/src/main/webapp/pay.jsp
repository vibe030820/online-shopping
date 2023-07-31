<button id="rzp-button1">Pay with Razorpay</button>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
  var options = {
    "key": "rzp_test_f5bn7PCjRUkuOL", // Enter the Key ID generated from the Dashboard
    "amount": "<%= Integer.parseInt(request.getParameter("price")) * 100 %>",
 // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "Acme Corp",
    "description": "Test Transaction",
    "image": "https://example.com/your_logo",
    "order_id": "", // Leave it empty initially
    "callback_url": "payment_callback.jsp",
    "prefill": {
      "name": "Gaurav Kumar",
      "email": "gaurav.kumar@example.com",
      "contact": "9000090000"
    },
    "notes": {
      "address": "Razorpay Corporate Office"
    },
    "theme": {
      "color": "#3399cc"
    }
  };

  var rzp1 = new Razorpay(options);
  
  document.getElementById('rzp-button1').onclick = function(e) {
    // Generate the order ID dynamically
    generateOrderId(function(orderId) {
      options.order_id = orderId; // Set the generated order ID in the options
      rzp1.open();
    });
    e.preventDefault();
  };
  
  function generateOrderId(callback) {
    // Make an AJAX request or use any other method to generate the order ID dynamically
    // Here's an example using a simple timestamp-based order ID
    var timestamp = Date.now().toString();
    var randomId = Math.floor(Math.random() * 1000000).toString();
    var orderId = timestamp + randomId;
    callback(orderId);
  }
</script>
