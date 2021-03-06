	<?php get_header(); ?>
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
				<?php if ( !is_page( 'register' ) ) { ?>
				<span>Отправлено: <time datetime="<?php the_date();?>"><?php the_date();?> в <?php the_time();?></time> от <?php the_author();?></span>
				<?php } ?>
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