var onPushNotification = function(callback){
  var pusher = new Pusher('c5a68e12c11e711af325');
  var id = document.URL.split('i_doubt_it/')[1];
  if (id) {
    var channel = pusher.subscribe(id);
    channel.bind('reload_page', callback);
  }
}