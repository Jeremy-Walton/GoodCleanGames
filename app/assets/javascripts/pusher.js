if ($(".Idoubtit")[0]) {
  var pusher = new Pusher('c5a68e12c11e711af325');
  var id = document.URL.split('/')[4];
  // console.log(id);
  var channel = pusher.subscribe(id);
  channel.bind('reload_page', function(data) {
    location.reload();
  });
}
