let root = "";
var imageSrc =
  "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
var imageSize = new kakao.maps.Size(24, 35);
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
$(document).ready(function () {
  let s = document.getElementById("sido");
  let g = document.getElementById("gugun");
  let d = document.getElementById("dong");

  let sidotag = "";
  let guguntag = "";
  let dongtag = "";
  $.ajax({
    type: "get",
    url: root + "/code/load",
    success: function (res) {
      console.log(res);
      let sido = res.sidolist;
      let gugun = res.gugunlist;
      let dong = res.donglist;
      console.log(sido);
      console.log(gugun);
      console.log(dong);
      sido.forEach((ele) => {
        sidotag += `<option value="${ele.sido_code}" name="${ele.sido_code}">${ele.sido_name}</option>`;
      });
      s.innerHTML = sidotag;

      gugun.forEach((ele) => {
        guguntag += `<option value="${ele.gugun_code}" name="${ele.gugun_code}">${ele.gugun_name}</option>`;
      });
      g.innerHTML = guguntag;

      dong.forEach((ele) => {
        if (ele.dong == "숭인동") {
          dongtag += `<option value="${ele.dongcode}" name="${ele.dongcode}" selected>${ele.dong}</option>`;
        } else {
          dongtag += `<option value="${ele.dongcode}" name="${ele.dongcode}">${ele.dong}</option>`;
        }
      });
      d.innerHTML = dongtag;
    },
  });
  $.ajax({
    type: "GET",
    url: root + "/code/load/info/" + "숭인동",
    success: function (res) {
      console.log(res);

      let arr = [];
      res.forEach((ele, idx) => {
        arr[idx] = {
          title: ele.aptName,
          lat: ele.lat,
          lng: ele.lng,
        };
      });
      drowmap(arr, 3, indexmap);
    },
  });

  //  document.getElementById("dong").addEventListener("change",()=>{
  //	    $.ajax({
  //	      type: "post",
  //	      url: "/HappyHouse_FrontEnd/address?act=wish&dong=" + d.value,
  //	      success: function (res) {
  //	    	  console.log(res);
  //	    	  let btn=document.getElementById("wish_btn");
  //	        if(res==1){
  //	          btn.classList.remove("btn-warning");
  //	          btn.classList.add("btn-secondary");
  //	          btn.classList.add("nonwish");
  //	          btn.textContent="관심지역해제";
  //	        }else{
  //	          btn.classList.remove("btn-secondary");
  //	          btn.classList.add("btn-warning");
  //	          btn.classList.add("wish");
  //	          btn.textContent="관심지역등록";
  //	        }
  //	      }
  //
  //	   });
  //
  //	});

  /*  document.getElementById("wish_btn").addEventListener("click",()=>{
	  let str = document.getElementById("wish_btn").textContent;
	  let res="";
	  if(str=="관심지역등록"){
		  res=1;
	  }else{
		  res=0;
	  }
	    $.ajax({
	      type: "post",
	      url: "/HappyHouse_FrontEnd/address?act=wish&dong=" + d.value+"&wish="+res,
	      success: function (res) { //1을 보내면 등록이었던거 2를 보내면 해제를 보내던거
	    	  if(res==1){
		          let btn=document.getElementById("wish_btn");
		          btn.classList.remove("btn-warning");
		          btn.classList.add("btn-secondary");
		          btn.classList.add("nonwish");
		          btn.textContent="관심지역해제";
		        }else{
		          let btn=document.getElementById("wish_btn");
		          btn.classList.remove("btn-secondary");
		          btn.classList.add("btn-warning");
		          btn.classList.add("wish");
		          btn.textContent="관심지역등록";
		       }
	      }
	   });
  });*/

  g.addEventListener("change", () => {
    let gu = "";
    for (let i = 0; i < g.options.length; i++) {
      if (g.options[i].selected == true) {
        gu = g.options[i].value;
      }
    }
    let dongtag = "";
    $.ajax({
      type: "get",
      url: root + "/code/load/" + gu,
      success: function (res) {
        let dong = res;
        dong.forEach((ele) => {
          dongtag += `<option>${ele.dong}</option>`;
        });
        d.innerHTML = dongtag;
      },
    });
  });

  document.getElementById("btn_search").addEventListener("click", () => {
    let dong = "";
    document.getElementById("about1").style.display = "none";
    document.getElementById("about").style.display = "";
    document.getElementById("deallist").innerHTML = "";
    for (let i = 0; i < d.options.length; i++) {
      if (d.options[i].selected == true) {
        dong = d.options[i].textContent;
      }
    }
    dongdeallist(dong, 1);
  });
});

