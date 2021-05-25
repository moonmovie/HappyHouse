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
    let dong = d.options[d.selectedIndex].text;
    let sido = s.options[s.selectedIndex].text;
    document.getElementById("about1").style.display = "none";
    document.getElementById("about").style.display = "";
    document.getElementById("deallist").innerHTML = "";

    dongdeallist(dong, 1, d.value, sido);
  });
});

function dongdeallist(dong, cur, dongcode, sido) {
  let ul = document.getElementById("ul_list");
  let g = document.getElementById("gugun");
  let gvalue = g.options[g.selectedIndex].text;
  $.ajax({
    type: "GET",
    url: `/code/house/${dong}/${cur}`,
    success: function (res) {
      let map = document.getElementById("mapsec");
      document.getElementById("paging").innerHTML = "";
      ul.innerHTML = "";
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
        res.list.forEach((ele, idx) => {
          console.log(ele);

          position[idx] = {
            title: ele.aptName,
            lat: ele.lat,
            lng: ele.lng,
          };
          let li = document.createElement("li");
          li.setAttribute("class", "list-group-item");
          li.innerHTML = `매물정보 : ${ele.aptName}<br>`;
          li.innerHTML += `건축년도 : ${ele.buildYear}<br>`;
          li.innerHTML += `<a href="/detail?lng=${ele.lng}&lat=${
              ele.lat
            }&apt=${encodeURIComponent(ele.aptName)}&dong=${encodeURIComponent(
              dong
            )}">상세보기</a>`;

          $.ajax({
            type: "GET",
            url: `/wish/check/${ele.aptName}`,
            success: function (res) {
              console.log(res);
              if (res == 2) {
                li.innerHTML += `<i class="ri-heart-line" id="regist_${ele.aptName}" style="display:block;"></i>`;
                li.innerHTML += `<i class="ri-heart-fill" id="delete_${ele.aptName}" style="display:none;"></i>`;
              } else if (res == 3) {
                li.innerHTML += `<i class="ri-heart-fill" id="delete_${ele.aptName}" style="display:block;"></i>`;
                li.innerHTML += `<i class="ri-heart-line" id="regist_${ele.aptName}" style="display:none;"></i>`;
              }
            },
          });

          ul.appendChild(li);

          $(document).on("click", "#regist_" + ele.aptName, function () {
            $.ajax({
              type: "GET",
              url: `/wish/regist/${ele.aptName}`,
              success: function () {
                console.log("버튼이?")
                document.getElementById('regist_' + ele.aptName).style.display = 'none';
                document.getElementById('delete_' + ele.aptName).style.display = 'block';
              }
            });
          });

          $(document).on("click", "#delete_" + ele.aptName, function () {
            $.ajax({
              type: "DELETE",
              url: `/wish/delete/${ele.aptName}`,
              success: function () {
                console.log("버튼이?")
                document.getElementById('delete_' + ele.aptName).style.display = 'none';
                document.getElementById('regist_' + ele.aptName).style.display = 'block';
                }
            });
          });
  
          li.addEventListener("click", () => {
            let arr = [];
            arr[0] = position[idx];
            drowmap(arr, 3, map);
            // housedeal(ele.aptName, dong);
            slipperarea(sido, gvalue, dongcode, ele.lat, ele.lng);
            stationarea(ele.lat, ele.lng);
            //            searchAddrFromCoords(ele.lng, ele.lat);
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
  // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
  var placeOverlay = new kakao.maps.CustomOverlay({ zIndex: 1 }),
    contentNode = document.createElement("div"), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
    markers = [], // 마커를 담을 배열입니다
    currCategory = ""; // 현재 선택된 카테고리를 가지고 있을 변수입니다

  var mapContainer = map, // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(position[0].lat, position[0].lng), // 지도의 중심좌표
      level: num, // 지도의 확대 레벨
    };

  var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  // 장소 검색 객체를 생성합니다
  var ps = new kakao.maps.services.Places(map);

  // 지도에 idle 이벤트를 등록합니다
  kakao.maps.event.addListener(map, "idle", searchPlaces);

  // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다
  contentNode.className = "placeinfo_wrap";

  // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
  // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다
  addEventHandle(contentNode, "mousedown", kakao.maps.event.preventMap);
  addEventHandle(contentNode, "touchstart", kakao.maps.event.preventMap);

  // 커스텀 오버레이 컨텐츠를 설정합니다
  placeOverlay.setContent(contentNode);

  // 각 카테고리에 클릭 이벤트를 등록합니다
  addCategoryClickEvent();

  // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
  function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
      target.addEventListener(type, callback);
    } else {
      target.attachEvent("on" + type, callback);
    }
  }

  // 카테고리 검색을 요청하는 함수입니다
  function searchPlaces() {
    if (!currCategory) {
      return;
    }

    // 커스텀 오버레이를 숨깁니다
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    ps.categorySearch(currCategory, placesSearchCB, { useMapBounds: true });
  }

  // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
  function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
      // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
      displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
      // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
    } else if (status === kakao.maps.services.Status.ERROR) {
      // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
    }
  }

  // 지도에 마커를 표출하는 함수입니다
  function displayPlaces(places) {
    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document
      .getElementById(currCategory)
      .getAttribute("data-order");

    for (var i = 0; i < places.length; i++) {
      // 마커를 생성하고 지도에 표시합니다
      var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
      
      // 마커와 검색결과 항목을 클릭 했을 때
      // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
      (function (marker, place) {
        kakao.maps.event.addListener(marker, "click", function () {
          displayPlaceInfo(place);
        });
      })(marker, places[i]);
    }
  }

  for (let i = 0; i < position.length; i++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      map: map, // 마커를 표시할 지도
      position: new kakao.maps.LatLng(position[i].lat, position[i].lng), // 마커를 표시할 위치
      title: position[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
      image: markerImage, // 마커 이미지
    });
  }

  // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
  function addMarker(position, order) {
    var imageSrc =
        "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png", // 마커 이미지 url, 스프라이트 이미지를 씁니다
      imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
      imgOptions = {
        spriteSize: new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
        spriteOrigin: new kakao.maps.Point(46, order * 36), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
        offset: new kakao.maps.Point(11, 28), // 마커 좌표에 일치시킬 이미지 내에서의 좌표
      },
      markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
      marker = new kakao.maps.Marker({
        position: position, // 마커의 위치
        image: markerImage,
      });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker); // 배열에 생성된 마커를 추가합니다

    return marker;
  }

  // 지도 위에 표시되고 있는 마커를 모두 제거합니다
  function removeMarker() {
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    markers = [];
  }

  // 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
  function displayPlaceInfo(place) {
    var content =
      '<div class="placeinfo">' +
      '   <a class="title" href="' +
      place.place_url +
      '" target="_blank" title="' +
      place.place_name +
      '">' +
      place.place_name +
      "</a>";

    if (place.road_address_name) {
      content +=
        '    <span title="' +
        place.road_address_name +
        '">' +
        place.road_address_name +
        "</span>" +
        '  <span class="jibun" title="' +
        place.address_name +
        '">(지번 : ' +
        place.address_name +
        ")</span>";
    } else {
      content +=
        '    <span title="' +
        place.address_name +
        '">' +
        place.address_name +
        "</span>";
    }

    content +=
      '    <span class="tel">' +
      place.phone +
      "</span>" +
      "</div>" +
      '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);
  }

  // 각 카테고리에 클릭 이벤트를 등록합니다
  function addCategoryClickEvent() {
    var category = document.getElementById("category"),
      children = category.children;

    for (var i = 0; i < children.length; i++) {
      children[i].onclick = onClickCategory;
    }
  }

  // 카테고리를 클릭했을 때 호출되는 함수입니다
  function onClickCategory() {
    var id = this.id,
      className = this.className;

    placeOverlay.setMap(null);

    if (className === "on") {
      currCategory = "";
      changeCategoryClass();
      removeMarker();
    } else {
      currCategory = id;

      changeCategoryClass(this);
      searchPlaces();
    }
  }

  // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
  function changeCategoryClass(el) {
    var category = document.getElementById("category"),
      children = category.children,
      i;

    for (i = 0; i < children.length; i++) {
      children[i].className = "";
    }

    if (el) {
      el.className = "on";
    }
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

//function searchAddrFromCoords(lng, lat) {
//  var geocoder = new kakao.maps.services.Geocoder();
//  // 좌표로 행정동 주소 정보를 요청합니다
//  geocoder.coord2Address(lng, lat, function (result, status) {
//    if (status === kakao.maps.services.Status.OK) {
//      console.log("callback ", result);
//      var detailAddr = !!result[0].road_address
//        ? "<div>도로명주소 : " + result[0].road_address.address_name + "</div>"
//        : "";
//      detailAddr +=
//        "<div>지번 주소 : " + result[0].address.address_name + "</div>";
//      console.log(detailAddr);
//      //      document.getElementById("addressdetail").innerHTML = detailAddr;
//    }
//  });
//}
