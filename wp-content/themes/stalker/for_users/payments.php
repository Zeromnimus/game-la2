				<?php if (!is_user_logged_in()) { // если юзер не залогинен, стандартная ф-я вп ?>
				<p>У вас нет доступа к этой странице.</p>
				<script type="text/javascript" defer>
					   window.setTimeout('document.location.href= "<?php echo get_site_url(); ?>"', 5000);
				</script>				

				<?php } else { // если залогинен, покажем форму для оплаты ?>
				<form name="loginform" id="loginform" method="post" class="userform form-horizontal" role="form" action=""> <!-- обычная форма, по сути нам важен только класс -->
				
					  <div class="form-group">
						<label class="col-sm-5 control-label" for="pay-system">Платежная система*</label>
						<div class="col-sm-6">
						  <select class="form-control" name="pay-system" id="pay-system">
							<option name="Robokassa" value="1">ROBOKASSA</option>
						  </select>
						  <p class="help-block">Выбирайте систему!</p>
						</div>
					  </div>
					  
					  <div class="form-group">
						<label class="control-label col-sm-5" for="tugriki">Тугрики*</label>
						<div class="col-sm-6">
						  <input type="text" class="form-control" name="tugriki" id="tugriki" placeholder="150" value="150">
						  <p class="help-block">
						  Количество аден, которое вы желаете получить в игре. Курс: 1кк аден = 1.0 руб. Минимальное значение = 150 руб.
						  </p>
						</div>
					  </div>
					  
					  <div class="form-group"> 
						<div class="col-sm-offset-5 col-sm-6">
						  <input type="submit" value="ВНЕСТИ" />
						</div>
					  </div>
					  
					<input type="hidden" name="redirect_to" value="<?php echo $_SERVER['REQUEST_URI']; ?>"> <!-- куда отправим юзера если все прошло ок -->
					<input type="hidden" name="nonce" value="<?php echo wp_create_nonce('login_me_nonce'); ?>"> <!-- поле со строкой безопасности, будем проверим её в обработчике чтобы убедиться, что форма отправлена откуда надо, аргумент login_me_nonce, конечно, лучше поменять на свой -->
					<input type="hidden" name="action" value="login_me"> <!-- обязательное поле, по нему запустится нужная функция -->
					<div class="response"></div> <!-- ну сюда будем пихать ответ от сервера -->
				</form>
				<?php } ?>