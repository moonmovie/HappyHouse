var imageSrc =
  "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
var imageSize = new kakao.maps.Size(24, 35);
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

const color = ["#2DF946", "#0010C0", "#C000B1", "#03FFFD", "#650000"];

window.addEventListener("DOMContentLoaded", () => {
  let lng = new URLSearchParams(location.search).get("lng");
  let lat = new URLSearchParams(location.search).get("lat");

  var mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

  var map = new kakao.maps.Map(mapContainer, mapOption);

  var coords = new kakao.maps.LatLng(lat, lng);
  marker = new kakao.maps.Marker({
    position: coords, // 마커의 위치
    image: markerImage,
  });
  marker.setMap(map);

  document.getElementById("loadsearch").addEventListener("click", () => {
    let address = document.getElementById("address").value;
    document.getElementById("top5").innerHTML = "";
    // document.getElementById("tbody").innerHTML = "";
    addresstoxy(lng, lat, address);
  });
});

function searchmapObj(SX, SY, EX, EY) {
  // let tbodycontent = document.getElementById("top5");
  let tbody = "";
  let top = document.getElementById("top5");

  $.ajax({
    type: "GET",
    url: `https://api.odsay.com/v1/api/searchPubTransPathT?apiKey=mUuLRBLLwsYwoKSIaAigC4%2B2hvI5jvgo98BH1v%2BfZIE&SX=${SX}&SY=${SY}&EX=${EX}&EY=${EY}&OPT=0`,

    success: function (res) {
      console.log("res ", res);
      let path = res.result.path;

      if (path.length == 0 || path == null) {
        tbody = "너무 가깝거나 길을 찾을 수 없습니다.";
      } else {
        tbody += `
            <thead>
                <tr>
                  <th ></th>
                  <th >총 소요시간</th>
                  <th >이용 교통편</th>
                  <th >총 환승 수</th>
                  <th >도보</th>
                </tr>
              </thead>
        `;
        let mintime = "";
        let numtime = 100000;
        let idx = path.length > 5 ? 5 : path.length;
        for (let i = 0; i < idx; i++) {
          let cur = path[i];
          let pathtype = "";
          let totalTime = "";
          let totalwalk = 0; //70m1분 예상
          let totaltrans = 0;

          if (cur.pathType == 1) {
            pathtype = "지하철";
          } else if (cur.pathType == 2) {
            pathtype = "버스";
          } else {
            pathtype = "버스, 지하철";
          }
          let time = cur.info.totalTime;

          totalTime =
            time > 59 ? Math.floor(time / 60) + "시" + (time % 60) + "분" : time + "분";
          if (time < numtime) {
            numtime = time;
            mintime = totalTime;
          }
          totalwalk = Math.ceil(cur.info.totalWalk / 70);
          totaltrans = cur.info.subwayTransitCount + cur.info.busTransitCount;

          tbody += `
                <tr onclick="searchHtoC('${SY}', '${SX}', '${
            cur.info.mapObj
          }', '${EY}', '${EX}')">
                  <td>${i + 1}</td>
                  <td>${totalTime}</td>
                  <td>${pathtype}</td>
                  <td>${totaltrans}</td>
                  <td>${totalwalk}분</td>
                </tr>
          `;
        }

        top.innerHTML = tbody;
        document.getElementById(
          "tabletitle"
        ).innerHTML = `가장 적은 시간은 ${mintime} 입니다.<br> 아래를 눌러 여러 경로를 확인해보세요.`;
      }
    },
  });
}

function addresstoxy(lng, lat, address) {
  var geocoder = new kakao.maps.services.Geocoder();
  let archeck = document.getElementById("archeck");
  // 주소로 좌표를 검색합니다
  geocoder.addressSearch(address, function (result, status) {
    // 정상적으로 검색이 완료됐으면
    if (status === kakao.maps.services.Status.OK) {
      console.log(lng, lat, result[0].y, result[0].x);
      searchmapObj(lng, lat, result[0].x, result[0].y);
      archeck.style.display = "none";

      //      let s=result;
      //      console.log(s);

      //    return s;
      //      console.log(result[0].y, result[0].x);
    } else {
      console.log(status);
      console.log("주소지를 재 확인해주세요.");
      archeck.style.display = "block";
    }
  });
}

function searchHtoC(lan, lat, mapObj, elan, elat) {
  var mapContainer = document.getElementById("map"); // 지도를 표시할 div
  mapOption = {
    center: new kakao.maps.LatLng(lan, lat), // 지도의 중심좌표
    level: 5, // 지도의 확대 레벨
  };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
  var markers = [];
  let markerstart = new kakao.maps.Marker({
    position: new kakao.maps.LatLng(lan, lat), // 마커의 위치
    image: markerImage,
  });
  markers.push(markerstart);
  let markerend = new kakao.maps.Marker({
    position: new kakao.maps.LatLng(elan, elat), // 마커의 위치
    image: markerImage,
  });
  markers.push(markerend);
  for (let i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }

  // var startContent = '<div style="font-color:#229954">출발지</div>';
  // var startPosition = new kakao.maps.LatLng(lan, lat);
  // var infowindow = new kakao.maps.InfoWindow({
  //   position: startContent,
  //   content: startPosition,
  // });
  // infowindow.open(map, markers[0]);
  // var endContent = '<div style="font-color:#229954">도착지</div>';
  // var endPosition = new kakao.maps.LatLng(elan, elat);
  // var infowindow = new kakao.maps.InfoWindow({
  //   position: endContent,
  //   content: endPosition,
  // });
  // infowindow.open(map, markers[1]);

  var mobj = mapObj.split("@");
  for (let i = 0; i < mobj.length; i++) {
    let linePath = [];
    setTimeout(function () {
      $.ajax({
        type: "get",
        url: `https://api.odsay.com/v1/api/loadLane?apiKey=mUuLRBLLwsYwoKSIaAigC4%2B2hvI5jvgo98BH1v%2BfZIE&lang=0&mapObject=0:0@${mobj[i]}`,
        success: function (res) {
          console.log("line ", res);
          let graphPos = res.result.lane[0].section[0].graphPos;
          graphPos.forEach((ele) => {
            linePath.push(new kakao.maps.LatLng(ele.y, ele.x));
          });
          var polyline = new kakao.maps.Polyline({
            path: linePath, // 선을 구성하는 좌표배열 입니다
            strokeWeight: 7, // 선의 두께 입니다
            strokeColor: color[i], // 선의 색깔입니다
            strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: "solid", // 선의 스타일입니다
          });
          polyline.setMap(map);
          // totalPath.push(linePath);
        },
      });
    }, 1000);
  }
}
