addEventListener("direct-upload:initialize", function(event){
  var target = event.target;
  var detail = event.detail;
  var id = detail.id;
  var file = detail.file;
  target.insertAdjacentHTML("beforebegin", `
    <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
      <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
      <span class="direct-upload__filename"></span>
    </div>
  `);
  target.previousElementSibling.querySelector(`.direct-upload__filename`).textContent = file.name;
});

addEventListener("direct-upload:start", function(event){
  var id = event.detail.id;
  var element = document.getElementById(`direct-upload-${id}`);
  element.classList.remove("direct-upload--pending");
});

addEventListener("direct-upload:progress", function(event){
  var id = event.detail.id;
  var progress = event.detail.progress;
  var progressElement = document.getElementById(`direct-upload-progress-${id}`);
  progressElement.style.width = `${progress}%`;
});

addEventListener("direct-upload:error",function(event){
  event.preventDefault();
  var id = event.detail.id;
  var error = event.detail.error;
  var element = document.getElementById(`direct-upload-${id}`);
  element.classList.add("direct-upload--error");
  element.setAttribute("title", error);
});

addEventListener("direct-upload:end",function(event){
  var id = event.detail.id;
  var element = document.getElementById(`direct-upload-${id}`);
  element.classList.add("direct-upload--complete");
});