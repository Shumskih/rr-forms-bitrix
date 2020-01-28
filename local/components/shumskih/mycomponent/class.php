<? if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) die();

use \Bitrix\Main\Loader;
use \Bitrix\Main\Application;

class ShumskihMyComponent extends CBitrixComponent
{
    private $_request;
    private $navParams;

    /**
     * Проверка наличия модулей требуемых для работы компонента
     * @return bool
     * @throws Exception
     */
    private function _checkModules()
    {
        if (!Loader::includeModule('iblock')) {
            throw new \Exception('Не загружены модули необходимые для работы компонента');
        }

        return true;
    }

    /**
     * Обертка над глобальной переменной
     * @return CAllMain|CMain
     */
    private function _app()
    {
        global $APPLICATION;
        return $APPLICATION;
    }

    /**
     * Обертка над глобальной переменной
     * @return CAllUser|CUser
     */
    private function _user()
    {
        global $USER;
        return $USER;
    }

    /**
     * Подготовка параметров компонента
     * @param $arParams
     * @return mixed
     */
    public function onPrepareComponentParams($arParams)
    {
        return $arParams;
    }

    protected function getResult()
    {
        $filter = array(
            'IBLOCK_TYPE' => $this->arParams['IBLOCK_TYPE'],
            'IBLOCK_ID' => $this->arParams['IBLOCK_ID'],
            'ACTIVE' => 'Y'
        );
        $select = array(
            'ID',
            'NAME',
            'DATE_ACTIVE_FROM',
            'DETAIL_PAGE_URL',
            'PREVIEW_TEXT',
            'PREVIEW_TEXT_TYPE',
            'PREVIEW_PICTURE'
        );
        $iterator = \CIBlockElement::GetList(array('SORT' => $this->arParams['SORT']),
            $filter,
            false,
            false,
            $select);

        while ($element = $iterator->GetNext()) {
            $this->arResult['ITEMS'][$element['ID']] = array(
                'ID' => $element['ID'],
                'NAME' => $element['NAME'],
                'DATE' => $element['DATE_ACTIVE_FROM'],
                'URL' => $element['DETAIL_PAGE_URL'],
                'TEXT' => $element['PREVIEW_TEXT']
            );
            $iterator2 = CFile::GetByID($element['PREVIEW_PICTURE']);
            while ($image = $iterator2->getNext()) {
                $this->arResult['ITEMS'][$element['ID']]['PREVIEW_PICTURE'] = '/upload/' . $image['SUBDIR'] . '/' . $image['FILE_NAME'];
                $this->arResult['ITEMS'][$element['ID']]['PREVIEW_PICTURE_HEIGHT'] = $image['WIDTH'];
                $this->arResult['ITEMS'][$element['ID']]['PREVIEW_PICTURE_WIDTH'] = $image['HEIGHT'];
            }
        }
    }

    /**
     * Точка входа в компонент
     * Должна содержать только последовательность вызовов вспомогательых ф-ий и минимум логики
     * всю логику стараемся разносить по классам и методам
     * @throws Exception
     */
    public function executeComponent()
    {
        $this->_app();

        $this->_checkModules();
        $this->getResult();
        $this->includeComponentTemplate();
    }
}