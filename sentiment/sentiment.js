google.charts.load('current', { packages: ['corechart', 'line'] });
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

    var sentiments = [-130.70000000000002, 131.2, 66.50000000000001, -70.4, -24.799999999999997, 158.20000000000005, -10.6, 113.3, -106.80000000000001, -127.79999999999995, 108.9, 80.80000000000001, 31.30000000000004, 30.80000000000004, 95.2, 51.2, -67.5, -5.500000000000002, -37.599999999999994, -107.1, -202.70000000000002, 10.000000000000025, 288.09999999999997, -48.0, 547.9999999999994, 565.1, 539.3, 576.4999999999999, 494.69999999999993, 29.200000000000017, -46.1];

    var data = new google.visualization.DataTable();
    data.addColumn('datetime', 'Time');
    data.addColumn('number', 'Sentiment');

    sentiments.forEach((sentiment, index) => {
        data.addRow([new Date(2017, 7, 15, 19, index * 5), sentiment]);
    });

    var options = {
        hAxis: {
            title: 'Time'
        },
        vAxis: {
            title: 'Sentiment'
        },
        curveType: 'function',
        legend: {position: 'none'}
    };

    function placeMarker(dataTable) {
        var cli = this.getChartLayoutInterface();
        var chartArea = cli.getChartAreaBoundingBox();
        // Position first injury
        document.querySelector('.overlay-1').style.top = Math.floor(cli.getYLocation(dataTable.getValue(8, 1))) - 15 + "px";
        document.querySelector('.overlay-1').style.left = Math.floor(cli.getXLocation(new Date(2017, 7, 15, 19, 40))) - 15 + "px";
        // Position second injury
        document.querySelector('.overlay-2').style.top = Math.floor(cli.getYLocation(dataTable.getValue(19, 1))) - 15 + "px";
        document.querySelector('.overlay-2').style.left = Math.floor(cli.getXLocation(new Date(2017, 7, 15, 19, 95))) - 15 + "px";
        // Position goal
        document.querySelector('.overlay-3').style.top = Math.floor(cli.getYLocation(dataTable.getValue(24, 1))) - 15 + "px";
        document.querySelector('.overlay-3').style.left = Math.floor(cli.getXLocation(new Date(2017, 7, 15, 19, 120))) - 15 + "px";
      };

    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    google.visualization.events.addListener(chart, 'ready',
        placeMarker.bind(chart, data));

    chart.draw(data, options);
}
