window.addEventListener("DOMContentLoaded", () => {
  const dong = searchParam("dong");
  const lng = searchParam("lng");
  const lat = searchParam("lat");
  const apt = searchParam("apt");

  searchAddrFromCoords(lng, lat);
  housedeal(apt, dong);
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
