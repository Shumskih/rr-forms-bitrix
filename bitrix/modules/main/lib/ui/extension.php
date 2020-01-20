<?

namespace Bitrix\Main\UI;

use Bitrix\Main\Application;
use Bitrix\Main\IO\File;
use Bitrix\Main\IO\Directory;
use Bitrix\Main\IO\Path;

class Extension
{
	/**
	 * Loads specified extension
	 * @param $extNames
	 * @throws \Bitrix\Main\LoaderException
	 */
	public static function load($extNames)
	{
		if (!is_array($extNames))
		{
			$extNames = [$extNames];
		}

		foreach ($extNames as $extName)
		{
			if (static::register($extName))
			{
				\CJSCore::init($extName);
			}
		}
	}

	/**
	 * @param $extName
	 * @return bool
	 * @throws \Bitrix\Main\LoaderException
	 */
	public static function register($extName)
	{
		$extension = static::getConfig($extName);
		if ($extension !== null)
		{
			static::registerAssets($extName, $extension);

			return true;
		}

		if (preg_match("/^((?P<MODULE_ID>[\w\.]+):)?(?P<EXT_NAME>[\w\.\-]+)$/", $extName, $matches))
		{
			if (strlen($matches['MODULE_ID']) > 0 && $matches['MODULE_ID'] !== 'main')
			{
				\Bitrix\Main\Loader::includeModule($matches['MODULE_ID']);
			}
			$extName = $matches['EXT_NAME'];
		}

		return \CJSCore::isExtRegistered($extName);
	}

	/**
	 * @param $id
	 * @param array $options
	 */
	public static function registerAssets($id, array $options)
	{
		\CJSCore::registerExt($id, $options);
	}

	protected static function normalizeAssetPath($path, $extensionPath)
	{
		if (is_array($path))
		{
			$result = [];
			foreach ($path as $key => $item)
			{
				$result[] = static::normalizeAssetPath($item, $extensionPath);
			}

			return $result;
		}

		if (is_string($path) && $path !== '')
		{
			if (Path::isAbsolute($path))
			{
				return $path;
			}

			return Path::combine($extensionPath, $path);
		}

		return $path;
	}

	/**
	 * Gets extension config
	 * @param $extName
	 * @return array|mixed|null
	 */
	public static function getConfig($extName)
	{
		$extensionPath = static::getPath($extName);
		if ($extensionPath === null)
		{
			return null;
		}

		$configFile = Application::getDocumentRoot().$extensionPath."/config.php";
		if (!File::isFileExists($configFile))
		{
			return null;
		}

		$config = include($configFile);

		if (is_array($config))
		{
			if (isset($config['js']))
			{
				$config['js'] = static::normalizeAssetPath($config['js'], $extensionPath);
			}

			if (isset($config['css']))
			{
				$config['css'] = static::normalizeAssetPath($config['css'], $extensionPath);
			}

			$langDirectory = Application::getDocumentRoot().$extensionPath.'/lang/';

			if (Directory::isDirectoryExists($langDirectory))
			{
				if (isset($config["lang"]))
				{
					$config["lang"] = static::normalizeAssetPath($config["lang"], $extensionPath);

					if (is_array($config["lang"]))
					{
						$config["lang"][] = $extensionPath."/config.php";
					}
					else
					{
						$config["lang"] = [$config["lang"], $extensionPath."/config.php"];
					}
				}
				else
				{
					$config["lang"] = $extensionPath."/config.php";
				}
			}
		}


		return is_array($config) ? $config : null;
	}

	/**
	 * @param $extName
	 * @return array|bool|mixed|\SplFixedArray|string|null
	 * @throws \Bitrix\Main\IO\FileNotFoundException
	 */
	public static function getBundleConfig($extName)
	{
		$extensionPath = static::getPath($extName);

		if ($extensionPath === null)
		{
			return null;
		}

		$configFilePath = Application::getDocumentRoot().$extensionPath."/bundle.config.js";
		$configFile = new File($configFilePath);

		if (!$configFile->isExists())
		{
			return null;
		}

		$fileContent = str_replace("module.exports = ", "", $configFile->getContents());
		$fileContent = str_replace("};", "}", $fileContent);

		return \CUtil::JsObjectToPhp($fileContent);
	}

