// 총페이지수, 한페이지당 목록 수, 현재 페이지
function pagination(total, per, current, dong) {
  let pagegroup = Math.ceil(current / per);
  let respage = Math.ceil(total / per);
  let each = per;
  let pagenaion = document.getElementById("paging");
  pagenaion.innerHTML = "";
  let i;
  let htmlIn = "";
  if (pagegroup == 1) {
    htmlIn += `<li class="page-item pre disabled"><a class="page-link"><<</a></li>`;
  } else {
    htmlIn += `<li class="page-item"><a class="page-link" idx="${
      pagegroup * per - per
    }"><<</a></li>`;
  }
  if (respage <= per) {
    each = respage;
  }
  for (i = (pagegroup - 1) * per + 1; i < pagegroup + each; i++) {
    if (i == current) {
      htmlIn += `<li class="page-item active"><a class="page-link" idx="${i}">${i}</a></li>`;
    } else {
      htmlIn += `<li class="page-item"><a class="page-link" idx="${i}">${i}</a></li>`;
    }
  }
  if (pagegroup == respage || respage <= per) {
    htmlIn += `<li class="page-item disabled"><a class="page-link">>></a></li>`;
  } else {
    htmlIn += `<li class="page-item next"><a class="page-link" idx="${
      i + 1
    }">>></a></li>`;
  }
  pagenaion.innerHTML = htmlIn;

  let atag = document.getElementsByClassName("page-link");

  for (let j = 0; j < atag.length; j++) {
    atag[j].addEventListener("click", () => {
      dongdeallist(dong, atag[j].getAttribute("idx"));
    });
  }
}
