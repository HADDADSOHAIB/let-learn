$(document).on('turbolinks:load', function(ev){
  if(!App.chat){
    App.chat = App.cable.subscriptions.create("ChatChannel",
    {
      connected() {
        // Called when the subscription is ready for use on the server
      },
    
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
    
      received(data) {
        console.log(data);
        if(data.message.room_id == document.querySelector('.messages').dataset.roomId){
          document.querySelector('#new-message').value="";
          document.querySelector('.messages').insertAdjacentHTML('beforeend', data.body);
          scroll_bottom();
        }

        let allRooms = document.querySelector("#all-rooms");
        let room = document.querySelector(`#room-${data.message.room_id}`);
        allRooms.removeChild(room);
        allRooms.insertAdjacentElement('afterbegin',room);

        if(room.querySelector('.badge')){
          room.querySelector('.badge').textContent = parseInt(room.querySelector('.badge').textContent ) + 1
        }
        else{
          room.insertAdjacentHTML('beforeend',"<span class='badge badge-primary'>1</span>")
        }
      }
    });
  }
});