	private static function getPath($extName)
	{
		if (!is_string($extName))
		{
			return null;
		}

		$namespaces = explode(".", $extName);
		if (count($namespaces) < 2)
		{
			return null;
		}

		$path = "js";
		foreach ($namespaces as $namespace)
		{
			if (!preg_match("/^[a-z0-9_\\.\\-]+$/i", $namespace))
			{
				return null;
			}

			$path .= "/".$namespace;
		}

		$localPath = \getLocalPath($path);

		return is_string($localPath) && !empty($localPath) ? $localPath : null;
	}

	/**
	 * @param $extName
	 * @return bool|string|null
	 * @throws \Bitrix\Main\LoaderException
	 */
	public static function getHtml($extName)
	{
		$isRegistered = static::register($extName);

		if ($isRegistered)
		{
			return \CJSCore::getHTML($extName);
		}

		return null;
	}

	/**
	 * @param $extName
	 * @return array
	 */
	public static function getAssets($extName)
	{
		$assets = ['js' => [], 'css' => []];

		if (is_array($extName))
		{
			foreach ($extName as $key => $name)
			{
				$currentAssets = static::getAssets($name);
				$assets['js'] = array_merge($assets['js'], $currentAssets['js']);
				$assets['css'] = array_merge($assets['css'], $currentAssets['css']);
			}

			return $assets;
		}

		if (is_string($extName))
		{
			$config = static::getConfig($extName);

			if (empty($config))
			{
				$config = \CJSCore::getExtInfo($extName);
			}

			if (isset($config['rel']))
			{
				$relAssets = static::getAssets($config['rel']);
				$assets['js'] = array_merge($assets['js'], $relAssets['js']);
				$assets['css'] = array_merge($assets['css'], $relAssets['css']);
			}

			if (isset($config['js']))
			{
				if (is_array($config['js']))
				{
					$assets['js'] = array_merge($assets['js'], $config['js']);
				}

				if (is_string($config['js']) && $config['js'] !== '')
				{
					$assets['js'][] = $config['js'];
				}
			}

			if (isset($config['css']))
			{
				if (is_array($config['css']))
				{
					$assets['css'] = array_merge($assets['css'], $config['css']);
				}

				if (is_string($config['css']) && $config['css'] !== '')
				{
					$assets['css'][] = $config['css'];
				}
			}
		}

		$assets['js'] = array_unique($assets['js']);
		$assets['css'] = array_unique($assets['css']);

		return $assets;
	}

	/**
	 * @param $extName
	 * @return array
	 */
	public static function getDependencyList($extName)
	{
		return self::getDependencyListRecursive($extName);
	}

	/**
	 * @param $extName
	 * @param array $option
	 * @return array
	 */
	public static function getResourceList($extName, $option = [])
	{
		$skipCoreJS = isset($option['skip_core_js']) && $option['skip_core_js'] === true;
		$withDependency = !(isset($option['with_dependency']) && $option['with_dependency'] === false);
		$skipExtensions = isset($option['skip_extensions'])? $option['skip_extensions']: [];

		\CJSCore::init();

		$alreadyResolved = $skipExtensions;
		if ($skipCoreJS)
		{
			$alreadyResolved[] = 'core';
		}

		$extensions = [];
		if ($withDependency)
		{
			$extNameList = is_array($extName)? $extName: [$extName];
			foreach ($extNameList as $extName)
			{
				if (in_array($extName, $alreadyResolved))
				{
					continue;
				}

				self::getDependencyListRecursive($extName, true, true, $extensions, $alreadyResolved);
			}
		}
		else
		{
			$extNameList = is_array($extName)? $extName: [$extName];
			foreach ($extNameList as $extName)
			{
				if (in_array($extName, $alreadyResolved))
				{
					continue;
				}
				else
				{
					$alreadyResolved[] = $extName;
				}

				$extensions[] = [$extName, self::getConfig($extName)];
			}
		}

		foreach ($extensions as $index => $extension)
		{
			if(isset($extension[1]['oninit']) && is_callable($extension[1]['oninit']))
			{
				$callbackResult = call_user_func_array(
					$extension[1]['oninit'],
					array($extension[1])
				);

				if(is_array($callbackResult))
				{
					foreach($callbackResult as $key => $value)
					{
						if(!is_array($value))
						{
							$value = array($value);
						}

						if(!isset($extension[1][$key]))
						{
							$extension[1][$key] = array();
						}
						elseif(!is_array($extension[1][$key]))
						{
							$extension[1][$key] = array($extension[1][$key]);
						}

						$extensions[$index][1][$key] = array_merge($extension[1][$key], $value);
					}
				}

				unset($extensions[$index][1]['oninit']);
			}
		}

		$result = [
			'js' => [],
			'css' => [],
			'lang' => [],
			'lang_additional' => [],
			'layout' => [],
			'options' => [],
		];

		foreach ($extensions as $extension)
		{
			foreach (['js', 'css', 'lang', 'lang_additional', 'layout', 'options'] as $key)
			{
				if (is_array($extension[1]) && array_key_exists($key, $extension[1]))
				{
					if (is_array($extension[1][$key]))
					{
						$result[$key] = array_merge($result[$key], $extension[1][$key]);
					}
					else
					{
						$result[$key][] = $extension[1][$key];
					}
				}
			}
		}

		return $result;
	}

