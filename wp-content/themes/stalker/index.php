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
			<?php while ( have_posts() ) : the_post(); ?>

			  <article <?php post_class('post'); ?> id="post-<?php the_ID(); ?>">
				<header>
				  <h4><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h4>
				</header>
				<hr class="title">
				<figure>
				  <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail( 'full-thumbnail', array( 'class' => 'thumbnail' ) ); ?></a>
				</figure>
				<?php the_content(); ?>
				<hr class="sign">
				<span>Отправлено: <time datetime="<?php the_date();?>"><?php the_date();?> в <?php the_time();?></time> от <?php the_author();?></span>
			  </article> 
			  <?php endwhile; ?>
			  <?php if (function_exists('oriolo_pagination')) oriolo_pagination(); else posts_nav_link();?>
        </div>
		<!-- start r-side template -->
		<?php get_sidebar('r-side');?>
		<!-- end r-side template -->
      </div>
	  <!-- call footer template -->
	  <?php get_footer();?>