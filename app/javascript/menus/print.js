//一度画面を消してから、再表示
$(document).ready(function(){
    //ここでプリントボタンというのを発火させる
   $(".print-btn").click(function() {
//printエリアの選択
     var printArea = $(".print-area");

     $('body').append('<div id="print" class="printBc"></div>');
     $(printArea).clone().appendTo('#print');

     $('body > :not(#print)').css('display','none');

     window.print();

     $('#print').remove();

     $('body > :not(#print)').css('display','block');
   });
 })