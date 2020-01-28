<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Component");
?><?$APPLICATION->IncludeComponent(
	"shumskih:mycomponent", 
	".default", 
	array(
		"CACHE_TIME" => "3600",
		"CACHE_TYPE" => "A",
		"CHPU" => "/articles/",
		"IBLOCK_ID" => "1",
		"IBLOCK_TYPE" => "articles",
		"SECTION_IDS" => "",
		"SORT" => "1",
		"COMPONENT_TEMPLATE" => ".default"
	),
	false
);?><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>