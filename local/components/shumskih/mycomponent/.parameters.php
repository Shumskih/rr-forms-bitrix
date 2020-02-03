<?if (!defined("B_PROLOG_INCLUDED") || B_PROLOG_INCLUDED!==true) die();

/**
 * @var string $componentPath
 * @var string $componentName
 * @var array $arCurrentValues
 * */

use Bitrix\Main\Loader;
use Bitrix\Main\Localization\Loc;

try {
    if (!Loader::includeModule("iblock")) {
        throw new \Exception('Не загружены модули необходимые для работы компонента');
    }
} catch (\Bitrix\Main\LoaderException $e) {
}

// типы инфоблоков
$arIBlockType = CIBlockParameters::GetIBlockTypes();

// инфоблоки выбранного типа
$arIBlock = [];
$iblockFilter = !empty($arCurrentValues['IBLOCK_TYPE'])
    ? ['TYPE' => $arCurrentValues['IBLOCK_TYPE'], 'ACTIVE' => 'Y']
    : ['ACTIVE' => 'Y'];

$rsIBlock = CIBlock::GetList(['SORT' => 'ASC'], $iblockFilter);
while ($arr = $rsIBlock->Fetch()) {
    $arIBlock[$arr['ID']] = '['.$arr['ID'].'] '.$arr['NAME'];
}
unset($arr, $rsIBlock, $iblockFilter);

$sort = array(
    'ASC',
    'DESC',
);

$arComponentParameters = [
    // группы в левой части окна
    "GROUPS" => [
        "SETTINGS" => [
            "NAME" => Loc::getMessage('SHUMSKIH_MYCOMPONENT_PROP_SETTINGS'),
            "SORT" => 550,
        ],
    ],
    // поля для ввода параметров в правой части
    "PARAMETERS" => [
        // Произвольный параметр типа СПИСОК
        "IBLOCK_TYPE" => [
            "PARENT" => "SETTINGS",
            "NAME" => Loc::getMessage('SHUMSKIH_MYCOMPONENT_PROP_IBLOCK_TYPE'),
            "TYPE" => "LIST",
            "ADDITIONAL_VALUES" => "Y",
            "VALUES" => $arIBlockType,
            "REFRESH" => "Y"
        ],
        "IBLOCK_ID" => [
            "PARENT" => "SETTINGS",
            "NAME" => Loc::getMessage('SHUMSKIH_MYCOMPONENT_PROP_IBLOCK_ID'),
            "TYPE" => "LIST",
            "ADDITIONAL_VALUES" => "Y",
            "VALUES" => $arIBlock,
            "REFRESH" => "Y"
        ],
        "CHPU" => [
            "PARENT" => "SETTINGS",
            "NAME" => Loc::getMessage('SHUMSKIH_MYCOMPONENT_PROP_CHPU'),
            "TYPE" => "STRING",
            "ADDITIONAL_VALUES" => "Y"
        ],
        // Настройки кэширования
        'CACHE_TIME' => ['DEFAULT' => 3600],
    ]
];