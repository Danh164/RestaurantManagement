window.onload = function ()
{
    var x = location.href
    if (x.indexOf('page=') == -1) {
        $("#page1").css("background-color", "#f1af7f");
    } else {
        let page = x.substring(x.length - 1)
        document.getElementById("page" + page).style.backgroundColor = "#f1af7f"
    }

};
function previous() {
    var x = location.href
    let page = 1;
    if (x.indexOf('page=') != -1)
        page = Number(x.substring(x.length - 1))
    if (page > 1) {
        let url = x.slice(0, x.length - 1) + (page - 1).toString()
        window.location = url;
    }

}

function next(max) {
    if (max > 1) {
        var x = location.href
        let page = 1;
        if (x.indexOf('page=') == -1) {
            if (x.indexOf('?kw=') == -1) {
                let url = x + "?page=" + (page + 1);
                window.location = url;
            } else {
                let url = x + "&page=" + (page + 1);
                window.location = url;
            }
        } else {
            page = Number(x.substring(x.length - 1))
            if (page < max) {
                let url = x.slice(0, x.length - 1) + (page + 1)
                window.location = url;
            }
        }
    }

}

