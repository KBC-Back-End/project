/**
 * 
 */
 
 $(document).ready(function(){
 	$('.dpt2').hide();
 	$('.gnb > li').mouseenter(function(){
 	$(this).children('.dpt2').stop().slideDown();
 	});
 	
 	$('.gnb > li').mouseleave(function(){
 	$(this).children('.dpt2').stop().slideUp();
 	});
 });