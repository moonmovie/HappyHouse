function category(lat, lon) {
  // D마트,편의점 pharmacy약국 지하철,버스 P운동시설 Q카페 500미터 기준
  //200미터 이내 5점 300m 4점 400 3점 500 2점 그 외 1점
  //P Q D 약국 대중교통 순

  // let categorysearch = (key) => {
  //   return new Promise((resolve, reject) => {
  //     places.categorySearch(
  //       key,
  //       function (result, status) {
  //         if (status === kakao.maps.services.Status.OK) {
  //           resolve(result);
  //         } else {
  //           reject(status);
  //         }
  //       },
  //       {
  //         location: new kakao.maps.LatLng(lat, lon),
  //         radius: 200,
  //         sort: "distance",
  //       }
  //     );
  //   });
  // };

  // let callb = function (result, status) {
  //   if (status === kakao.maps.services.Status.OK) {
  //     resolve(result);
  //   } else {
  //     reject(status);
  //   }
  // };
  // let check = (result) => {
  //   let len = 0;
  //   if (result == null) {
  //     slipperscore.push(0);
  //   } else {
  //     len = result.length;
  //     if (len > 10) {
  //       slipperscore.push(10);
  //     } else {
  //       slipperscore.push(len);
  //     }
  //   }

  //   max = max < len ? len : max;
  // };

  // async () => {
  //   try {
  //     for (let i = 0; i < datakey.length; i++) {
  //       let res = await categorysearch(datakey[i]);
  //       console.log("res ", res);
  //       check(res);
  //     }
  //     drawchart(slipperscore, max);
  //   } catch (e) {
  //     console.log(e);
  //   }
  // };
  // var callback = function (result, status) {
  //   time++;
  //   if (status === kakao.maps.services.Status.OK) {
  //     let len = result.length;
  //     if (result == null) {
  //       slipperscore.push(0);
  //     } else {
  //       // console.log("category ", slipperscore);
  //       slipperscore.push(len);
  //       max = max < len ? len : max;
  //     }
  //   } else {
  //     slipperscore.push(0);
  //   }
  //   if (time == 4) {
  //     console.log("max ", max);
  //     drawchart(slipperscore, max);
  //   }
  // };

  let slipperscore = [];
  let dd = [0, 0, 0, 0, 0];
  let max = 0;
  //편의점, 대형마트, 카페, 은행, 병원
  let datakey = ["CS2", "MT1", "CE7", "BK9", "HP8"];

  var places = new kakao.maps.services.Places();
  let time = 0;

  var callback = function (result, status) {
    time++;
    if (status === kakao.maps.services.Status.OK) {
      if (result == null) {
      } else {
        let temp = {
          code: result[0].category_group_code,
          len: result.length,
        };
        slipperscore.push(temp);
      }
    } else {
    }
    if (time == 5) {
      console.log("time ", time);
      console.log("sliper ", slipperscore);
      for (let i = 0; i < slipperscore.length; i++) {
        let code = slipperscore[i].code;
        let len = slipperscore[i].len;
        len = len > 10 ? 10 : len;
        if (code == "CS2") {
          dd[0] = len;
        } else if (code == "MT1") {
          dd[1] = len;
        } else if (code == "CE7") {
          dd[2] = len;
        } else if (code == "BK9") {
          dd[3] = len;
        } else {
          dd[4] = len;
        }
      }
      drawchart(dd, 10);
    }
  };

  for (let i = 0; i < 5; i++) {
    if (i == 1) {
      places.categorySearch(datakey[i], callback, {
        location: new kakao.maps.LatLng(lat, lon),
        radius: 500,
        sort: "distance",
      });
    } else {
      places.categorySearch(datakey[i], callback, {
        location: new kakao.maps.LatLng(lat, lon),
        radius: 200,
        sort: "distance",
      });
    }
  }
  // drawchart(dd, 5);
}

function drawchart(dataarr, maxdata) {
  let data = {
    labels: ["편의점", "대형마트", "카페", "약국", "병원"],
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
      responsive: false,
      title: {
        display: true,
        text: "슬세권 수치",
      },

      scale: {
        ticks: {
          min: 0,
          max: maxdata,
          stepSize: 1,
        },
      },
    },
  };
  document.getElementById("chart").display = "";
  var myChart = new Chart(document.getElementById("myChart"), config);
}
