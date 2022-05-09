function generateColor() {
    let r = parseInt(Math.random() * 255);
    let g = parseInt(Math.random() * 255);
    let b = parseInt(Math.random() * 255);
    return `rgb(${r}, ${g}, ${b})`;
}

function billQuarterChart(id, billLabels = [], billInfo = []) {
    let colors = [];
    for (let i = 0; i < billLabels.length; i++)
        colors.push(generateColor());

    const data = {
        labels: billLabels,
        datasets: [{
                label: "Thống kê theo quý",
                data: billInfo,
                backgroundColor: colors,
                hoverOffset: 10
            }]
    };

    const config = {
        type: "doughnut",
        data: data,
        options: {}
    };

    let ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, config);
}

function billMonthChart(id, billLabels = [], billInfo = []) {
    let colors = [];
    for (let i = 0; i < billLabels.length; i++)
        colors.push(generateColor());

    const data = {
        labels: billLabels,
        datasets: [{
                label: "Thống kê theo tháng",
                data: billInfo,
                backgroundColor: colors,
                borderColor: 'rgb(0, 0, 0)',
                borderWidth: 1
            }]
    };

    const config = {
        type: "bar",
        data: data,
        options: {}
    };

    let ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, config);
}

function billYearChart(id, billLabels = [], billInfo = []) {
    let colors = [];
    for (let i = 0; i < billLabels.length; i++)
        colors.push(generateColor());

    const data = {
        labels: billLabels,
        datasets: [{
                label: "Thống kê theo năm",
                data: billInfo,
                backgroundColor: colors,
                borderColor: 'rgb(0, 0, 0)',
                borderWidth: 1
            }]
    };

    const config = {
        type: "polarArea",
        data: data,
        options: {}
    };

    let ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, config);
}

function billDateStats(id, billLabels = [], billInfo = []) {
    let colors = [];
    for (let i = 0; i < billLabels.length; i++)
        colors.push(generateColor());

    const data = {
        labels: billLabels,
        datasets: [{
                label: "Thống kê theo ngày",
                data: billInfo,
                backgroundColor: generateColor(),
                borderColor: generateColor(),
                fill: false,
                tension: 0.3,
                borderWidth: 10
            }]
    };

    const config = {
        type: "line",
        data: data,
        options: {}
    };

    let ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, config);
}