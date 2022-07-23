const getButton = document.querySelector("#getBtn");
const youtubeUrl = document.querySelectorAll(".youtube-url");
const thumbnailWrap = document.querySelector(".thumbnail-wrap");
 
 
function getThum() {
   let thumArr = [];
   youtubeUrl.forEach(url => {
      if (url.value !== "") {
         let replaceUrl = url.value;
         let finUrl = '';
         replaceUrl = replaceUrl.replace("https://youtu.be/", '');
         replaceUrl = replaceUrl.replace("https://www.youtube.com/embed/", '');
         replaceUrl = replaceUrl.replace("https://www.youtube.com/watch?v=", '');
         finUrl = replaceUrl.split('&')[0];
         thumArr.push(finUrl);
      }
   });
   thumArr.forEach(thum => {
      let img = document.createElement("img");
      img.setAttribute("src", `https://img.youtube.com/vi/${thum}/mqdefault.jpg`)
      thumbnailWrap.appendChild(img);
   });
   
};
   getButton.addEventListener('click', getThum);
