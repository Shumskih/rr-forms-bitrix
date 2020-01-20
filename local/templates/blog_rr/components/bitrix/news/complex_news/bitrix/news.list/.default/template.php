<? if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED !== true) die();
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

<div class="card-deck">
    <? foreach ($arResult["ITEMS"] as $arItem): ?>
        <?
        $this->AddEditAction(
            $arItem['ID'],
            $arItem['EDIT_LINK'],
            CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_EDIT")
        );
        $this->AddDeleteAction(
            $arItem['ID'],
            $arItem['DELETE_LINK'],
            CIBlock::GetArrayByID($arItem["IBLOCK_ID"], "ELEMENT_DELETE"),
            array("CONFIRM" => GetMessage('CT_BNL_ELEMENT_DELETE_CONFIRM'))
        );
        ?>
        <div class="card mb-2">
            <a href="<? echo $arItem["DETAIL_PAGE_URL"] ?>">
                <img alt="<? echo $arItem["NAME"] ?>" class="card-img-top"
                     src="<?= $arItem["PREVIEW_PICTURE"]["SRC"] ?>">
            </a>
            <div class="card-body">
                <h5 class="card-title"><? echo $arItem["NAME"] ?></h5>
                <? if ($arParams["DISPLAY_PREVIEW_TEXT"] != "N" && $arItem["PREVIEW_TEXT"]): ?>
                    <p class="card-text"><? echo $arItem["PREVIEW_TEXT"]; ?></p>
                <? endif; ?>
                <a href="<? echo $arItem["DETAIL_PAGE_URL"] ?>">Read more...</a>
            </div>
            <? if ($arParams["DISPLAY_DATE"] != "N" && $arItem["DISPLAY_ACTIVE_FROM"]): ?>
                <div class="card-footer">
                    <small class="text-muted"><? echo $arItem["DISPLAY_ACTIVE_FROM"] ?></small>
                </div>
            <? endif ?>
        </div>
    <? endforeach; ?>
</div>