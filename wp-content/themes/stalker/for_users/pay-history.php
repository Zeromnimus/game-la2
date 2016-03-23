				<?php if (!is_user_logged_in()) { // если юзер не залогинен, стандартная ф-я вп ?>
				<p>У вас нет доступа к этой странице.</p>
				<script type="text/javascript" defer>
					   window.setTimeout('document.location.href= "<?php echo get_site_url(); ?>"', 5000);
				</script>				

				<?php } else { // если залогинен, покажем форму таблицу оплаты ?>
					<div class="table-responsive">
					  <table class="table table-bordered">
					    <thead>
						  <tr>
							<td>Номер</td>
							<td>Сумма в рублях</td>
							<td>Адены</td>
							<td>Статус</td>
							<td>Время</td>
						  </tr>
						</thead>
						<tbody>
						  <tr>
							<td>10</td>
							<td>150</td>
							<td>150 000 000, 0</td>
							<td>В процессе</td>
							<td><?php echo date("d.m.Y h:m:s"); ?></td>							
						  </tr>
						  <tr>
							<td>9</td>
							<td>250</td>
							<td>250 000 000, 0</td>
							<td>Оплачено</td>
							<td><?php echo date("d.m.Y h:m:s"); ?></td>
						  </tr>
						  <tr>
							<td colspan="5"></td>
						  </tr>
						  <tr>
							<td>1</td>
							<td>150</td>
							<td>150 000 000, 0</td>
							<td>Оплачено</td>
							<td><?php echo date("d.m.Y h:m:s"); ?></td>
						  </tr>						  
						</tbody>
					  </table>
					</div>
				<?php } ?>