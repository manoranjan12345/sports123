function add_to_cart(pid, pname, pprice) {

	let cart = localStorage.getItem("cart");
	if (cart == null) {
	
		let products = [];
		let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice}
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("Product is added for the first time.")
	
	} else {
		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.productId == pid)
			
			if(oldProduct){
				//we have to increse the quantity
				oldProduct.productQuantity = oldProduct.productQuantity + 1
				pcart.map((item) => {
					
					if(item.productId == oldProduct.productId) {
						item.productQuantity = oldProduct.productQuantity;
					}
				})
				
				localStorage.setItem("cart",JSON.stringify(pcart));
				console.log("Product quantity is increased.")
			}else {
				//we have to add the product
				let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice}
				pcart.push(product)
				localStorage.setItem("cart",JSON.stringify(pcart));
				console.log("Product is added.")
			}
	}
	updateCart();
}
//update card

function updateCart() {
	
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	
	if(cart == null || cart.length==0) {
		console.log("Cart is Empty")
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h5>Cart does not have items</h5>");
		$(".checkout-btn").attr('disabled',true)
	}else {
		console.log(cart)
		$(".cart-items").html(`(${cart.length})`);
		let table=`
			<table class='table'>
				<thead class='thead-light'>
					<tr>
						<th>Item Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total Price</th>
						<th>Action</th>
					</tr>
				</thead>
		`;
		
		let totalPrice=0;
		cart.map((item) => {
			
			table+=`
				<tr>
					<td>${item.productName}</td>
					<td>${item.productPrice}</td>
					<td>${item.productQuantity}</td>
					<td>${item.productQuantity*item.productPrice}</td>
					<td><button class='btn btn-secondary'>Edit</button></td>
					<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger'>Remove</button></td>
					
				</tr>
			`
			totalPrice+= item.productPrice*item.productQuantity;
			
		})
		
		table=table + `
			<tr><td colspan='6' class='text-right font-weight-bold'>Total price : ${totalPrice}</td></tr>
		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false)
	}
	
}

//delete item
function deleteItemFromCart(pid) {
	
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newcart = cart.filter((item) => item.productId != pid)
	localStorage.setItem('cart',JSON.stringify(newcart))
	updateCart();
}

$(document).ready(function(){
	
	updateCart()
	
})

function goToCheckOut() {
	
	window.location = "checkout.jsp"
}









