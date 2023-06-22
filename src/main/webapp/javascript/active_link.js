var $$ = document.querySelectorAll.bind(document);

var wrapper_product__ul = $$('.wrapper_product__ul-1 li')
var wrapper_product__list_product = $$('.wrapper_product__list_product-container')

let listProduct = $$('.wrapper_product__list_product-container')



var add_active = function () {
    wrapper_product__ul.forEach(function (item, index) {
        item.addEventListener("click", function () {
            wrapper_product__ul.forEach(function (item) {
                item.classList.remove('active_link')
            })
            let i = index;
            listProduct.forEach(function (item) {
                if (!(' ' + item.className + ' ').indexOf('disabled') > -1) {
                    item.classList.add('disabled')
                }
            })
            listProduct.forEach(function (item) {
                if (item.getAttribute('value') == i) {
                    item.classList.remove('disabled')
                }
            })
            this.classList.add('active_link')
        })
    })
}
add_active()







