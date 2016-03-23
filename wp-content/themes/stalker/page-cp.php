<?php 
/*
Template Name: Страница профиля
*/ 
?>
	<?php get_header(); ?>
      <div class="row marketing">
	    <!-- start l-side template -->
	    <?php get_sidebar('l-side');?>
		<!-- end l-side template -->
		<!-- content block -->
        <div class="col-lg-6 padd-news">
			  
			<?php if (!is_user_logged_in()) { // если юзер не залогинен, форму показывать не будем ?>
			
			  <article <?php post_class('post'); ?> id="post-<?php the_ID(); ?>">
				<header>
				  <h4><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h4>
				</header>
				<hr class="title">
				<p>У вас нет доступа к этой странице.</p>
				<hr class="sign">
			  </article> 
				<script type="text/javascript" defer>
					   window.setTimeout('document.location.href= "<?php echo get_site_url(); ?>"', 5000);
				</script>
			<?php } else { // если залогинен, показываем страницу профиля 
			global $current_user; // заглобалим переменную с объектом данных текущего пользователя 
			?>
			  <article <?php post_class('post'); ?> id="post-<?php the_ID(); ?>">
				<header>
				  <h4><a href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h4>
				</header>
				<hr class="title">			
					<p>Добро пожаловать : <?php echo $current_user->user_login; ?></p>
					<form name="profileform" id="profileform" method="post" class="userform form-horizontal" role="form" action=""> <!-- обратите внимание на класс, по этому классу на форму вешается обработка из первой статьи -->

						<div class="form-group">
						  <label class="control-label col-sm-5" for="user_email">Email</label>
						  <div class="col-sm-6">
							<input type="email" name="user_email" id="user_email" placeholder="Email" value="<?php echo $current_user->user_email; ?>" required><!-- ну тут всякие обычные поля -->
						  </div>
					    </div>
						
						<div class="form-group">
						  <label class="control-label col-sm-5" for="first_name">Имя</label>
						  <div class="col-sm-6">
							<input type="text" name="first_name" id="first_name" placeholder="Имя" value="<?php echo $current_user->first_name; ?>">
						  </div>
					    </div>
						
						<div class="form-group">
						  <label class="control-label col-sm-5" for="last_name">Фамилия</label>
						  <div class="col-sm-6">
							<input type="text" name="last_name" id="last_name" placeholder="Фамилия" value="<?php echo $current_user->last_name; ?>">
						  </div>
					    </div>
						
						<div class="form-group">
						  <label class="control-label col-sm-5" for="user_url">Сайт</label>
						  <div class="col-sm-6">
							<input type="text" name="user_url" id="user_url" placeholder="Сайт" value="<?php echo $current_user->user_url; ?>">
						  </div>
					    </div>

						<div class="form-group">
						  <label class="control-label col-sm-5" for="user_boi">Обо мне</label>
						  <div class="col-sm-6">
							<textarea rows="3" cols="30" id= "user_boi" name="description" placeholder="Обо мне"><?php echo $current_user->description; ?></textarea>
						  </div>
					    </div>

						<div class="form-group">
						  <label class="control-label col-sm-5" for="current_pass">Изменить пароль:</label>
						  <div class="col-sm-6">
							<input type="password" name="current_pass" id="current_pass" placeholder="Текущий пароль"><!-- если захотят поменять пароль, надо будет заполнить все 3 поля -->
						  </div>
					    </div>
						
						<div class="form-group">
						  <label class="control-label col-sm-5" for="pass1">Новый пароль:</label>
						  <div class="col-sm-6">
							<input type="password" name="pass1" id="pass1" placeholder="Новый пароль">
						  </div>
					    </div>

						<div class="form-group">
						  <label class="control-label col-sm-5" for="pass2">Повторите новый пароль:</label>
						  <div class="col-sm-6">
							<input type="password" name="pass2" id="pass2" placeholder="Повторите новый пароль">
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
							<input type="submit" value="Изменить"> <!-- субмит -->
						  </div>
						</div>						
						
						<input type="hidden" name="redirect_to" value="<?php echo $_SERVER['REQUEST_URI']; ?>"> <!-- куда отправим юзера если все прошло ок, в нашем случае это не понадобиться, а вообще может если форма сквозная -->
						<input type="hidden" name="nonce" value="<?php echo wp_create_nonce('edit_profile_nonce'); ?>"> <!-- поле со строкой безопасности, будем проверять её в обработчике чтобы убедиться, что форма отправлена откуда надо -->
						<input type="hidden" name="action" value="edit_profile"> <!-- обязательное поле, по нему запустится нужная функция -->
						<div class="response"></div> <!-- ну сюда будем пихать ответ от сервера -->
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