	/**
	 * @param $name
	 * @param bool $storeConfig
	 * @param bool $storeSelf
	 * @param array $resultList
	 * @param array $alreadyResolved
	 * @return array
	 */
	private static function getDependencyListRecursive($name, $storeConfig = false, $storeSelf = false, &$resultList = [], &$alreadyResolved = [])
	{
		$config = self::getConfig($name);
		if ($config === null)
		{
			$namespaces = explode(".", $name);
			if (count($namespaces) == 1)
			{
				$config = self::getCoreConfigForDependencyList($name, $storeConfig, $resultList, $alreadyResolved);
			}
			else
			{
				$alreadyResolved[] = $name;
			}
		}
		else
		{
			$alreadyResolved[] = $name;
		}

		if ($config && !empty($config['rel']))
		{
			foreach ($config['rel'] as $dependencyName)
			{
				if(in_array($dependencyName, $alreadyResolved))
				{
					continue;
				}

				$dependencyConfig = self::getConfig($dependencyName);
				if ($dependencyConfig === null)
				{
					$namespaces = explode(".", $dependencyName);
					if (count($namespaces) == 1)
					{
						$dependencyConfig = self::getCoreConfigForDependencyList($dependencyName, $storeConfig, $resultList, $alreadyResolved);
					}
				}

				if(empty($dependencyConfig['rel']))
				{
					if ($storeConfig)
					{
						$resultList[] = [$dependencyName, $dependencyConfig];
					}
					else
					{
						$resultList[] = $dependencyName;
					}
				}
				else if(!in_array($dependencyName, $alreadyResolved))
				{
					self::getDependencyListRecursive($dependencyName, $storeConfig, true, $resultList, $alreadyResolved);
				}
			}
		}

		if ($storeSelf)
		{
			if ($storeConfig)
			{
				$resultList[] = [$name, $config];
			}
			else
			{
				$resultList[] = $name;
			}
		}

		if (
			$storeConfig
			&& ($config && !empty($config['rel']) || $storeSelf)
		)
		{
			$uniqueArray = [];
			foreach ($resultList as $element)
			{
				$uniqueArray[$element[0]] = $element;
			}
			$resultList = array_values($uniqueArray);
		}
		else
		{
			$resultList = array_unique($resultList);
		}

		return $resultList;
	}

	private static function getCoreConfigForDependencyList($name, $storeConfig = false, &$resultList = [], &$alreadyResolved = [])
	{
		$alreadyResolved[] = $name;

		if (preg_match("/^((?P<MODULE_ID>[\w\.]+):)?(?P<EXT_NAME>[\w\.\-]+)$/", $name, $matches))
		{
			if (strlen($matches['MODULE_ID']) > 0 && $matches['MODULE_ID'] !== 'main')
			{
				\Bitrix\Main\Loader::includeModule($matches['MODULE_ID']);
			}

			$name = $matches['EXT_NAME'];

			$alreadyResolved[] = $name;
		}

		$config = \CJSCore::getExtInfo($name);
		if ($config)
		{
			if (!$config['skip_core'] && !in_array('core', $alreadyResolved))
			{
				$coreConfig = \CJSCore::GetCoreConfig();
				if ($storeConfig)
				{
					array_unshift($resultList, ['core', $coreConfig]);
				}
				else
				{
					array_unshift($resultList, 'core');
				}

				$alreadyResolved[] = 'core';
			}
		}
		else
		{
			$config = null;
		}

		return $config;
	}
}