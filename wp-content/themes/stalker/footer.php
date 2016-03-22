      <div class="footer foot-back-img">
	  <!-- start extra-menu -->
	  <?php wp_nav_menu( array( 'theme_location' => 'extra-menu', 'container_class' => 'extra-menu' ) ); ?>
	  <!-- end extra-menu -->
        <p style="margin:140px 140px 0px 140px;"> 
			www.game-la2.ru &copy; 2016. <br />
			Создано в веб-студии <a href="www.1-byte.ru">www.1-byte.ru</a> <br />
			Дизайн <a href="www.opendg.ru">www.opendg.ru</a>
		</p>
      </div>

    </div> <!-- /container -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="<?php echo get_template_directory_uri(); ?>/js/jquery.form.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?php echo get_template_directory_uri(); ?>/js/bootstrap.min.js"></script>
	
	<!-- check on-line -->
    <script>  
        function show()  
        {  
            $.ajax({  
                url: "http://game-la2.ru/time.php",  
                cache: false,  
                success: function(html){  
                    $("#kamael").html(html); 
					$("#ertheia").html(html);
					
					$("#kamael").css("color", "green");
					$("#ertheia").css("color", "green");
					$("#darkelf").css("color", "red");
                }  
            });  
        }  
		
        $(document).ready(function(){  
		var i = 0;
			console.log('Get time > ' + i);
            show(i++);
			
			setTimeout(function run() {
			  show(i);
			  setTimeout(run, 1000);
			}, 1000);  

        });  
		
		
    </script> 	
	<?php wp_footer(); ?>
  </body>
</html>	  