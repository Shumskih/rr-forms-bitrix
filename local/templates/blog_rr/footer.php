</main>

<footer class="pt-4 my-md-5 pt-md-5 border-top">
    <div class="row col-12 col-md d-flex justify-content-center align-items-center">
        <div class="mb-2 mr-1">Blog</div>
        <small class="mb-1 text-muted">&copy; <?=
            '2019 - ' . date("Y"); ?>
        </small>
    </div>
</footer>

<div class="modal_background">
    <div class="modal_form">
        <a href="#" class="close_form">Закрыть форму</a>
        <? $APPLICATION->IncludeComponent(
            "bitrix:form.result.new",
            "popup",
            Array(
                "CACHE_TIME" => "3600",    // Время кеширования (сек.)
                "CACHE_TYPE" => "A",    // Тип кеширования
                "CHAIN_ITEM_LINK" => "",    // Ссылка на дополнительном пункте в навигационной цепочке
                "CHAIN_ITEM_TEXT" => "",    // Название дополнительного пункта в навигационной цепочке
                "EDIT_URL" => "",    // Страница редактирования результата
                "IGNORE_CUSTOM_TEMPLATE" => "N",    // Игнорировать свой шаблон
                "LIST_URL" => "",    // Страница со списком результатов
                "SEF_MODE" => "N",    // Включить поддержку ЧПУ
                "SUCCESS_URL" => "",    // Страница с сообщением об успешной отправке
                "USE_EXTENDED_ERRORS" => "N",    // Использовать расширенный вывод сообщений об ошибках
                "WEB_FORM_ID" => "4",    // ID веб-формы
                "AJAX_MODE" => "Y",
                "AJAX_OPTION_SHADOW" => "N",
                "AJAX_OPTION_JUMP" => "N",
                "AJAX_OPTION_STYLE" => "Y",
                "AJAX_OPTION_HISTORY" => "N",
                "COMPONENT_TEMPLATE" => ".default",
                "VARIABLE_ALIASES" => array(
                    "WEB_FORM_ID" => "WEB_FORM_ID",
                    "RESULT_ID" => "RESULT_ID",
                )
            ),
            false
        ); ?>
    </div>
</div>
</body>
</html>