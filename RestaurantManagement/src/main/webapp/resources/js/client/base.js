window.onscroll = function() {
    scrollFunction();
    scrollBTTFunction();
};

function scrollFunction() {
    var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
    var height = document.documentElement.clientHeight - document.body.clientHeight;

    var scrolled = (winScroll / height) * 100;
    document.getElementById("myBar").style.width = scrolled + "%";
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        document.getElementById("header-nav").style.position = "fixed"
        document.getElementById("header-nav").style.zIndex = "10000"
        document.getElementById("header-nav").style.width = "100%"
    }
    else {
        document.getElementById("header-nav").style.position = "initial";
    }
}

function scrollBTTFunction() {
    if (document.body.scrollTop > 250 || document.documentElement.scrollTop > 250) {
        document.getElementById("back-to-top").style.display = "block";
    } else {
        document.getElementById("back-to-top").style.display = "none";
    }
}

// scroll to the top
function topFunction(){
//    $("html, body").animate({scrollTop: 0}, 1000);
    window.scrollTo({ top: 0, behavior: 'auto' });
}
