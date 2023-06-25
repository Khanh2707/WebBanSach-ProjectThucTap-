const plus = document.querySelector(".quantity_box-up");
const minus = document.querySelector(".quantity_box-down");
const num = document.querySelector(".quantity_box-num");

let a = 1;

plus.addEventListener("click", () => {
	a++;
	a = (a < 10) ? "0" + a : a;
	num.value = a;
})

minus.addEventListener("click", () => {
	if (a > 1) {
		a--;
		a = (a < 10) ? "0" + a : a;
		num.value = a;
	}
})