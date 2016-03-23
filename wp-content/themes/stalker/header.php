<!DOCTYPE html>
<html <?php language_attributes(); ?>>
  <head>
    <meta charset="<?php bloginfo( 'charset' ); ?>" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo wp_get_document_title(); ?></title>

    <!-- Bootstrap -->
    <link href="<?php echo get_template_directory_uri(); ?>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<?php echo get_template_directory_uri(); ?>/css/stalker.css" rel="stylesheet">
	<link rel="shortcut icon" href="<?php get_site_url(); ?>/favicon.ico" type="image/x-icon">

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
		<div class="costume"></div>
	  </div>
	  <!-- start head-menu -->
	  <?php wp_nav_menu( array( 'theme_location' => 'header-menu', 'container_class' => 'main-menu' ) ); ?>
	  <!-- end head-menu -->
	  <div class="row">
	    <div class="col-lg-12 wings">
		<!-- крылья сайта -->
		</div>		
	  </div>