function dongdeallist(dong, cur) {
  let ul = document.getElementById("ul_list");
  let g = document.getElementById("gugun");
  $.ajax({
    type: "GET",
    url: `/code/house/${dong}/${cur}`,
    success: function (res) {
      let map = document.getElementById("mapsec");
      document.getElementById("paging").innerHTML = "";
      ul.innerHTML = "";
      let inner = "";
      let position = [];
      if (res.list.length == 0) {
        let address = "";
        for (let i = 0; i < g.options.length; i++) {
          if (g.options[i].selected == true) {
            address = g.options[i].textContent;
            break;
          }
        }
        address += " " + dong;

        ul.innerHTML = "매물 정보가 없습니다.";
        addressmap(address, map);
      } else {
        let i = 0;
        res.list.forEach((ele, idx) => {
          console.log(ele);

          position[idx] = {
            title: ele.aptName,
            lat: ele.lat,
            lng: ele.lng,
          };
          let li = document.createElement("li");
          li.setAttribute("class", "list-group-item");
          li.innerHTML += `매물정보 : ${ele.aptName}<br>`;
          li.innerHTML += `건축년도 : ${ele.buildYear}`;
          ul.appendChild(li);
          li.addEventListener("click", () => {
            let arr = [];
            arr[0] = position[idx];
            drowmap(arr, 3, map);
            housedeal(ele.aptName, dong);
          });
        });
        let listli = document.createElement("li");
        listli.setAttribute("class", "list-group-item");
        //        listli.innerHTML = "목록보기";
        listli.addEventListener("click", () => {
          dongdeallist(dong);
        });
        ul.appendChild(listli);
        drowmap(position, 5, map);
        // 총페이지수, 한페이지당 목록 수, 현재 페이지
        pagination(res.total, res.perpage, cur, dong);
      }
    },
  });
}
function drowmap(position, num, map) {
  var mapContainer = map, // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(position[0].lat, position[0].lng), // 지도의 중심좌표
      level: num, // 지도의 확대 레벨
    };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  for (let i = 0; i < position.length; i++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      map: map, // 마커를 표시할 지도
      position: new kakao.maps.LatLng(position[i].lat, position[i].lng), // 마커를 표시할 위치
      title: position[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
      image: markerImage, // 마커 이미지
    });
  }
}

function housedeal(aptname, dong) {
  let list = document.getElementById("deallist");
  list.innerHTML = "";
  let inhtml = "";
  $.ajax({
    type: "POST",
    url: root + "/code/housedeal",
    contentType: "application/json;charset=utf-8",
    data: JSON.stringify({
      name: aptname,
      dong: dong,
    }),
    dataType: "json",
    success: function (res) {
      console.log(res);
      inhtml += `
    <tr>
					<th>매물이름</th>
					<th>면적</th>
					<th>매물가</th>
          <th>판매 날짜</th></th>
          <th>층</th>
          <th>지번</th>
		</tr>
    <tbody>
    `;
      res.forEach((ele) => {
        inhtml += `
      <tr no="${ele.no}">
					<td>${ele.aptName}</td>
					<td>${ele.area}</td>
					<td>${ele.dealAmount.trim()}</td>
          <td>${ele.dealYear}.${ele.dealMonth}.${ele.dealDay}</td>
          <td>${ele.floor}</td>
          <td>${ele.jibun}</td>
			</tr>
      `;
      });
      inhtml += `</tbody>`;
      list.innerHTML = inhtml;
    },
  });
}

function addressmap(address, map) {
  var mapContainer = map, // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level: 2, // 지도의 확대 레벨
    };

  // 지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 주소-좌표 변환 객체를 생성합니다
  var geocoder = new kakao.maps.services.Geocoder();

  // 주소로 좌표를 검색합니다
  geocoder.addressSearch(address, function (result, status) {
    // 정상적으로 검색이 완료됐으면
    if (status === kakao.maps.services.Status.OK) {
      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords);
    }
  });
}
