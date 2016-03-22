<?php
add_action('wp_print_scripts','include_scripts'); // повесим функцию на событие вывода скриптов
function include_scripts(){
    wp_enqueue_script('jquery'); // добавим в скрипты jQuery
    wp_enqueue_script('jquery-form'); // добавим в скрипты плагин jQuery forms
    wp_enqueue_script('for_users', get_template_directory_uri() . '/js/for_users.js', array('jquery-form')); // добавим скрипт обработки форм
    wp_localize_script( 'jquery', 'ajax_var', // добавим объект с глобальными JS переменными
	array( 
	    'url' => admin_url('admin-ajax.php'), // и сунем в него путь до AJAX обработчика
	)
    );
}

add_action('wp_ajax_nopriv_login_me', 'login_me'); // повесим функцию на аякс запрос с параметром action=login_user для неавторизованых пользователей
//add_action('wp_ajax_login_me', 'login_me'); // повесим функцию на аякс запрос с параметром action=login_user для авторизованых пользователей, будет логичнее этого не делать, т.к. логинется залогиненому не надо =/
function login_me(){
	require_once dirname(__FILE__) . '/login.php'; // тут подключим файл с обработкой действий при логине (лежит в той же папке что и route.php)
}

//add_action('wp_ajax_nopriv_logout_me', 'logout_me'); // повесим функцию на аякс запрос с параметром action=login_user для неавторизованых пользователей, тоже без смысла
add_action('wp_ajax_logout_me', 'logout_me'); // повесим функцию на аякс запрос с параметром action=logout_me для авторизованых пользователей
function logout_me() { // logout
   require_once dirname(__FILE__) . '/logout.php';  // подключим нужный обработчик
}
// хук для регистрации 
add_action('wp_ajax_nopriv_register_me', 'register_me'); // повесим функцию на аякс запрос с параметром action=register_me для неавторизованых пользователей
function register_me() { // внутри функции подключаем нужный файл с обработкой
    require_once dirname(__FILE__) . '/register.php';  
}

function set_html_content_type() { // эта ф-я пригодится нам чтоб слать письма в формате html
	return 'text/html';
}