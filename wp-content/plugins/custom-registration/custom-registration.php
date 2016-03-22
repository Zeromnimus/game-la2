<?php

/*
  Plugin Name: Custom Registration
  Plugin URI: http://code.tutsplus.com
  Description: Updates user rating based on number of posts.
  Version: 1.0
  Author: Agbonghama Collins
  Author URI: http://tech4sky.com
 */

function custom_registration_function() {
    if (isset($_POST['submit'])) {
        registration_validation(
        $_POST['username'],
        $_POST['password'],
        $_POST['email'],
        $_POST['website'],
        $_POST['fname'],
        $_POST['lname'],
        $_POST['nickname'],
        $_POST['bio'],
		$_POST['agree']
		);
		
		// sanitize user form input
        global $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio, $agree;
        $username	= 	sanitize_user($_POST['username']);
        $password 	= 	esc_attr($_POST['password']);
        $email 		= 	sanitize_email($_POST['email']);
        $website 	= 	esc_url($_POST['website']);
        $first_name = 	sanitize_text_field($_POST['fname']);
        $last_name 	= 	sanitize_text_field($_POST['lname']);
        $nickname 	= 	sanitize_text_field($_POST['nickname']);
        $bio 		= 	esc_textarea($_POST['bio']);
		

		// call @function complete_registration to create the user
		// only when no WP_error is found
        complete_registration(
        $username,
        $password,
        $email,
        $website,
        $first_name,
        $last_name,
        $nickname,
        $bio,
		$agree
		);
    }

    registration_form(
    	$username,
        $password,
        $email,
        $website,
        $first_name,
        $last_name,
        $nickname,
        $bio,
		$agree
		);
}

function registration_form( $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio, $agree ) {
    echo '
    <style>
	form.register { padding:5px; margin: 5px auto; }
	form.register > ul > li > input, form.register > ul > li > textarea { float: right; padding-right: 25%; }
	
	ul.register > li > textarea { margin-bottom: 10px; }
	ul.register { line-height:1.5em; list-style-type: none; }
	ul.register li { 
		margin: 10px 0px;
		border-bottom: 1px solid #e4e4e4;
		border-bottom-style: dashed;
		padding-bottom: 5px;		
	}
	
	ul.register li:nth-last-child(3) { border: none; margin-bottom: 50px;}
	
	ul.register li:last-child { margin: 10px 0px 10px 0px; border: none;}
	
	input[type = "checkbox"] { width: 15px; height: 15px; cursor: crosshair; }
	
	ul.register li:last-child > input { margin-bottom: 10px; }
	
	ul.register > li > input, ul.register > li > textarea {
	  background: #47505C;
	  text-indent: 4px;
	  border: 1px solid #999;
	  border-radius: 3px;
	  box-shadow: 0 0 1px 1px rgba(0,0,0,0);
	  transition: .17s linear;
	}
	ul.register > li > input:focus, ul.register > li > textarea:focus {
	  outline: none;
	  box-shadow: 0 0 1px 1px #4d90f0;
	}
	ul.register > li > input:focus::-moz-placeholder, ul.register > li > textarea:focus::-moz-placeholder {
	  color: transparent;
	}
	ul.register > li >input:focus::-webkit-input-placeholder, ul.register > li > textarea:focus::-webkit-input-placeholder {
	  color: transparent;
	}
	
	strong.red-txt, .error-str { color:red; }
	</style>
	';

    echo '
    <form class="register" action="' . $_SERVER['REQUEST_URI'] . '" method="post">
	<ul class="register">
	<li>
	<label for="username">Логин <strong class="red-txt">*</strong></label>
	<input type="text" name="username" value="' . (isset($_POST['username']) ? $username : null) . '" required>
	</li>
	
	<li>
	<label for="password">Пароль <strong class="red-txt">*</strong></label>
	<input type="password" name="password" value="' . (isset($_POST['password']) ? $password : null) . '" required>
	</li>
	
	<li>
	<label for="email">Email <strong class="red-txt">*</strong></label>
	<input type="text" name="email" value="' . (isset($_POST['email']) ? $email : null) . '" required>
	</li>
	
	<li>
	<label for="website">Сайт</label>
	<input type="text" name="website" value="' . (isset($_POST['website']) ? $website : null) . '">
	</li>
	
	<li>
	<label for="fname">Имя</label>
	<input type="text" name="fname" value="' . (isset($_POST['fname']) ? $first_name : null) . '">
	</li>
	
	<li>
	<label for="lname">Фамилия</label>
	<input type="text" name="lname" value="' . (isset($_POST['lname']) ? $last_name : null) . '">
	</li>
	
	<li>
	<label for="nickname">Ник</label>
	<input type="text" name="nickname" value="' . (isset($_POST['nickname']) ? $nickname : null) . '">
	</li>
	
	<li>
	<label for="bio">О себе</label>
	<textarea name="bio" rows="3" cols="30">' . (isset($_POST['bio']) ? $bio : null) . '</textarea>
	</li>
	
	<li>
	<input type="checkbox" name="agree" value="' . (isset($_POST['agree']) ? $nickname : null) . '" require> Я принимаю условия <a href="' . get_site_url() . '/rules/">Cоглашения</a> и обязуюсь выполнять правила сервиса.
	</li>
	
	<li>
	<input type="submit" name="submit" value="Отправить"/>
	</li>
	</ul>
	</form>
	';
}

