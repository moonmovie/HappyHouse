function slipperarea(sido, gugun, dong, lat, lon) {
  // D마트,편의점 pharmacy약국 지하철,버스 P운동시설 Q카페 500미터 기준
  //200미터 이내 5점 300m 4점 400 3점 500 2점 그 외 1점
  //P Q D 약국 대중교통 순
  let slipperscore = [1, 1, 1, 1, 1];
  let datakey = ["P", "Q", "D", "pharmacy"];
  console.log(lat, lon);
  $.ajax({
    type: "GET",
    url: `https://api.odsay.com/v1/api/pointSearch?apiKey=mUuLRBLLwsYwoKSIaAigC4%2B2hvI5jvgo98BH1v%2BfZIE&y=${lat}&x=${lon}&radius=700&stationClass=2`,
    success: function (res) {
      // let count = res.result.count;
      // console.log("odsay " + count);
//      console.log(res);
      slipperscore[4] = 5;
    },
  });
  $.ajax({
    type: "GET",
    url: `/restapi/${sido}/${gugun}/${dong}/${lat}/${lon}`,
    success: function (res) {
      console.log(res);
      let meter = 0;
      for (let i = 0; i < 4; i++) {
        if (res[datakey[i]] != null) {
          meter = res[datakey[i]].mindis;
          if (meter <= 200) {
            slipperscore[i] = 5;
          } else if (meter <= 300) {
            slipperscore[i] = 4;
          } else if (meter <= 400) {
            slipperscore[i] = 3;
          } else if (meter <= 500) {
            slipperscore[i] = 2;
          }
        }
      }
      drawchart(slipperscore);
    },
  });

  //
}

function drawchart(dataarr) {
  let data = {
    labels: ["운동시설", "카페", "편의점/마트", "약국", "대중교통"],
    datasets: [
      {
        // label: "슬세권 수치",
        data: dataarr,
        backgroundColor: ["rgba(255, 99, 132, 0.2)"],
        borderColor: ["rgba(255, 99, 132, 1)"],
        borderWidth: 1,
      },
    ],
  };
  const config = {
    type: "radar",
    data: data,
    options: {
      legend: {
        display: false,
      },
      responsive: true,
      title: {
        display: true,
        text: "슬세권 수치",
      },

      scale: {
        ticks: {
          min: 0,
          max: 5,
          stepSize: 1,
        },
      },
    },
  };
  document.getElementById("chart").display = "";
  var myChart = new Chart(document.getElementById("myChart"), config);
}
