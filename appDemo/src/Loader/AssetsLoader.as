package Loader
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	 
	/**
	 * ...
	 * @author Angela Gabriela
	 */
	
	public class AssetsLoader
	{
		private static var m_current:AssetsLoader;
		private var m_content:MovieClip;
		
		private var dispatcher:EventDispatcher = new EventDispatcher;
		public static const ASSETSLOADED:String = "assetsLoaded";
		
		
		public function loadFrom(asset:String):void
		{
			var loader:Loader = new Loader();			
			loader.load(new URLRequest(asset));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandle);
		}
		
		public function getComponentByName(name:String):DisplayObject
		{
			return m_content.getChildByName(name);
		}
		
		private function completeHandle(e:Event):void
		{
			m_content = (e.target as LoaderInfo).loader.content as MovieClip;
			dispatcher.dispatchEvent(new Event(ASSETSLOADED));
		}
		
		public function addEventListener(event:String, func:Function):void
		{
			dispatcher.addEventListener(event, func);
		}
		
		static public function get current():AssetsLoader 
		{
			return m_current;
		}
		
		static public function set current(value:AssetsLoader):void 
		{
			m_current = value;
		}
	}

}