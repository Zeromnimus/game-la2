				<?php if (!is_user_logged_in()) { // если юзер не залогинен, стандартная ф-я вп ?>
				<p>У вас нет доступа к этой странице.</p>
				<script type="text/javascript" defer>
					   window.setTimeout('document.location.href= "<?php echo get_site_url(); ?>"', 5000);
				</script>				
				<?php } else { // если залогинен, покажем форму таблицу персонажей ?>
					<div class="table-responsive">
					  <table class="table table-bordered">
					    <thead>
						  <tr>
							<td>Имя</td>
							<td>Уровень</td>
							<td>Класс</td>
							<td>Пол</td>
							<td>Раса</td>
						  </tr>
						</thead>
						<tbody>
						  <tr>
							<td>Legrande</td>
							<td>43</td>
							<td>Dark Mystic</td>
							<td>Female</td>
							<td>DarkElf</td>							
						  </tr>
						  <tr>
							<td>Mokar</td>
							<td>14</td>
							<td>Warrior</td>
							<td>Male</td>
							<td>Dwarf</td>
						  </tr>
						  <tr>
							<td colspan="5"></td>
						  </tr>
						  <tr>
							<td>BuHTuK</td>
							<td>99</td>
							<td>Feo Master</td>
							<td>Female</td>
							<td>Elf</td>
						  </tr>						  
						</tbody>
					  </table>
					</div>
				<?php } ?>