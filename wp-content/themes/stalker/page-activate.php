<?php 
/*
Template Name: Страница активации
*/ ?>
	<?php get_header(); ?>
      <div class="row marketing">
	    <!-- start l-side template -->
	    <?php get_sidebar('l-side');?>
		<!-- end l-side template -->
		<!-- content block -->
        <div class="col-lg-6 padd-news">
		  <article <?php post_class('post'); ?> id="post-<?php the_ID(); ?>">
		    <header>
			  <h4><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h4>
			</header>
			<hr class="title">
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
			} ?>
			<hr class="sign">
		  </article> 
        </div>
		<!-- start r-side template -->
		<?php get_sidebar('r-side');?>
		<!-- end r-side template -->
      </div>
	  <!-- call footer template -->
	  <?php get_footer();?>