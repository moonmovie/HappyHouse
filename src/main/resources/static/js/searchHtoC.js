var imageSrc =
  "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
var imageSize = new kakao.maps.Size(24, 35);
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

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
    addresstoxy(lng, lat, address);
  });
});

function searchmapObj(SX, SY, EX, EY) {
  let infodiv = document.getElementsByClassName("searchinfo");
  $.ajax({
    type: "GET",
    url: `https://api.odsay.com/v1/api/searchPubTransPathT?apiKey=mUuLRBLLwsYwoKSIaAigC4%2B2hvI5jvgo98BH1v%2BfZIE&SX=${SX}&SY=${SY}&EX=${EX}&EY=${EY}&OPT=0`,

    success: function (response) {
      console.log(response);
      infodiv[0].innerHTML = `최적 경로 총 소요 시간 : ${response.result.path[0].info.totalTime}`;
      searchHtoC(SY, SX, response.result.path[0].info.mapObj, EY, EX);
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
  var linePath = [];

  $.ajax({
    type: "get",
    url: `https://api.odsay.com/v1/api/loadLane?apiKey=mUuLRBLLwsYwoKSIaAigC4%2B2hvI5jvgo98BH1v%2BfZIE&lang=0&mapObject=0:0@${mapObj}`,
    success: function (res) {
      console.log(res);

      let graphPos = res.result.lane[0].section[0].graphPos;
      graphPos.forEach((ele) => {
        linePath.push(new kakao.maps.LatLng(ele.y, ele.x));
      });
      // 지도에 표시할 선을 생성합니다
      var polyline = new kakao.maps.Polyline({
        path: linePath, // 선을 구성하는 좌표배열 입니다
        strokeWeight: 7, // 선의 두께 입니다
        strokeColor: "#2DF946", // 선의 색깔입니다
        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: "solid", // 선의 스타일입니다
      });
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

      // 지도에 선을 표시합니다
      polyline.setMap(map);
      console.log(markers);
      for (let i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
      }
    },
  });
}
