$(document).ready(function () {
    $(".body__slide_banner").slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
        arrows: false,
        fade: true,
        draggable: false,
        pauseOnHover: false,
        pauseOnFocus: false,
        speed: 1500,
    });
});

$(document).ready(function () {
    $(".wrapper_post").slick({
        arrows: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        draggable: false,
        infinite: false,
        dots: true,
        prevArrow: "<button type='button' class='slick-prev pull-left'><i class='fa-solid fa-angle-left'></i></button>",
        nextArrow: "<button type='button' class='slick-next pull-right'><i class='fa-solid fa-angle-right'></i></button>",
    });
});