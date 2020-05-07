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
        let messages = document.querySelector('.messages');
        let roomId = 0;
        if(messages){
          roomId = document.querySelector('.messages').dataset.roomId;
        }
        if(!roomId) roomId=0;
        if(messages && data.message.room_id == messages.dataset.roomId){
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

        let current_user_id = document.querySelector('#current_user').dataset.id;
        let all_messages = document.querySelector('#all-messages');
        if(current_user_id && data.message.user_id != current_user_id && !all_messages.querySelector('.badge')
          && roomId != data.message.room_id){
          all_messages.insertAdjacentHTML('beforeend',"<span class='badge badge-warning ml-2'>1</span>")
        }
        else if(current_user_id && data.message.user_id != current_user_id && roomId != data.message.room_id){
          all_messages.querySelector('.badge').textContent = parseInt(all_messages.querySelector('.badge').textContent ) + 1;
        }

        if(messages && data.message.room_id == messages.dataset.roomId && current_user_id == data.message.user_id){
          document.querySelector('#new-message').value="";
        }

        update_unread();
      }
    });
  }
});
