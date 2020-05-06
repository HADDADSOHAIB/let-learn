// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require bootstrap

//= require turbolinks
//= require_tree .

scroll_bottom = function(){
  if($('.messages').length > 0)
  $('.messages').scrollTop($('.messages')[0].scrollHeight);
};

update_unread = function(){
  let messages = document.querySelector('.messages');
  let roomId = 0;
  if(document.querySelector('.messages')){
    roomId = document.querySelector('.messages').dataset.roomId;
  }
  if( messages && roomId && document.querySelector(`#room-${roomId}`)){
    jQuery.ajax({
      url: "/reset_unread",
      type: "GET",
      data: {room_id: roomId},
      dataType: "json",
      success: function(data){
        if(document.querySelector(`#room-${roomId} .badge`))
        document.querySelector(`#room-${roomId}`).removeChild(document.querySelector(`#room-${roomId} .badge`));
      }
    });
  }
}

$(document).on('turbolinks:load', function(ev){
  let links=document.querySelectorAll('.sidenav-link');
  links.forEach(link => {
    link.className = `opacity-half list-group-item list-group-item-action sidenav-link ${link.href.split('/')[3] === window.location.pathname.slice(1) ? "active" : ""}`;
  });
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });

  if($("#thought_text")){
    $("#thought_text").keyup(function(){
      $("#info-thought").text(`${(250 - $(this).val().length)}/250`);
    });
  }

  scroll_bottom();
  update_unread();
});



let actionsf={};
let actionsu={};