function registration_validation( $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio, $agree )  {
    global $reg_errors;
    $reg_errors = new WP_Error;

    if ( empty( $username ) || empty( $password ) || empty( $email ) ) {
        $reg_errors->add('field', 'Необходимые поля формы отсутствует');
    }

    if ( strlen( $username ) < 4 ) {
        $reg_errors->add('username_length', 'Логин слишком короткий. Необходимо минимум 4 символа.');
    }

    if ( username_exists( $username ) )
        $reg_errors->add('user_name', 'Простите, но такой логин существует!');

    if ( !validate_username( $username ) ) {
        $reg_errors->add('username_invalid', 'Простите, но логин указан неверно.');
    }

    if ( strlen( $password ) < 5 ) {
        $reg_errors->add('password', 'Длина пароля д.б. больше 5 символов.');
    }

    if ( !is_email( $email ) ) {
        $reg_errors->add('email_invalid', 'Email введен неверно.');
    }

    if ( email_exists( $email ) ) {
        $reg_errors->add('email', 'Такой Email уже используется.');
    }
    
    if ( !empty( $website ) ) {
        if ( !filter_var($website, FILTER_VALIDATE_URL) ) {
            $reg_errors->add('website', 'Для вебсайта введен неверный URL.');
        }
    }
	
	if ( is_null( $agree ) ) {
		$reg_errors->add('agree', 'Пожалуйста, прочтите <a href="' . get_site_url() . '/rules/">Cоглашение</a> и подтвердите.');
	}

    if ( is_wp_error( $reg_errors ) ) {

        foreach ( $reg_errors->get_error_messages() as $error ) {
            echo '<div class="error-str">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            echo '<strong>ОШИБКА</strong>:';
            echo $error . '<br/>';

            echo '</div>';
        }
    }
}

function complete_registration() {
    global $reg_errors, $username, $password, $email, $website, $first_name, $last_name, $nickname, $bio, $agree;
    if ( count($reg_errors->get_error_messages()) < 1 ) {
        $userdata = array(
        'user_login'	=> 	$username,
        'user_email' 	=> 	$email,
        'user_pass' 	=> 	$password,
        'user_url' 		=> 	$website,
        'first_name' 	=> 	$first_name,
        'last_name' 	=> 	$last_name,
        'nickname' 		=> 	$nickname,
        'description' 	=> 	$bio,
		'agree'			=>  $agree,
		);
        $user = wp_insert_user( $userdata );
        echo 'Регистрация завершена. Перейдите на <a href="' . get_site_url() . '/wp-login.php">страницу входа</a>.';   
	}
}

// Register a new shortcode: [cr_custom_registration]
add_shortcode('cr_custom_registration', 'custom_registration_shortcode');

// The callback function that will replace [book]
function custom_registration_shortcode() {
    ob_start();
    custom_registration_function();
    return ob_get_clean();
}
