<?php 
/*
Template Name: Activate Users Page
*/ ?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
  <head>
    <meta charset="<?php bloginfo( 'charset' ); ?>" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php wp_title( '|', true, 'right' ); ?>
</title>

    <!-- Bootstrap -->
    <link href="<?php echo get_template_directory_uri(); ?>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<?php echo get_template_directory_uri(); ?>/css/stalker.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<?php wp_head(); ?>
  </head>
  <body <?php body_class(); ?>>
    <div class="container" id="col-center">
      <div class="header">
		<div class="logo"></div>
	  </div>
	  <!-- start head-menu -->
	  <?php wp_nav_menu( array( 'theme_location' => 'header-menu', 'container_class' => 'main-menu' ) ); ?>
	  <!-- end head-menu -->
	  <div class="row">
	    <div class="col-lg-12 wings">
		<!-- крылья сайта -->
		</div>		
	  </div>
      <div class="row marketing">
	    <!-- start l-side template -->
	    <?php get_sidebar('l-side');?>
		<!-- end l-side template -->
		<!-- content block -->
        <div class="col-lg-6 padd-news">
			<?php 
			  
			if (is_user_logged_in()) { // если юзер залогинен, значит уже активирован ?>
			<p>Вы уже активированы.</p>
			<?php } else { // если не залогинен

				$user_id = isset($_GET['user']) ? (int)$_GET['user'] : ''; // возьмем юзер ид
				$key = isset($_GET['key']) ? $_GET['key'] : ''; // возьмем случайную строку
				if (!$user_id || !$key) { // если чего то из этого нет
					echo '<p>Не переданы параметры активации.</p>'; // напишем ошибку
				} else {
					$code = get_user_meta( $user_id, 'has_to_be_activated', true ); // получаем случайную строку по ид юзера
					if ( $code == $key ) { // и сравниваем её с переданной строкой и если все ок
						delete_user_meta( $user_id, 'has_to_be_activated' ); // удаляем эту строку у юзера
						echo '<p>Активация прошла успешно. Теперь вы можете войти.</p>'; // пишем что все ок
					} else {
						echo '<p>Данные активации не верны или вы уже активированы.</p>'; // если строки не совпали
					}
				}
			} 

			?>
        </div>
		<!-- start r-side template -->
		<?php get_sidebar('r-side');?>
		<!-- end r-side template -->
      </div>
	  <!-- call footer template -->
	  <?php get_footer();?>