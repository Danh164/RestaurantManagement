let listCountry = {}
window.onload = function () {
    fetch("https://provinces.open-api.vn/api/?depth=2")
        .then(res => res.json())
        .then(data => {
            listCountry = data
            setCountry(data)
            setDistrictsDefault()
        })
}

function setCountry(data) {
    let options = ``
    for (let c = 0; c < data.length; c++) {
        options += `<option id='${data[c].codename}' >${data[c].name}</option>`
    }
    document.getElementById('city').insertAdjacentHTML('beforeend', options)

}

function setDistrictsDefault() {
    $("#district option[class='flag']").remove();
    let district = listCountry[0].districts
    let options = ``
    if (district != null)
        for (let i = 0; i < district.length; i++) {
            options += `<option class="flag">${district[i].name}</option>`
        }
    document.getElementById('district').insertAdjacentHTML('beforeend', options)
}

function setDistricts() {
    $("#district option[class='flag']").remove();
    let district = getCountryDataByValue()
    let options = ``
    if (district != null)
        for (let i = 0; i < district.length; i++) {
            options += `<option class="flag">${district[i].name}</option>`
        }
    document.getElementById('district').insertAdjacentHTML('beforeend', options)
}

function getCountryDataByValue() {
    for (let i = 0; i < listCountry.length; i++) {
        if (document.getElementById('city').value == listCountry[i].name)
            return listCountry[i].districts
    }
    return null
}

//ghi dè bass
window.onscroll = function() {
    var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
    var height = document.documentElement.clientHeight - document.body.clientHeight;

    var scrolled = (winScroll / height) * 100;
    document.getElementById("myBar").style.width = scrolled + "%";
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        document.getElementById("header-nav").style.position = "fixed"
        document.getElementById("header-nav").style.zIndex = "10000"
        document.getElementById("header-nav").style.width = "100%"
        document.getElementById("header-nav").style.marginTop = "-30px"
    }
    else {
        document.getElementById("header-nav").style.position = "initial";
        document.getElementById("header-nav").style.marginTop = "0px"
    }
}



