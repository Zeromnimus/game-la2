<?php

/*
  Plugin Name: CoRegistration
  Plugin URI: http://www.1-byte.ru
  Description: Ajax Register User Form
  Version: 1.0
  Author: Andrew Zeromnimus Johns
  Author URI: http://www.opendg.ru
 */
?>
<?php 
function Co_Registration_function() {
?>
<?php if (is_user_logged_in()) { // если юзер залогинен, форму показывать не будем ?>
<p>Вы уже зарегистрированы.</p>
<?php } else { // если не залогинен, покажем форму ?>
<form name="registrationform form-horizontal" id="registrationform" method="post" class="userform" role="form" action=""> 

	<div class="form-group">
		<label class="control-label col-sm-5" for="user_login">Логин</label>
			<div class="col-sm-6">
				<input type="text" name="user_login" id="user_login" placeholder="Логин">
			</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-5" for="user_email">Email</label>
			<div class="col-sm-6">
				<input type="email" name="user_email" id="user_email" placeholder="Email">
			</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-5" for="pass1">Пароль</label>
			<div class="col-sm-6">
				<input type="password" name="pass1" id="pass1" placeholder="Пароль">
			</div>
	</div>	

	<div class="form-group">
		<label class="control-label col-sm-5" for="pass2">Повторите пароль</label>
			<div class="col-sm-6">
				<input type="password" name="pass2" id="pass2" placeholder="Повторите пароль">
			</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-5" for="first_name">Имя</label>
			<div class="col-sm-6">
				<input type="text" name="first_name" id="first_name" placeholder="Имя">
			</div>
	</div>

	<div class="form-group">
		<label class="control-label col-sm-5" for="last_name">Фамилия</label>
			<div class="col-sm-6">
				<input type="text" name="last_name" id="last_name" placeholder="Фамилия">
			</div>
	</div>	
	
	<div class="form-group">
		<label for="avatar" class="control-label col-sm-5 custom-file-upload">Аватар:</label>
			<div class="col-sm-6">
			<p><?php echo get_avatar($current_user->ID,64);?></p>
			<input type="file" name="avatar" id="avatar">
	</div>
	</div>	
	<div class="form-group"> 
		<div class="col-sm-offset-5 col-sm-6">
			<input type="submit" value="Зарегистрироваться"> <!-- субмит -->
		</div>
	</div>	

	<input type="hidden" name="redirect_to" value="<?php echo $_SERVER['REQUEST_URI']; ?>"> <!-- куда отправим юзера если все прошло ок, в нашем случае это не понадобиться, а вообще может если форма сквозная -->
	<input type="hidden" name="nonce" value="<?php echo wp_create_nonce('register_me_nonce'); ?>"> <!-- поле со строкой безопасности, будем проверять её в обработчике чтобы убедиться, что форма отправлена откуда надо -->
	<input type="hidden" name="action" value="register_me"> <!-- обязательное поле, по нему запустится нужная функция -->
	<div class="response"></div> <!-- ну сюда будем пихать ответ от сервера -->
</form>
<?php } } ?>
<?php 
// Register a new shortcode: [cr_Co_Registration]
add_shortcode('cr_Co_Registration', 'Co_Registration_shortcode');

// The callback function that will replace [book]
function Co_Registration_shortcode() {
    ob_start();
    Co_Registration_function();
    return ob_get_clean();
}
?>