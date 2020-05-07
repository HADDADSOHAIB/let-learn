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
        // console.log(data);
        let messages = document.querySelector('.messages');
        let roomId = document.querySelector('.messages').dataset.roomId;
        if(!roomId) roomId=0;
        if(data.message.room_id == messages.dataset.roomId){
          document.querySelector('#new-message').value="";
          messages.insertAdjacentHTML('beforeend', data.body);
          scroll_bottom();
        }

        let allRooms = document.querySelector("#all-rooms");
        let room = document.querySelector(`#room-${data.message.room_id}`);
        if(allRooms){
          allRooms.removeChild(room);
          allRooms.insertAdjacentElement('afterbegin',room);
        }
        
        if(messages && document.querySelector(`#room-${data.message.room_id}`) 
          && roomId != data.message.room_id && room.querySelector('.badge')){
          room.querySelector('.badge').textContent = parseInt(room.querySelector('.badge').textContent ) + 1
        }
        else if(messages && document.querySelector(`#room-${data.message.room_id}`) 
          && roomId != data.message.room_id){
          room.insertAdjacentHTML('beforeend',"<span class='badge badge-primary'>1</span>")
        }
        update_unread();
      }
    });
  }
});
