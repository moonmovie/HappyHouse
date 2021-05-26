window.addEventListener("DOMContentLoaded", () => {
  let hotdiv = document.getElementById("hlike");
  let htmlin = ` <div class="owl-carousel testimonials-carousel">`;
  $.ajax({
    type: "GET",
    url: "/code/hotlike",
    success: function (res) {
      console.log(res);
      res.forEach((ele) => {
        htmlin += `
      <div class="testimonial-item">
                
        <img
          src="/img/apt/apt3.jpg"
          class="testimonial-img"
          alt=""
        />
        <h3>John Larson</h3>
        <h4>Entrepreneur</h4>
      </div>
          `;
      });
    
//      htmlin+= `</div>`;
      hotdiv.innerHTML=htmlin;
      console.log(htmlin);
    },
  });
});

function link(lng, lat, apt, dong) {
  location.href = `/detail?lng=${lng}&lat=${lat}&apt=${encodeURIComponent(
    apt
  )}&dong=${encodeURIComponent(dong)}`;
}
{/* <div class="testimonial-item" onclick="link(${ele.lng},${ele.lat},${ele.aptName},${ele.dong})">
          
          <img src="/img${ele.img}" class="testimonial-img" alt="" />
          
          
      </div> */}
{/* <h3>서울 ${ele.dong} ${ele.jibun}</h3>
                <h3>${ele.aptName}</h3>
                <h4>완공년도 | ${ele.buildYear}</h4> */}