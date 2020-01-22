<? if ($arResult["isFormErrors"] == "Y"): ?><?= $arResult["FORM_ERRORS_TEXT"]; ?><? endif; ?>

<?= $arResult["FORM_NOTE"] ?>

<? if ($arResult["isFormNote"] != "Y") { ?>

    <?= $arResult["FORM_HEADER"] ?>

    <? foreach ($arResult["QUESTIONS"] as $FIELD_SID => $arQuestion) { ?>

        <? if (is_array($arResult["FORM_ERRORS"]) && array_key_exists($FIELD_SID, $arResult['FORM_ERRORS'])): ?>
            <span class="error-fld"
                  title="<?= htmlspecialcharsbx($arResult["FORM_ERRORS"][$FIELD_SID]) ?>"></span>
        <? endif; ?>

        <div class="form-group">
            <?
            if (strpos($arQuestion["CAPTION"], "Согласие на обработку персональных данных") !== false)
                continue;
            ?>
            <label for="name"><?= $arQuestion["CAPTION"] ?><? if ($arQuestion["REQUIRED"] == "Y"): ?><?= $arResult["REQUIRED_SIGN"]; ?><? endif; ?></label>
            <?
            if (strpos($arQuestion["HTML_CODE"], 'class="inputtext"') !== false)
                echo str_replace('class="inputtext"', 'class="form-control"', $arQuestion["HTML_CODE"]);
            if (strpos($arQuestion["HTML_CODE"], 'class="inputtextarea"') !== false)
                echo str_replace('class="inputtextarea"', 'class="form-control"', $arQuestion["HTML_CODE"]);
            ?>
        </div>
        <?
    } //endwhile
    ?>

    <?
    if ($arResult["isUseCaptcha"] == "Y") {
        ?>
        <div class="card" style="width: 100%;">
            <div class="card-body">
                <h5 class="card-title"><?= GetMessage("FORM_CAPTCHA_TABLE_TITLE") ?></h5>
                <div class="mb-3">
                    <input type="hidden" name="captcha_sid"
                           value="<?= htmlspecialcharsbx($arResult["CAPTCHACode"]); ?>"/><img
                        src="/bitrix/tools/captcha.php?captcha_sid=<?= htmlspecialcharsbx($arResult["CAPTCHACode"]); ?>"
                        width="180" height="40"/>
                </div>
                <p class="card-text"><?= GetMessage("FORM_CAPTCHA_FIELD_TITLE"); ?><?= $arResult["REQUIRED_SIGN"]; ?></p>
                <input type="text" name="captcha_word" size="30" maxlength="50" value="" class="inputtext"/>
            </div>
        </div>
        <?
    } // isUseCaptcha
    ?>

    <div class="mt-3 mb-3">
        <input class="btn btn-outline-info" <?= (intval($arResult["F_RIGHT"]) < 10 ? "disabled=\"disabled\"" : ""); ?>
               type="submit"
               name="web_form_submit"
               value="<?= htmlspecialcharsbx(strlen(trim($arResult["arForm"]["BUTTON"])) <= 0 ? GetMessage("FORM_ADD") : $arResult["arForm"]["BUTTON"]); ?>"/>

        <? if ($arResult["F_RIGHT"] >= 15): ?>
            &nbsp;<input type="hidden" name="web_form_apply" value="Y"/>
            <input type="submit" class="btn btn-outline-info" name="web_form_apply"
                   value="<?= GetMessage("FORM_APPLY") ?>"/>
        <? endif; ?>
    </div>
    <?= $arResult["REQUIRED_SIGN"]; ?> - <?= GetMessage("FORM_REQUIRED_FIELDS") ?>
    <?= $arResult["FORM_FOOTER"] ?>
    <?
} //endif (isFormNote)
?>