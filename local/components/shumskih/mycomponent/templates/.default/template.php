<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();

use Bitrix\Main\Diag\Debug;
use Bitrix\Main\Localization\Loc;

//Debug::dump($arParams);
//Debug::dump($arResult);
?>
<ul class="nav justify-content-end mb-3">
    <li class="nav-item">
        <a <? if ($_GET["date"] == "desc"): ?> class="nav-link disabled" tabindex="-1" aria-disabled="true" <? endif; ?>
                class="nav-link" href="<?= $arResult["SECTION_PAGE_URL"] ?>?date=desc">Новые сверху</a>
    </li>
    <li class="nav-item">
        <a <? if ($_GET["date"] == "asc"): ?> class="nav-link disabled" tabindex="-1" aria-disabled="true" <? endif; ?>
                class="nav-link" href="<?= $arResult["SECTION_PAGE_URL"] ?>?date=asc">Старые сверху</a>
    </li>
</ul>
<div class="card-deck">
    <? foreach ($arResult['ITEMS'] as $arItem) : ?>
        <div class="card mb-2">
            <a href="<?= $arParams['CHPU'] . $arItem['URL'] ?>">
                <img class="card-img-top" src="<?= $arItem['PREVIEW_PICTURE'] ?>" alt="<?= $arItem['NAME'] ?>">
            </a>
            <div class="card-body">
                <h5 class="card-title"><? echo $arItem['NAME'] ?></h5>
                <p class="card-text"><? echo $arItem['TEXT'] ?></p>
                <a href="<?= $arParams['CHPU'] . $arItem['URL'] ?>"><?= GetMessage("READ_MORE") ?></a>
            </div>
            <div class="card-footer">
                <small class="text-muted"><?= $arItem["DATE"] ?></small>
            </div>
        </div>
    <? endforeach; ?>
</div>