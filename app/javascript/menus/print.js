$(document).ready(function(){
   $(".print-btn").click(function() {

     var printArea = $(".print-area");

     $('body').append('<div id="print" class="printBc"></div>');
     $(printArea).clone().appendTo('#print');

     $('body > :not(#print)').css('display','none');

     window.print();

     $('#print').remove();

     $('body > :not(#print)').css('display','block');
   });
 })