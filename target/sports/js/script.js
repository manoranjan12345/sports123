function add_to_cart(pid, pname, pprice) {

	let cart = localStorage.getItem("cart");
	if (cart == null) {
	
		let products = [];
		let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: pprice}
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("Product is added for the first time.")
	
	} else {
		
		
	}
	
}