<?
require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/main/include/prolog_before.php");
CPageOption::SetOptionString(
    'iblock',
    'FORMAT_ACTIVE_DATES',
    'SHORT',
    false
);
require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/modules/main/include/prolog_after.php");
$APPLICATION->SetTitle("Component");
?>
<? $APPLICATION->IncludeComponent(
	"shumskih:mycomponent", 
	".default", 
	array(
		"CACHE_TIME" => "3600",
		"CACHE_TYPE" => "A",
		"CHPU" => "/articles/",
		"IBLOCK_ID" => "1",
		"IBLOCK_TYPE" => "articles",
		"SECTION_IDS" => "",
		"SORT" => "0",
		"COMPONENT_TEMPLATE" => ".default",
	),
	false
); ?><? require($_SERVER["DOCUMENT_ROOT"] . "/bitrix/footer.php"); ?>