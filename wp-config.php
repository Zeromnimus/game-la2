<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define('DB_NAME', 'gamela2stalker');

/** Имя пользователя MySQL */
define('DB_USER', 'gamela2stalker');

/** Пароль к базе данных MySQL */
define('DB_PASSWORD', 'mSFcNZuvht2LxMsS');

/** Имя сервера MySQL */
define('DB_HOST', 'localhost');

/** Кодировка базы данных для создания таблиц. */
define('DB_CHARSET', 'utf8');

/** Схема сопоставления. Не меняйте, если не уверены. */
define('DB_COLLATE', '');

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '$@&4f=Y_5|t,hJ:<T=h]^e)F8?U&<%S@IL|*tL>K)XIdzbT|K|nK`M%Fb-?LmN Y');
define('SECURE_AUTH_KEY',  'tHL|/zW}_|S4VgN(l8*1QX!P|G0{l=.P]Wd>cas,)`8^:S-M|zI@K(YC4J2AwRE2');
define('LOGGED_IN_KEY',    '.a}yfv |RbS]}[<-q{+k&u~Zo|AXr:t[5CqbKL5[YG0lFb@po%MR!8<plt8NTU)t');
define('NONCE_KEY',        'I:T_/@HPi_RXm!k-zKo0>FGY7N-!|_m-;?naf-_)iA:EiPnx?t$=Hx^ltA9ilg#s');
define('AUTH_SALT',        '1;}C`DF|F~6,e[<Wm:[-7k.ZkDG$|A/bL8 !^r+Y0D@G8n%$*9oh=a5#9tjnu7Pd');
define('SECURE_AUTH_SALT', ')f#l[*yP+H)[Zs$SvJe%F)(<g83lzvnaA%#lkj`1~NNzJZ*qS7_aH5XRt})t 9T/');
define('LOGGED_IN_SALT',   'G!-} mRg[z7s5,+.ui%i3}Ap[SAUh|+-KnHE}gwTl<aw?G^kf@BGC;R.fvE3M0|&');
define('NONCE_SALT',       ')aG1MM4XjV#[4UgTPw%Fk-N+v;$-;)~+u?BdzQ<^br+sJ2+#fF?YT/WzY-oyY(1R');

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix  = 'la2_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 * 
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Инициализирует переменные WordPress и подключает файлы. */
require_once(ABSPATH . 'wp-settings.php');
