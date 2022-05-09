window.onload = function (){
    var x = location.href
    if (x.lastIndexOf("?") != -1) {
        var type = x.slice(x.lastIndexOf("=") + 1, x.length)
        setChecked(type)
    }
}

function setArrange(type) {
    var x = location.href
    if (x.lastIndexOf("?") != -1) {
        let url = x.slice(0, x.lastIndexOf("?")) + "?sort=" + type;
        window.location = url;
    }
    else {
        let url = x + "?sort=" + type;
        window.location = url;
    }
}

function setChecked(index) {
    if (index == "1"){
        document.getElementById("input-asc").checked = true;
    }
    else  if (index == "-1"){
        document.getElementById("input-desc").checked = true;
    }
    else 
        document.getElementById("input-def").checked = true;
}