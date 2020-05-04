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
//= require bootstrap-sprockets
//= require bootstrap
//= require popper
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function(ev){
  let links=document.querySelectorAll('.sidenav-link');
  links.forEach(link => {
    link.className = `opacity-half list-group-item list-group-item-action sidenav-link ${link.href.split('/')[3] === window.location.pathname.slice(1) ? "active" : ""}`;
  });
});

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
});

let actionsf={};
let actionsu={};

