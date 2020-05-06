$(document).on('turbolinks:load', function(ev){
  App.chat = App.cable.subscriptions.create("ChatChannel",
  {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      
      if(data.message.room_id == document.querySelector('.messages').dataset.roomId){
        document.querySelector('#new-message').value="";
        document.querySelector('.messages').insertAdjacentHTML('beforeend', data.body);
        scroll_bottom();
      }

      
    }
  });
});