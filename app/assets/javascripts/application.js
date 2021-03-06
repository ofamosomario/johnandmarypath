// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks

//= require jquery-1.10.2
//= require bootstrap.min
//= require bootstrap-notify
//= require paper-dashboard
//= require cocoon
//= require best_in_place

//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap

//= require_tree .

$(document).ready(function() {
  $(".best_in_place").best_in_place();
  $('#datatable').DataTable( {
      responsive: true,
      "language": {
        'search': 'Pesquisar:',
        'loadingRecords': 'Carregando registros...',
        'lengthMenu': 'Exibindo _MENU_ registros por página',
        'zeroRecords': 'Nenhum registro foi encontrado, desculpe.',
        'info': 'Exibindo página _PAGE_ de _PAGES_',
        'infoEmpty': 'Nenhum registro disponível',
        'infoFiltered': '(filtrado de _MAX_ registros)',
        paginate: {
            first:      "Primeiro",
            previous:   "Anterior",
            next:       "Próximo",
            last:       "Último"
        }
      }
  });
});