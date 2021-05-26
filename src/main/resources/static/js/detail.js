window.addEventListener("DOMContentLoaded", () => {
  const dong = searchParam("dong");
  const lng = searchParam("lng");
  const lat = searchParam("lat");
  const aptName = searchParam("apt");
  let div = document.getElementById("wish");

  $.ajax({
    type: "GET",
    url: `/wish/check/${aptName}`,
    success: function (res) {
      div.innerHTML = "";
      console.log(res);
      if (res == 2) {
        div.innerHTML += `<i class="ri-heart-line" id="regist_${aptName}" style="display:block;"></i>`;
        div.innerHTML += `<i class="ri-heart-fill" id="delete_${aptName}" style="display:none;"></i>`;
      } else if (res == 3) {
        div.innerHTML += `<i class="ri-heart-fill" id="delete_${aptName}" style="display:block;"></i>`;
        div.innerHTML += `<i class="ri-heart-line" id="regist_${aptName}" style="display:none;"></i>`;
      }
    },
  });

  $(document).on("click", "#regist_" + aptName, function () {
    $.ajax({
      type: "GET",
      url: `/wish/regist/${aptName}`,
      success: function () {
        console.log("버튼이?");
        document.getElementById("regist_" + aptName).style.display = "none";
        document.getElementById("delete_" + aptName).style.display = "block";
      },
    });
  });

  $(document).on("click", "#delete_" + aptName, function () {
    $.ajax({
      type: "DELETE",
      url: `/wish/delete/${aptName}`,
      success: function () {
        console.log("버튼이?");
        document.getElementById("delete_" + aptName).style.display = "none";
        document.getElementById("regist_" + aptName).style.display = "block";
      },
    });
  });

  searchAddrFromCoords(lng, lat);
  housedeal(aptName, dong);
});

function searchParam(key) {
  return new URLSearchParams(location.search).get(key);
}
function searchAddrFromCoords(lng, lat) {
  var geocoder = new kakao.maps.services.Geocoder();
  // 좌표로 행정동 주소 정보를 요청합니다
  geocoder.coord2Address(lng, lat, function (result, status) {
    if (status === kakao.maps.services.Status.OK) {
      console.log("callback ", result);
      var detailAddr = !!result[0].road_address
        ? "<div>도로명주소 | " + result[0].road_address.address_name + "</div>"
        : "";
      detailAddr +=
        "<div>지번 주소 | " + result[0].address.address_name + "</div>";
      console.log(detailAddr);
      document.getElementById("addressdetail").innerHTML += detailAddr;
    }
  });
}

function housedeal(aptname, dong) {
  let Name = document.getElementsByClassName("dcontent");
  let list = document.getElementById("deallist");
  list.innerHTML = "";
  let inhtml = "";
  $.ajax({
    type: "POST",
    url: "/code/housedeal",
    contentType: "application/json;charset=utf-8",
    data: JSON.stringify({
      name: aptname,
      dong: dong,
    }),
    dataType: "json",
    success: function (res) {
      Name[0].innerHTML = res[0].aptName;
      let totalprice = 0;
      console.log(res);
      inhtml += `
      <tr>
            <th>층</th>
            <th>면적</th>
            <th>매물가</th>          
            <th>판매 날짜</th>
          </tr>
      <tbody>
      `;
      res.forEach((ele) => {
        let price = ele.dealAmount.trim().replace(",", "");
        totalprice += price * 1;
        price += "0000";
        price *= 1;

        inhtml += `
        <tr no="${ele.no}">
            <td>${ele.floor}</td>
            <td>${ele.area}m<sup>2</sup></td>
            <td>${price}</td>              
            <td>${ele.dealYear}.${ele.dealMonth}.${ele.dealDay}</td>
        `;
      });
      console.log(totalprice);
      let avg = totalprice / res.length;
      avg += "";
      Name[1].innerHTML =
        avg.length > 4
          ? avg.substring(0, avg.length - 4) +
            "억" +
            avg.substring(avg.length - 4, avg.length) +
            "만원"
          : avg.substring(avg.length - 4, avg.length) + "만원";
      inhtml += `</tbody>`;
      list.innerHTML = inhtml;
    },
  });
}
