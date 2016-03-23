<?php 
/*
Template Name: Запрос данных для восстановления пароля
*/ 
?>
	<?php get_header(); ?>
      <div class="row marketing">
	    <!-- start l-side template -->
	    <?php get_sidebar('l-side');?>
		<!-- end l-side template -->
		<!-- content block -->
        <div class="col-lg-6 padd-news">
			  
			<?php if (is_user_logged_in()) { // если юзер залогинен, то менять ему ничего не надо ?>
			
			  <article <?php post_class('post'); ?> id="post-<?php the_ID(); ?>">
				<header>
				  <h4><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h4>
				</header>
				<hr class="title">
					<p>Вы авторизованы.</p>
				<hr class="sign">
			  </article> 
				<script type="text/javascript" defer>
					   window.setTimeout('document.location.href= "<?php echo get_site_url(); ?>"', 5000);
				</script>
			<?php } else { // если не залогинен, покажем форму для логина
			global $current_user; // заглобалим переменную с объектом данных текущего пользователя 
			?>
			  <article <?php post_class('post'); ?> id="post-<?php the_ID(); ?>">
				<header>
				  <h4><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h4>
				</header>
				<hr class="title">
					<form name="lostpasswordform" id="lostpasswordform" method="post" class="userform">
						<input type="text" name="user_login" placeholder="Ваш логин или email">
						<input type="submit" value="Сбросить">
						<input type="hidden" name="redirect_to" value="/"> <!-- можно не заполнять если редирект не нужен -->
						<input type="hidden" name="nonce" value="<?php echo wp_create_nonce('lost_password'); ?>">
						<input type="hidden" name="action" value="lost_password">
						<div class="response"></div>
					</form>
				<hr class="sign">
			  </article> 					
			<?php } ?>
        </div>
		<!-- start r-side template -->
		<?php get_sidebar('r-side');?>
		<!-- end r-side template -->
      </div>
	  <!-- call footer template -->
	  <?php get_footer();?>