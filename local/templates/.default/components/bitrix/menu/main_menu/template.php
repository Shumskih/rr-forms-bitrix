<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die(); ?>
<header>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
        <h5 class="my-0 mr-md-auto font-weight-normal">
            <? if (getRequestUri() != '/'): ?>
                <a href="/">
                    Blog
                </a>
            <? else: ?>
                Blog
            <? endif; ?>
        </h5>
        <? if (!empty($arResult)): ?>
            <nav class="my-2 my-md-0 mr-md-3">
                <a href="#" class="p-2 text-dark call_form">Показать форму</a>
				<a href="#" class="p-2 text-dark call_form2">Показать форму 2</a>
                <?
                foreach ($arResult as $arItem):
                    if ($arParams["MAX_LEVEL"] == 1 && $arItem["DEPTH_LEVEL"] > 1)
                        continue;
                    ?>
                    <a class="p-2 text-dark <?= $arItem["PARAMS"]["call-form"] ?>" href="<?= $arItem["LINK"] ?>"><?= $arItem["TEXT"] ?></a>
                <? endforeach ?>
            </nav>
        <? endif ?>
    </div>
</header>