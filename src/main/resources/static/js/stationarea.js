let subwayStation = 0;
let busStation = 0;

function stationarea(lat, lon) {
  $.ajax({
    type: "GET",
    url: `https://api.odsay.com/v1/api/pointSearch?apiKey=mUuLRBLLwsYwoKSIaAigC4%2B2hvI5jvgo98BH1v%2BfZIE&y=${lat}&x=${lon}&radius=800&stationClass=2`,
    success: function (res) {
      subwayStation = res.result.count;
      let stationss = res.result.station;
      console.log("subway ", subwayStation);
      busstop(lat, lon);
    },
  });
}

function busstop(lat, lon) {
  $.ajax({
    type: "GET",
    url: `https://api.odsay.com/v1/api/pointSearch?apiKey=mUuLRBLLwsYwoKSIaAigC4%2B2hvI5jvgo98BH1v%2BfZIE&y=${lat}&x=${lon}&radius=800&stationClass=1`,
    success: function (res) {
      busStation = res.result.count;
      let stations = res.result.station;
      console.log("bus ", busStation);
      console.log(subwayStation, busStation);
      drawStationinfo(subwayStation, busStation);
    },
  });
}

function drawStationinfo(subway, bus) {
  console.log("info", subway, bus);
  let data = {
    labels: ["지하철", "버스"],
    datasets: [
      {
        label: "도보 10분 내 대중교통",
        data: [subway, bus],
        backgroundColor: ["rgba(255, 99, 132, 0.2)", "rgba(244, 208, 63, 0.2)"],
        borderColor: ["rgba(255, 99, 132, 1)", "rgba(244, 208, 63, 1)"],
         borderWidth: 1,
      },
    ],
  };

  const config = {
    type: "horizontalBar",
    data: data,
    options: {
      legend: {
        display: false,
      },
      responsive: true,
      title: {
        display: true,
        text: `역세권 수치`,
      },
    },
    tooltips: {
      mode: "index",
      intersect: false,
    },
    hover: {
      mode: "nearest",
      intersect: true,
    },
  };

  var stationChart = new Chart(document.getElementById("stationChart"), config);
}
