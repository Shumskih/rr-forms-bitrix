<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();

use Bitrix\Main\Diag\Debug;
use Bitrix\Main\Localization\Loc;

//Debug::dump($arParams);
//Debug::dump($arResult);
?>

<div class="card-deck">
    <? foreach ($arResult['ITEMS'] as $arItem) : ?>
        <div class="card mb-2">
            <a href="<? echo $arParams['CHPU'] . $arItem['URL'] ?>">
                <img class="card-img-top" src="<? echo $arItem['PREVIEW_PICTURE'] ?>" alt="<? echo $arItem['NAME'] ?>">
            </a>
            <div class="card-body">
                <h5 class="card-title"><? echo $arItem['NAME'] ?></h5>
                <p class="card-text"><? echo $arItem['TEXT'] ?></p>
                <a href="<? echo $arParams['CHPU'] . $arItem['URL'] ?>"><? echo GetMessage("READ_MORE") ?></a>
            </div>
            <div class="card-footer">
                <small class="text-muted"><? echo $arItem["DATE"] ?></small>
            </div>
        </div>
    <? endforeach; ?>
</div>