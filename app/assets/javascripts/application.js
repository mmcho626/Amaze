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
//= require activestorage
//= require turbolinks
//= require_tree .



// プルダウン部分 //

// js-user-link   プルダウンを開くボタン。イベント発火。
// user-sub-list  プルダウンのリスト（マイページ、ログアウトボタン）。複数あるので、thisでまとめ。

$(function(){

    $('.js-user-link').each(function(){

        $(this).on('click',function(){

            $("+.user-sub-list",this).slideToggle();

            return false;

        });

    });

});



//modal-open-btn   モーダルを開くボタン。イベント発火。
//overlay          モーダルの背景
//modal-close-btn  モーダルウインドウを閉じるボタン




// 投稿詳細ページ 「いいねしたユーザ一覧を見る」用 //

document.addEventListener(

  "DOMContentLoaded", e => {

    let modal_open = document.getElementById("modal-open-favorite-btn");

    modal_open.onclick = function () {

      $('#overlay').fadeIn();

      document.getElementById('modal-close-btn').onclick = function () {

        $('#overlay').fadeOut();

      };

    };

  },

  false

);


