		<div class="col-lg-3 r-side" id="sidebar-right">
		<?php if ( ! dynamic_sidebar('sidebar-right') ) : ?>
			<h4 class="block-title servers">Личный кабинет</h4>
			<div class="login-box">
				<style>
					input[type="checkbox"] { width: 15px; height: 15px; cursor: crosshair; }
					
					input { 
					  margin-bottom: 10px; 
					  background: #47505C;
					  text-indent: 4px;
					  border: 1px solid #999;
					  border-radius: 3px;
					  box-shadow: 0 0 1px 1px rgba(0,0,0,0);
					  transition: .17s linear;
					}
					input:focus {
					  outline: none;
					  box-shadow: 0 0 1px 1px #4d90f0;
					}
					input:focus::-moz-placeholder {
					  color: transparent;
					}
					input:focus::-webkit-input-placeholder {
					  color: transparent;
					}					
				</style>
				<?php if (is_user_logged_in()) { // если юзер залогинен, стандартная ф-я вп 
					$current_user = wp_get_current_user(); // получим данные о текущем залогиненом юзере ?>
				<p>Приветик, <?php echo $current_user->display_name; ?>. <a href="#" class="logout" data-nonce="<?php echo wp_create_nonce('logout_me_nonce'); ?>">Выйти</a></p> <!-- покажем приветствие и ссылку на выход, в атрибут data-nonce запишем строку для проверки безопасности -->
				<?php } else { // если не залогинен, покажем форму для логина ?>
				<form name="loginform" id="loginform" method="post" class="userform" action=""> <!-- обычная форма, по сути нам важен только класс -->
					<input type="text" name="log" id="user_login" placeholder="Логин или email"> <!-- сюда будут писать логин или email -->
					<input type="password" name="pwd" id="user_pass" placeholder="Пароль"> <!-- ну пароль -->
					<input name="rememberme" type="checkbox" value="forever"> Запомнить меня <!-- запомнить ли сессию, forever - навсегда,  -->
					<input type="submit" value="Войти"> <!-- субмит -->
					<input type="hidden" name="redirect_to" value="<?php echo $_SERVER['REQUEST_URI']; ?>"> <!-- куда отправим юзера если все прошло ок -->
					<input type="hidden" name="nonce" value="<?php echo wp_create_nonce('login_me_nonce'); ?>"> <!-- поле со строкой безопасности, будем проверим её в обработчике чтобы убедиться, что форма отправлена откуда надо, аргумент login_me_nonce, конечно, лучше поменять на свой -->
					<input type="hidden" name="action" value="login_me"> <!-- обязательное поле, по нему запустится нужная функция -->
					<div class="response"></div> <!-- ну сюда будем пихать ответ от сервера -->
				</form>
				<?php } ?>
			</div>
			<!-- нижний правый блок -->			
			<div class="col-lg-3 r-b-side">
			  <h4 class="block-title">ТОП 10 ПК/ПВП&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
				  <p>1. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				  <p>2. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				  <p>3. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				  <p>4. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				  <p>5. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				  <p>6. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				  <p>7. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				  <p>8. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				  <p>9. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				  <p>10. Andrew&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;57|126</p>
				<p ><a class="testt" href="#">Подробнее о лидерах</a></p>					
			</div>
		<?php endif; ?>
		</div>