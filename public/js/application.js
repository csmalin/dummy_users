$(document).ready(function(){

  $('.postform').submit(function(e) {
    e.preventDefault();
    
    var send_data = $(this).serialize();
    
    /* ajaxify */
    $.post('/signup', send_data).done(function(returned_data) {
      returned_data = JSON.parse(returned_data);
      console.log("Fuck!!!");
    $data = array(
    'username' => $username,
    'email' => $email,
    'password' => sha1($password),
    'password_again' => sha1($password_again)
);
    console.log($data);

      
      
     });
  });
});
