<?if(!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true)die();
/** @var array $arParams */
/** @var array $arResult */
/** @global CMain $APPLICATION */
/** @global CUser $USER */
/** @global CDatabase $DB */
/** @var CBitrixComponentTemplate $this */
/** @var string $templateName */
/** @var string $templateFile */
/** @var string $templateFolder */
/** @var string $componentPath */
/** @var CBitrixComponent $component */
$this->setFrameMode(true);
?>
<div class="media">
    <? if ($arParams["DISPLAY_PICTURE"] != "N" && is_array($arResult["DETAIL_PICTURE"])): ?>
        <img
                src="<?= $arResult["DETAIL_PICTURE"]["SRC"] ?>"
                class="align-self-start mr-3" alt="<?= $arResult["DETAIL_PICTURE"]["ALT"] ?>"
                width="<?= $arResult["DETAIL_PICTURE"]["WIDTH"] ?>"
                height="<?= $arResult["DETAIL_PICTURE"]["HEIGHT"] ?>"
        />
    <? endif ?>
    <div class="media-body">
        <h5 class="mt-0"><? echo $arResult["NAME"]; ?></h5>
        <? if ($arParams["DISPLAY_DATE"] != "N" && $arResult["DISPLAY_ACTIVE_FROM"]): ?>
            <small><?= $arResult["DISPLAY_ACTIVE_FROM"] ?></small>
        <? endif ?>
        <hr>
        <p>
            <? if (strlen($arResult["DETAIL_TEXT"]) > 0): ?>
                <? echo $arResult["DETAIL_TEXT"]; ?>
            <? endif ?>
        </p>
    </div>
</div>